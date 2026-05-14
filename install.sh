#!/bin/sh
set -e

REPO_OWNER="sapirrior"
REPO_NAME="gigs"
REPO_URL="https://github.com/$REPO_OWNER/$REPO_NAME"

# ANSI 256-color codes inspired by gig engine palette
CLR_CREAM="\033[38;5;230m"   # Headers / Info
CLR_SAND="\033[38;5;223m"    # Subheaders
CLR_SAGE="\033[38;5;108m"    # Actions, Commands (e.g. prompts)
CLR_TERRACOTTA_BOLD="\033[1;38;5;167m" # Errors (Bold Terracotta)
CLR_ORANGE_WARM="\033[38;5;214m" # Warnings
CLR_RESET="\033[0m"

# Message prefixes
INFO_PREFIX="${CLR_CREAM}[gig-install]${CLR_RESET}"
ERROR_PREFIX="${CLR_TERRACOTTA_BOLD}[ERROR]${CLR_RESET}"
WARN_PREFIX="${CLR_ORANGE_WARM}[WARNING]${CLR_RESET}"
ACTION_PREFIX="${CLR_SAGE}[ACTION]${CLR_RESET}"

# --- Detect Termux environment early ---
IS_TERMUX=false
if [ -n "$ANDROID_ROOT" ] && [ -d "/data/data/com.termux/files/usr/share" ]; then
    IS_TERMUX=true
fi

# --- 1. Check for root privileges ---
if ! "$IS_TERMUX"; then # Only check for root if NOT Termux
    if [ "$(id -u)" -ne 0 ]; then
        echo "$ERROR_PREFIX This script needs to run with root privileges (for installing to /usr/share)."
        echo "$INFO_PREFIX Please run again with '${CLR_SAGE}sudo ./install.sh${CLR_RESET}'"
        exit 1
    fi
fi
# Note: In Termux, id -u is never 0, but installing to $PREFIX/share is allowed without sudo.

# --- 2. Dependency Checks ---
check_dependency() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "$ERROR_PREFIX '$1' is not installed. Please install it to proceed."
        exit 1
    fi
}
echo "$INFO_PREFIX Checking for required dependencies..."
check_dependency "curl"
check_dependency "tar"
echo "$INFO_PREFIX All dependencies found."

# --- 3. Determine Target Directory ---
TARGET_BASE=""
if "$IS_TERMUX"; then
    # Termux environment
    TARGET_BASE="/data/data/com.termux/files/usr/share"
    echo "$INFO_PREFIX Detected ${CLR_SAGE}Termux${CLR_RESET} environment. Installation target base: ${CLR_SAND}$TARGET_BASE${CLR_RESET}"
else
    # Standard Unix-like environment
    TARGET_BASE="/usr/share"
    echo "$INFO_PREFIX Detected standard ${CLR_SAGE}Unix-like${CLR_RESET} environment. Installation target base: ${CLR_SAND}$TARGET_BASE${CLR_RESET}"
fi
TARGET_DIR="$TARGET_BASE/gig"
echo "$INFO_PREFIX Final installation target directory: ${CLR_SAND}$TARGET_DIR${CLR_RESET}"

# --- 4. Function for user confirmation ---
confirm_action() {
    printf "${ACTION_PREFIX} %s ${CLR_SAGE}(y/n)${CLR_RESET} " "$1"
    read -r response
    if ! echo "$response" | grep -Eq '^[Yy]$'; then
        echo "$WARN_PREFIX Action cancelled by user. Exiting."
        exit 0
    fi
}

# --- 5. Get Latest Release Info ---
echo "$INFO_PREFIX Fetching latest release information from ${CLR_SAGE}$REPO_URL${CLR_RESET}..."
RELEASE_INFO=$(curl -sL "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/latest")
DOWNLOAD_URL=$(echo "$RELEASE_INFO" | grep "tarball_url" | head -n 1 | cut -d '"' -f 4)
RELEASE_TAG=$(echo "$RELEASE_INFO" | grep "tag_name" | head -n 1 | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ] || [ -z "$RELEASE_TAG" ]; then
    echo "$ERROR_PREFIX Could not retrieve latest release information from GitHub API."
    echo "$INFO_PREFIX Please ensure releases are published for ${CLR_SAGE}$REPO_OWNER/$REPO_NAME${CLR_RESET}."
    exit 1
fi

echo "$INFO_PREFIX Found latest release: ${CLR_SAND}$RELEASE_TAG${CLR_RESET}"

# --- 6. Download ---
TEMP_DIR=$(mktemp -d)
TARBALL_NAME="$REPO_NAME-$RELEASE_TAG.tar.gz"
TARBALL_PATH="$TEMP_DIR/$TARBALL_NAME"

confirm_action "Confirm download of ${CLR_SAND}$TARBALL_NAME${CLR_RESET}? (${CLR_SAGE}$DOWNLOAD_URL${CLR_RESET})"
echo "$INFO_PREFIX Downloading ${CLR_SAND}$TARBALL_NAME${CLR_RESET} to ${CLR_SAND}$TEMP_DIR${CLR_RESET}..."
curl -L "$DOWNLOAD_URL" -o "$TARBALL_PATH"
echo "$INFO_PREFIX Download complete."

# --- 7. Extract ---
confirm_action "Confirm extraction of ${CLR_SAND}$TARBALL_NAME${CLR_RESET}?"
echo "$INFO_PREFIX Extracting ${CLR_SAND}$TARBALL_NAME${CLR_RESET}..."
# GitHub tarballs usually contain a top-level directory like 'owner-repo-HASH'
tar -xzf "$TARBALL_PATH" -C "$TEMP_DIR"
EXTRACTED_ROOT_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "$REPO_OWNER-$REPO_NAME-*" -print -quit)

if [ -z "$EXTRACTED_ROOT_DIR" ]; then
    echo "$ERROR_PREFIX Could not find extracted root directory."
    echo "$INFO_PREFIX Extraction might have failed or tarball structure is unexpected."
    exit 1
fi

SOURCE_GIGS_DIR="$EXTRACTED_ROOT_DIR/gigs"
if [ ! -d "$SOURCE_GIGS_DIR" ]; then
    echo "$ERROR_PREFIX 'gigs' directory not found inside the extracted tarball."
    echo "$INFO_PREFIX Expected to find '$SOURCE_GIGS_DIR'."
    exit 1
fi
echo "$INFO_PREFIX Extraction complete."

# --- 8. Handle existing installation ---
if [ -d "$TARGET_DIR" ]; then
    confirm_action "${WARN_PREFIX} ${CLR_ORANGE_WARM}$TARGET_DIR${CLR_RESET} already exists. Overwrite? This will delete the existing directory."
    echo "$INFO_PREFIX Removing existing ${CLR_ORANGE_WARM}$TARGET_DIR${CLR_RESET}..."
    rm -rf "$TARGET_DIR"
    echo "$INFO_PREFIX Existing installation removed."
fi

# --- 9. Move and Rename ---
confirm_action "Confirm moving extracted ${CLR_SAND}'gigs'${CLR_RESET} to ${CLR_SAND}$TARGET_DIR${CLR_RESET}?"
echo "$INFO_PREFIX Installing gigs to ${CLR_SAND}$TARGET_DIR${CLR_RESET}..."
mv "$SOURCE_GIGS_DIR" "$TARGET_DIR"
echo "${CLR_SAGE}[SUCCESS]${CLR_RESET} Installation successful! gig pages installed at ${CLR_SAND}$TARGET_DIR${CLR_RESET}."

# --- 10. Cleanup ---
echo "$INFO_PREFIX Cleaning up temporary files..."
rm -rf "$TEMP_DIR"
echo "$INFO_PREFIX Cleanup complete."

echo "${CLR_CREAM}"
echo "--------------------------------------------------------"
echo "  gig pages from '${REPO_NAME}' are now installed at ${CLR_SAND}$TARGET_DIR${CLR_RESET}${CLR_CREAM}."
echo "  You can now use the 'gig' engine to view them, for example:"
echo "  ${CLR_SAGE}gig 7 example${CLR_RESET}${CLR_CREAM}"
echo "--------------------------------------------------------"
echo "${CLR_RESET}"

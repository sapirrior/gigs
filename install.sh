#!/bin/sh
set -e

REPO_OWNER="sapirrior"
REPO_NAME="gigs"
REPO_URL="https://github.com/$REPO_OWNER/$REPO_NAME"

# Message prefixes
INFO_PREFIX="[INSTALL]"
ERROR_PREFIX="[ERROR]"
WARN_PREFIX="[WARN]"
DONE_PREFIX="[DONE]"

# --- Detect Termux environment early ---
IS_TERMUX=false
if [ -n "$ANDROID_ROOT" ] && [ -d "/data/data/com.termux/files/usr/share" ]; then
    IS_TERMUX=true
fi

# --- 1. Check for root privileges ---
if ! "$IS_TERMUX"; then
    if [ "$(id -u)" -ne 0 ]; then
        echo "$ERROR_PREFIX Script requires root privileges for /usr/share."
        echo "$INFO_PREFIX Run with 'sudo ./install.sh'"
        exit 1
    fi
fi

# --- 2. Dependency Checks ---
check_dependency() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "$ERROR_PREFIX Missing dependency: '$1'."
        exit 1
    fi
}
echo "$INFO_PREFIX Checking dependencies..."
check_dependency "curl"
check_dependency "tar"
echo "$INFO_PREFIX All dependencies found."

# --- 3. Determine Target Directory ---
TARGET_BASE=""
if "$IS_TERMUX"; then
    TARGET_BASE="/data/data/com.termux/files/usr/share"
    echo "$INFO_PREFIX Termux detected. Target base: $TARGET_BASE"
else
    TARGET_BASE="/usr/share"
    echo "$INFO_PREFIX Unix-like detected. Target base: $TARGET_BASE"
fi
TARGET_DIR="$TARGET_BASE/gig"
echo "$INFO_PREFIX Installation directory: $TARGET_DIR"

# --- 4. Function for user confirmation ---
confirm_action() {
    printf "%s %s (y/N) " "$WARN_PREFIX" "$1"
    read -r response
    if ! echo "$response" | grep -Eq '^[Yy]$'; then
        echo "$INFO_PREFIX Action cancelled by user. Exiting."
        exit 0
    fi
}

# --- 5. Get Latest Release Info ---
echo "$INFO_PREFIX Fetching latest release from $REPO_URL..."
RELEASE_INFO=$(curl -sL "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/releases/latest")
DOWNLOAD_URL=$(echo "$RELEASE_INFO" | grep "tarball_url" | head -n 1 | cut -d '"' -f 4)
RELEASE_TAG=$(echo "$RELEASE_INFO" | grep "tag_name" | head -n 1 | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ] || [ -z "$RELEASE_TAG" ]; then
    echo "$ERROR_PREFIX Failed to get release info from GitHub API."
    echo "$INFO_PREFIX Ensure releases are published for $REPO_OWNER/$REPO_NAME."
    exit 1
fi
echo "$INFO_PREFIX Latest release: $RELEASE_TAG"

# --- 6. Check for updates ---
VERSION_FILE="$TARGET_DIR/version"
if [ -f "$VERSION_FILE" ]; then
    INSTALLED_VERSION=$(cat "$VERSION_FILE")
    echo "$INFO_PREFIX Installed version: $INSTALLED_VERSION"
    if [ "$INSTALLED_VERSION" = "$RELEASE_TAG" ]; then
        echo "$INFO_PREFIX Gigs pages are already up to date ($RELEASE_TAG)."
        exit 0
    else
        echo "$WARN_PREFIX Installed version ($INSTALLED_VERSION) is older than latest ($RELEASE_TAG). Updating..."
    fi
else
    echo "$INFO_PREFIX No existing installation found or version file missing. Proceeding with fresh install/update."
fi

# --- 7. Download ---
TEMP_DIR=$(mktemp -d)
TARBALL_NAME="$REPO_NAME-$RELEASE_TAG.tar.gz"
TARBALL_PATH="$TEMP_DIR/$TARBALL_NAME"

confirm_action "Confirm download of $TARBALL_NAME from $DOWNLOAD_URL?"
echo "$INFO_PREFIX Downloading $TARBALL_NAME to $TEMP_DIR..."
curl -L "$DOWNLOAD_URL" -o "$TARBALL_PATH"
echo "$INFO_PREFIX Download complete."

# --- 8. Extract ---
confirm_action "Confirm extraction of $TARBALL_NAME?"
echo "$INFO_PREFIX Extracting $TARBALL_NAME..."
tar -xzf "$TARBALL_PATH" -C "$TEMP_DIR"
EXTRACTED_ROOT_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "$REPO_OWNER-$REPO_NAME-*" -print -quit)

if [ -z "$EXTRACTED_ROOT_DIR" ]; then
    echo "$ERROR_PREFIX Failed to find extracted root directory. Tarball structure unexpected."
    exit 1
fi

SOURCE_GIGS_DIR="$EXTRACTED_ROOT_DIR/gigs"
if [ ! -d "$SOURCE_GIGS_DIR" ]; then
    echo "$ERROR_PREFIX 'gigs' directory not found in tarball."
    exit 1
fi
echo "$INFO_PREFIX Extraction complete."

# --- 9. Handle existing installation and Move/Rename ---
if [ -d "$TARGET_DIR" ]; then
    confirm_action "$TARGET_DIR already exists. Overwrite (deletes existing)?"
    echo "$INFO_PREFIX Removing existing $TARGET_DIR..."
    rm -rf "$TARGET_DIR"
    echo "$INFO_PREFIX Existing installation removed."
fi

confirm_action "Confirm installing gigs to $TARGET_DIR?"
echo "$INFO_PREFIX Installing gigs to $TARGET_DIR..."
mv "$SOURCE_GIGS_DIR" "$TARGET_DIR"
echo "$DONE_PREFIX Installation successful! gigs installed at $TARGET_DIR."

# Create version file
echo "$RELEASE_TAG" > "$VERSION_FILE"
echo "$INFO_PREFIX Version $RELEASE_TAG recorded in $VERSION_FILE."

# --- 10. Cleanup ---
echo "$INFO_PREFIX Cleaning up temporary files..."
rm -rf "$TEMP_DIR"
echo "$INFO_PREFIX Cleanup complete."

echo ""
echo "--------------------------------------------------------"
echo "  gigs from '$REPO_NAME' are now installed at $TARGET_DIR."
echo "  You can use the 'gig' engine to view them, e.g.:"
echo "  gig 7 example"
echo "--------------------------------------------------------"
echo ""

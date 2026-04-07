#!/bin/bash
set -e

cd "$(dirname "$0")"

# ── Config ──
SCHEME="CalorieTracker"
TEAM_ID="77QM6XDVU9"
ARCHIVE_PATH="./build/CalorieTracker.xcarchive"
EXPORT_PATH="./build/export"
EXPORT_OPTIONS="./ExportOptions.plist"
PROJECT_YML="./project.yml"
PROFILE_UUID="b20bbc0c-a78f-4a5d-8403-2a324999a3d3"

# ── App Store Connect API Key ──
API_KEY_ID="PJR7U4Y6TQ"
API_ISSUER_ID="1aa9f658-125d-4760-b583-23736ce6fbde"
API_KEY_PATH="$(pwd)/private_keys/AuthKey_PJR7U4Y6TQ.p8"

# ── Auto-increment build number ──
CURRENT_BUILD=$(grep 'CURRENT_PROJECT_VERSION' "$PROJECT_YML" | sed 's/[^0-9]//g')
NEW_BUILD=$((CURRENT_BUILD + 1))
sed -i '' "s/CURRENT_PROJECT_VERSION: \"$CURRENT_BUILD\"/CURRENT_PROJECT_VERSION: \"$NEW_BUILD\"/" "$PROJECT_YML"
echo "📦 Build $NEW_BUILD"

# ── Regenerate Xcode project ──
echo "⚙️  Generating project..."
xcodegen generate --quiet

# ── Clean previous build ──
rm -rf "$ARCHIVE_PATH" "$EXPORT_PATH"

# ── Archive (manual distribution signing) ──
echo "🔨 Archiving..."
xcodebuild archive \
    -scheme "$SCHEME" \
    -destination 'generic/platform=iOS' \
    -archivePath "$ARCHIVE_PATH" \
    CODE_SIGN_STYLE=Manual \
    CODE_SIGN_IDENTITY="Apple Distribution" \
    PROVISIONING_PROFILE_SPECIFIER="$PROFILE_UUID" \
    DEVELOPMENT_TEAM="$TEAM_ID" \
    -quiet

echo "✅ Archive succeeded"

# ── Export & Upload to TestFlight (API key auth) ──
echo "🚀 Uploading to TestFlight..."
xcodebuild -exportArchive \
    -archivePath "$ARCHIVE_PATH" \
    -exportOptionsPlist "$EXPORT_OPTIONS" \
    -exportPath "$EXPORT_PATH" \
    -authenticationKeyPath "$API_KEY_PATH" \
    -authenticationKeyID "$API_KEY_ID" \
    -authenticationKeyIssuerID "$API_ISSUER_ID" \
    -quiet

echo "✅ Build $NEW_BUILD uploaded to TestFlight!"

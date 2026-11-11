#!/usr/bin/env sh
# Lightweight Gradle launcher for Codemagic cloud builds.
# Downloads Gradle 8.9 on first run; no local Gradle installation required.
set -eu
GRADLE_VERSION="8.9"
GRADLE_HOME_DIR="${HOME}/.gradle/ssb-wrapper/gradle-${GRADLE_VERSION}"
GRADLE_ZIP="${HOME}/.gradle/ssb-wrapper/gradle-${GRADLE_VERSION}-bin.zip"
if [ ! -x "${GRADLE_HOME_DIR}/bin/gradle" ]; then
  mkdir -p "${HOME}/.gradle/ssb-wrapper"
  if [ ! -f "${GRADLE_ZIP}" ]; then
    curl -fL "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o "${GRADLE_ZIP}"
  fi
  unzip -q -o "${GRADLE_ZIP}" -d "${HOME}/.gradle/ssb-wrapper"
fi
exec "${GRADLE_HOME_DIR}/bin/gradle" "$@"

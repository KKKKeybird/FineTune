# FineTune Nightly

This is an automated community-nightly prerelease based on upstream FineTune.

## Verification

- Debug build and unit tests are run before every nightly build.
- The package is built from the exact commit identified by this release tag.
- Hardware-specific audio behavior is not automatically certified by CI.

## Included changes

- ISO 226 threshold exponent correction
- Volume editor commit-on-focus-loss fix
- Biquad mid-buffer NaN protection
- Crossfade promotion silence-race fix
- Electron/nested-helper merge and all-channel peak detection
- Public CoreAudio idle-sleep participation fix for silent Process Taps

## Signing and installation

This prerelease is ad-hoc signed and not notarized. macOS Gatekeeper may require
manual approval before first launch. It must not be presented as a production
release.

The app uses the temporary identity `io.github.kkkkeybird.FineTune.nightly` and
the `finetune-nightly://` URL scheme so it can coexist with the upstream app.
Sparkle automatic update checks are disabled until a dedicated nightly feed and
signing key are configured.

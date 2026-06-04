# Security audit notes

The latest GitHub version tried to apply the React Native Gradle plugin without
including the React Native source project, `package.json`, or `node_modules`.
That made Gradle fail before configuration finished.

The functional OTT app remains `apk_info/base.apk`.

## Current Gradle behavior

`assembleDebug` copies the restored working APK into
`app/build/outputs/apk/debug/app-debug.apk`.

## Redirect/ad-link mitigation

`apk_info/base.apk` has been patched at the Android bytecode level to neutralize
React Native's external URL launcher. Calls that previously opened browser links
now resolve successfully without sending an Android `VIEW` intent, preventing the
"click link/watch ad" flow from redirecting users to outside websites.

The native React Native timer manager also clamps long, one-shot timers to 1 ms.
This prevents the ad gate from forcing a 30-second wait before the app can be
used, while leaving repeating timers alone.

The app's WebView is also patched for the live `net52.cc` support/ad gate. The
remote page at `/mobile/home?app=1` can show "Open 1 ADS per Day" and force a
20-30 second check through `/mobile/verify2.php`. The patched WebView detects
that gate, blocks the visible external ad window, starts the same server-side
verification flow in a hidden frame, polls `/mobile/verify2.php`, and redirects
to `/mobile/home?app=1` only after the server returns `All Done`. The WebView
also skips the `/mobile/?app=1` intro carousel, whose "Go to Home" button points
back to the gated route.

## Content source notes

The React Native/Hermes bundle contains encoded `mobidetect...` domains and
`_check.php` references. The OTT catalog/content is remote, not embedded in this
repository.

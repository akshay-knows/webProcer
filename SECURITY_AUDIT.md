# Security audit notes

The latest GitHub version tried to apply the React Native Gradle plugin without
including the React Native source project, `package.json`, or `node_modules`.
That made Gradle fail before configuration finished.

The functional OTT app remains `apk_info/base.apk`.

## Current Gradle behavior

`assembleDebug` copies the restored working APK into
`app/build/outputs/apk/debug/app-debug.apk`. This preserves the app behavior that
existed before the broken React Native Gradle-plugin change.

## Content source notes

The React Native/Hermes bundle contains encoded `mobidetect...` domains and
`_check.php` references. The OTT catalog/content is remote, not embedded in this
repository.

# webProcer

This repository contains the recovered NetMirror Android APK plus a minimal
Gradle wrapper/scaffold. The functional OTT app is the restored APK at
`apk_info/base.apk`.

The original APK source code was not decompiled into Java, Kotlin, or React
Native source files. Because of that, `assembleDebug` builds the scaffold and
then copies `apk_info/base.apk` into `app/build/outputs/apk/debug/app-debug.apk`
so the normal Gradle debug output is the restored OTT app.

The current APK also blocks the external browser redirect used by the
"click link/watch ad" flow, while allowing the in-app flow to continue.

## Build

Use JDK 17 and the Android SDK, then run:

```powershell
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
$env:ANDROID_HOME = "$env:LOCALAPPDATA\Android\Sdk"
.\gradlew.bat :app:assembleDebug
```

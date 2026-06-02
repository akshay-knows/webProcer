APK unpack complete

Folders/files:
- raw_unpacked/: APK ZIP contents extracted safely. AndroidManifest.xml inside this folder is still binary Android XML.
- AndroidManifest.xmltree.txt: readable manifest tree produced by aapt2.
- permissions.txt: declared permissions.
- badging.txt: package name, version, SDK, label, icon, native ABI info.
- signature.txt: APK signing verification and certificate details.
- sha256.txt: APK SHA-256 hash.

Notes:
- This APK is a React Native/Hermes app. The JS bundle is assets/index.android.bundle and may not open as normal text JavaScript.
- apktool/jadx were not installed locally, so this is a raw unpack plus decoded Android metadata, not a smali/source decompile.

# Keep Flutter logging code
-keep class io.flutter.Log { *; }
-keep class io.flutter.embedding.android.FlutterActivity { *; }
-keep class io.flutter.embedding.android.FlutterJNI { *; }
-keep class io.flutter.embedding.engine.FlutterEngine { *; }

# Keep Dart developer logging
-keep class dart.developer.** { *; }

# Add any other ProGuard rules your app needs here
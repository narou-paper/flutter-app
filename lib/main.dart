import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'view/app.dart';

void main() {
  if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  return runApp(NarouPaperApp());
}

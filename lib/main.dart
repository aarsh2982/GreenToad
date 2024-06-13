// root file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greentoad_app/app.dart';

void main() {
  // initialize services and configurations before the app starts
  WidgetsFlutterBinding.ensureInitialized();

  // enforcing portraitup mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const GreenToadApp());
}

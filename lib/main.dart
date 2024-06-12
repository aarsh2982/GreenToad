// root file
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greentoad_app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const GreenToadApp());
}

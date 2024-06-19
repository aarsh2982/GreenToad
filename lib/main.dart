// root file
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:greentoad_app/app.dart';
import 'package:greentoad_app/services/database_service.dart';

void main() async {
  // initialize services and configurations before the app starts
  WidgetsFlutterBinding.ensureInitialized();

  // enforcing portraitup mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // initialize database service
  await DataBaseService.instance.database;

  // global riverpod provider scope
  runApp(const ProviderScope(child: GreenToadApp()));
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/background_service.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initBackgroundService();
  runApp(const AccidentApp());
}

class AccidentApp extends StatelessWidget {
  const AccidentApp({super.key});

  @override
  Widget build(BuildContext ctx) => MaterialApp(
    title: 'Accident Detector',
    home: const HomeScreen(),
  );
}
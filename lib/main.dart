import 'package:flutter/material.dart';
import 'package:intern_assignment/screens/main_dashboard.dart';
import 'package:intern_assignment/screens/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YourDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainDashboard(),
      ),
    );
  }
}

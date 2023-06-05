import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polo_s/infoHandler/app_info.dart';
import 'package:polo_s/screens/main_screen.dart';
import 'package:polo_s/screens/register_screen.dart';
import 'package:polo_s/themeProvider/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: MaterialApp(
        title: 'Polo-S',
        //themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        themeMode: ThemeMode.light,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}

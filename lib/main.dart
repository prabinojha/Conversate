import 'package:conversate_app/screens/onboarding/details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../screens/games_page.dart';
import '../screens/home_screen.dart';
import '../screens/onboarding/freeTrial.dart';
import '../screens/onboarding/signup.dart';
import '../screens/profile_screen.dart';
import '../screens/onboarding/main_stuff.dart';
import '../screens/onboarding/signin.dart';
import '../screens/tasks_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversate',
      theme: ThemeData(
        fontFamily: "Poppins",
        primaryColor: const Color.fromRGBO(114, 76, 249, 1),
        accentColor: const Color.fromRGBO(248, 70, 76, 1),
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: "Poppins",
            color: Color.fromRGBO(2, 43, 58, 1),
          ),
        ),
      ),
      home: OnboardingScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        GamesScreen.routeName: (ctx) => GamesScreen(),
        TasksScreen.routeName: (ctx) => TasksScreen(),
        SignIn.routeName: (ctx) => SignIn(),
        SignUp.routeName: (ctx) => SignUp(),
        FreeTrial.routeName: (ctx) => FreeTrial(),
        DetailsOnboardingScreen.routeName: (ctx) => DetailsOnboardingScreen(),
      },
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:income_expense/screens/addExpense.dart';
import 'package:income_expense/screens/connectWallet.dart';
import 'package:income_expense/screens/home.dart';
import 'package:income_expense/screens/login.dart';
import 'package:income_expense/screens/register.dart';
import 'package:income_expense/screens/onboarding.dart';
import 'package:income_expense/screens/splash_screen.dart';
import 'package:income_expense/screens/wallet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();

  if (kDebugMode) {
    print('Registration Token=$token');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income and Expenses',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboard': (context) => Onboard(),
        '/loginScreen': (context) => LoginScreen(),
        '/signupScreen': (context) => RegisterScreen(),
        '/homeScreen': (context) => HomeScreen(),
        '/walletScreen': (context) => WalletScreen(),
        '/addScreen': (context) => AddExpense(),
        //'/connectWallet': (context) => ConnectWallet(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

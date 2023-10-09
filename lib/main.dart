
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raft_test/data/app_user/auth_methods.dart';
import 'package:raft_test/provider/provider.dart';
import 'package:raft_test/res/app_colors.dart';
import 'package:raft_test/view/auth/login_screen.dart';
import 'package:raft_test/view/auth/splash_screen.dart';
import 'package:raft_test/view/dashboard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://jxauadhqinjkhareleez.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4YXVhZGhxaW5qa2hhcmVsZWV6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0MTg0MzAsImV4cCI6MjAxMTk5NDQzMH0.sJlfka6OwpDeGtvaqmIPnte4ls6o6bXHaMaozvantRQ",
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaftLabs Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: listOfProvider,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: AppColors.primary),
            home: Scaffold(
              body: AuthMethods.uid == ""
                  ? LoginScreen()
                  : Dashboard(),
            ),
          ),
        );
      },
    );
  }
}

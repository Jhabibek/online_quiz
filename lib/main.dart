import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_quiz/admin/add_question.dart';
import 'package:online_quiz/admin/admin_login.dart';
import 'package:online_quiz/pages/home.dart';
import 'package:online_quiz/pages/question.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "IzaSyAS0vNgB_RLakW06_jvglg_t3HbzaLBc7o",
      appId: "1:255715231367:android:3164a5c827830a572e5a22",
      messagingSenderId: "",
      projectId: "quizapp-4a328",
      storageBucket: "quizapp-4a328.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

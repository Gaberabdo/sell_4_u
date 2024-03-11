import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



import 'Features/Auth-feature/presentation/pages/login/login_screen.dart';

import 'core/constant.dart';
import 'core/helper/bloc_observe/observe.dart';
import 'core/helper/cache/cache_helper.dart';
import 'core/helper/dio-helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: Constant.options,
  );

  await CacheHelper.init();
  DioHelper.init();
  await CacheHelper.init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


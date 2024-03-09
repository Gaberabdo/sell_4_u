import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sell_4_u/Features/Home-feature/view/layout.dart';
import 'package:sell_4_u/core/constant.dart';

import 'core/helper/bloc_observe/observe.dart';
import 'core/helper/cache/cache_helper.dart';
import 'core/helper/dio-helper.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 3,
          backgroundColor: Colors.white,
          selectedItemColor: ColorStyle.primaryColor,
          selectedLabelStyle: FontStyleThame.textStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400
          ),
          unselectedLabelStyle: FontStyleThame.textStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400
          ),
          unselectedItemColor: ColorStyle.gray,
          selectedIconTheme: IconThemeData(
            size: 16,
          ),
          unselectedIconTheme: IconThemeData(
            size: 16,
          ),

        ),
      ),
      home: const LayoutScreen(),
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales
    );
  }
}

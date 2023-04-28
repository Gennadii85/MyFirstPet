import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet/generated/codegen_loader.g.dart';
import 'package:pet/todo/todolist.dart';
import 'package:pet/weather/weather.dart';
/* 
flutter pub run easy_localization:generate -S "assets/translations"
для генерации codegen_loader файла
*/
/*
flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart 
-S "assets/translations"
для генерации ключей locate_keys файла или ручками ))))
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('listbox');
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ru')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    startLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const WeatherScreen(),
    );
  }
}

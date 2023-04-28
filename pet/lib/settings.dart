import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet/drawerappbar.dart';
import 'package:pet/generated/locale_keys.g.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var settingTheme = ThemeData(primarySwatch: Colors.grey);

  setTheme(color) {
    setState(() {
      settingTheme = ThemeData(primarySwatch: color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: settingTheme,
      home: Scaffold(
        drawer: const DrawerAppBar(),
        appBar: AppBar(
          title: const Text(LocaleKeys.settings).tr(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  LocaleKeys.color_theme,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ).tr()
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ColorTheme(
                    color: Colors.amber,
                    namecolor: 'Amber',
                    coolbackTheme: setTheme,
                  ),
                  ColorTheme(
                    color: Colors.indigo,
                    namecolor: 'Blue',
                    coolbackTheme: setTheme,
                  ),
                  ColorTheme(
                    color: Colors.green,
                    namecolor: 'Green',
                    coolbackTheme: setTheme,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Divider(
                height: 20,
                thickness: 2,
              ),
            ),
            Center(
              child: const Text(
                LocaleKeys.languish,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ).tr(),
            ),
            TextButton(
              onPressed: () {
                if (context.locale == const Locale('ru')) {
                  context.setLocale(const Locale('en'));
                } else {
                  context.setLocale(const Locale('ru'));
                }
              },
              child: const Icon(
                Icons.calendar_month,
                color: Color.fromARGB(255, 126, 24, 145),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorTheme extends StatefulWidget {
  final Color color;
  final String namecolor;
  final Function coolbackTheme;

  const ColorTheme({
    Key? key,
    required this.color,
    required this.namecolor,
    required this.coolbackTheme,
  }) : super(key: key);

  @override
  State<ColorTheme> createState() => _ColorThemeState();
}

class _ColorThemeState extends State<ColorTheme> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            widget.coolbackTheme(widget.color);
          },
          child: Text(
            widget.namecolor,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

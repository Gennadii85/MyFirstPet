import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet/generated/locale_keys.g.dart';
import 'package:pet/settings.dart';
import 'package:pet/todo/todolist.dart';
import 'package:pet/water.dart';
import 'package:pet/weather/weather.dart';

class DrawerAppBar extends StatelessWidget {
  const DrawerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange[300],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: const Text(
                LocaleKeys.my_notes,
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ).tr(),
              leading: const Icon(Icons.home),
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TodoList()));
              }),
            ),
            ListTile(
              title: const Text(
                LocaleKeys.water_meter,
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ).tr(),
              leading: const Icon(Icons.water),
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Water()));
              }),
            ),
            ListTile(
              title: const Text(
                LocaleKeys.weather,
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ).tr(),
              leading: const Icon(Icons.light_mode),
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WeatherScreen()));
              }),
            ),
            ListTile(
              title: const Text(
                LocaleKeys.settings,
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ).tr(),
              leading: const Icon(Icons.settings),
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pet/todo/todolist.dart';

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
          title: const Text('Settings'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FilledButton(
                  onPressed: () {
                    // сохранение параметров
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 93, 151, 199)),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Color theme',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
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

                  //   Row(
                  //     children: [
                  //       Container(
                  //           color: Colors.amber,
                  //           child: const Text('Amber theme')),
                  //     ],
                  //   ),
                  //   Row(
                  //     children: [
                  //       Container(
                  //           color: Colors.blueAccent,
                  //           child: const Text('BlueAccent theme')),
                  //     ],
                  //   ),
                  //   Row(
                  //     children: [
                  //       Container(
                  //           color: Colors.greenAccent,
                  //           child: const Text('GreenAccent theme')),
                  //     ],
                  //   ),
                  //   Row(
                  //     children: [
                  //       Container(
                  //           color: Colors.redAccent,
                  //           child: const Text('RedAccent theme')),
                  //       ColorTheme(
                  //         color: Colors.redAccent,
                  //         apply: false,
                  //       ),
                  //     ],
                  //   ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            child: Text(widget.namecolor),
          ),
          IconButton(
            onPressed: () {
              widget.coolbackTheme(widget.color);
            },
            icon: const Icon(Icons.done_outline),
          ),
        ],
      ),
    );
  }
}

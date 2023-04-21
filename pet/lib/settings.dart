import 'package:flutter/material.dart';
import 'package:pet/drawerappbar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var settingTheme = ThemeData(primarySwatch: Colors.grey);
  String? selectedValue;
  List<String> list = [
    'english',
    'russian',
  ];
  @override
  void initState() {
    super.initState();
    selectedValue = list.first;
  }

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
            const Center(
              child: Text(
                'Choose language',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButton(
                value: selectedValue,
                dropdownColor: settingTheme.primaryColor,
                isExpanded: false,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
                items: list.map((list) {
                  return DropdownMenuItem<String>(
                    alignment: AlignmentDirectional.center,
                    value: list,
                    child: Text(
                      list,
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
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
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(widget.color),
          ),
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

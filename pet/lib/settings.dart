import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Color theme'),
              ],
            ),
            Row(children: [
              Container(color: Colors.amber),
              Container(color: Colors.blueAccent),
              Container(color: Colors.greenAccent),
              Container(color: Colors.redAccent),
            ]),
            const Divider(height: 20, color: Colors.black),
            Row(children: const [Text('Units')]),
            Row(
              children: [
                TextButton(onPressed: () {}, child: const Text('mll')),
                TextButton(onPressed: () {}, child: const Text('L')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

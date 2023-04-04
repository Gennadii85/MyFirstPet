import 'package:flutter/material.dart';
import 'package:pet/calendar.dart';
import 'package:pet/newtodo.dart';
import 'package:pet/settings.dart';
import 'package:pet/todo.dart';
import 'package:pet/water.dart';
import 'package:pet/weather/weather.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lime),
      home: Scaffold(
        drawer: const DrawerAppBar(),
        appBar: AppBar(
          title: const Text('Мои заметки'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${Provider.of<DateTime>(context).day} / ${Provider.of<DateTime>(context).month} / ${Provider.of<DateTime>(context).year}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Calendar(),
                    ));
                  },
                  child: const Icon(
                    Icons.calendar_month,
                    color: Color.fromARGB(255, 126, 24, 145),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: const Todo(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const NewTodo()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

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
                'Список дел',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              leading: const Icon(Icons.home),
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TodoList()));
              }),
            ),
            ListTile(
              title: const Text(
                'Счетчик воды',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              leading: const Icon(Icons.water),
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Water()));
              }),
            ),
            ListTile(
              title: const Text(
                'Погода',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              leading: const Icon(Icons.light_mode),
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WeatherScreen()));
              }),
            ),
            ListTile(
              title: const Text(
                'Настройки',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
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

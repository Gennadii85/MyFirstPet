import 'package:flutter/material.dart';
import 'package:pet/drawerappbar.dart';
import 'package:provider/provider.dart';

import 'package:pet/calendar.dart';
import 'package:pet/todo/newtodo.dart';
import 'package:pet/todo/todo.dart';

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

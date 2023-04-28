import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet/drawerappbar.dart';
import 'package:pet/generated/locale_keys.g.dart';
import 'package:pet/todo/newtodo.dart';

import '../calendar.dart';

DateTime dateTime = DateTime.now();
var date = dateTime;

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final colorTheme = ThemeData(primarySwatch: Colors.lime);
  var listbox = Hive.box('listbox');
  String text = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: colorTheme,
      home: Scaffold(
        drawer: const DrawerAppBar(),
        appBar: AppBar(
          title: const Text(LocaleKeys.my_notes).tr(),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day} / ${date.month} / ${date.year}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Calendar()));
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
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box('listbox').listenable(),
          builder: (BuildContext context, box, widget) {
            return ListView.separated(
              itemCount: listbox.isEmpty ? 0 : listbox.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (direction) {
                    setState(() {
                      listbox.deleteAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  key: UniqueKey(),
                  child: Card(
                    color: Colors.grey[300],
                    elevation: 2,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                          maxRadius: 12,
                          backgroundColor: Colors.amber,
                          child: Text('${index + 1}')),
                      title: Text(
                        listbox.isEmpty ? '' : listbox.values.toList()[index],
                        style: const TextStyle(fontSize: 18),
                      ),
                      trailing: todoShowDialog(context, index),
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            backgroundColor: colorTheme.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const NewTodo()));
          },
          child: const Text(
            LocaleKeys.new_todo,
            style: TextStyle(fontSize: 20),
          ).tr(),
        ),
      ),
    );
  }

  IconButton todoShowDialog(BuildContext context, int index) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => SimpleDialog(
                  children: [
                    TextFormField(
                      initialValue: listbox.values.toList()[index],
                      onChanged: (value) => text = value,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            listbox.putAt(index, text);
                            text = '';
                            Navigator.pop(context);
                          },
                          child: const Text(LocaleKeys.update).tr(),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(LocaleKeys.cancel).tr(),
                        ),
                      ],
                    )
                  ],
                ));
      },
      icon: const Icon(Icons.create_rounded),
    );
  }
}

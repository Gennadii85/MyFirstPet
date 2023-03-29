import 'package:flutter/material.dart';
import 'package:pet/main.dart';
import 'package:pet/todolist.dart';
import 'package:provider/provider.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => UserTodo(),
      child: MaterialApp(
        home: Scaffold(
          drawer: const DrawerAppBar(),
          appBar: AppBar(
            title: const Text('New Todo'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: textcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              style: TextStyle(backgroundColor: Colors.grey[200], fontSize: 20),
            ),
          ),
          floatingActionButton: ElevatedButton(
            onPressed: () {
              setState(() {
                (context).read<UserTodo>().text = textcontroller.text;
              });
              (context).read<UserTodo>().addToList();
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ),
      ),
    );
  }
}

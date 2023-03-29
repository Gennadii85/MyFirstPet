import 'package:flutter/material.dart';
import 'package:pet/todolist.dart';
import 'package:provider/provider.dart';

DateTime dateTime = DateTime.now();
var date = dateTime;

class UserTodo extends ChangeNotifier {
  List<String> todoList = [];
  String text = '';

  void addToList() {
    todoList.add(text);
    notifyListeners();
  }
}

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (context) => date),
    ChangeNotifierProvider(create: (context) => UserTodo()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home:
          //  const TodoList(), //вернуть стартовую TodoList
          //  const Water(),
          const TodoList(),
    );
  }
}
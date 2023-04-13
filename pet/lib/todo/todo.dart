import 'package:flutter/material.dart';
import 'package:pet/main.dart';
import 'package:provider/provider.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    var showText = (context).read<UserTodo>().todoList;
    String text = '';
    return ListView.separated(
      itemCount: (context).watch<UserTodo>().todoList.isEmpty
          ? 0
          : (context).watch<UserTodo>().todoList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      padding: const EdgeInsets.all(20),
      itemBuilder: (BuildContext context, int index) {
        final item = (context).watch<UserTodo>().todoList[index];

        return Dismissible(
          onDismissed: (direction) {
            setState(() {
              (context).read<UserTodo>().todoList.removeAt(index);
            });
          },
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete),
          ),
          key: Key(item),
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
                style: const TextStyle(fontSize: 18),
                (context).read<UserTodo>().todoList.isEmpty
                    ? ''
                    : (context).read<UserTodo>().todoList[index],
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                            children: [
                              TextFormField(
                                initialValue: showText[index],
                                onChanged: (value) => text = value,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    showText[index] = text;
                                  });
                                  Navigator.pop(context);
                                },
                                child: const Text('update'),
                              )
                            ],
                          ));
                },
                icon: const Icon(Icons.create_rounded),
              ),
            ),
          ),
        );
      },
    );
  }
}

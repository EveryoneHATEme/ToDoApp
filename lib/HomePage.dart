import 'package:flutter/material.dart';
import 'package:todoapp/AddTaskPage.dart';
import 'package:todoapp/EditTaskPage.dart';
import 'Task.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = <Task>[
    Task(description: 'nothing 1'),
    Task(description: 'nothing 2'), 
    Task(description: 'something 1'), 
    Task(description: 'something 2')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: _createListView,
        separatorBuilder: _createDivider,
        itemCount: tasks.length
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskPage())
    );

    if (result != null) {
      setState(() {
        tasks.add(result);
      });
    }
  }

  Widget _createListView(BuildContext context, int index) {
    return ListTile(
      title: Text(tasks[index].description ?? 'No description'),
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditTaskPage(tasks[index])
          )
        );
        if (result != null) {
          setState(() {
            tasks[index] = result;
          });
        }
      }
    );
  }


  Divider _createDivider(BuildContext context, int index) {
    return Divider();
  }
}

import 'package:flutter/material.dart';
import 'package:todoapp/Task.dart';


class AddTaskPage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: textController,
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _returnTask(context),
                child: Text('Add')
              ),
              ElevatedButton(
                onPressed: () => _returnWithoutTask(context), 
                child: Text('Cancel')
              ),
            ],
          )
        ],
      )
    );
  }


  void _returnTask(BuildContext context) {
    Task newTask = Task(
      description: textController.text
    );
    Navigator.pop(context, newTask);
  }


  void _returnWithoutTask(BuildContext context) {
    Navigator.pop(context);
  }
}
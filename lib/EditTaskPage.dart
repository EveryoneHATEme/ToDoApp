import 'package:flutter/material.dart';
import 'Task.dart';

class EditTaskPage extends StatelessWidget {
  final textController = TextEditingController();

  EditTaskPage(Task task) {
    textController.text = task.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task')
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
                onPressed: () => _returnChanges(context),
                child: const Text('Add')
              ),
              ElevatedButton(
                onPressed: () => _returnWithoutChanges(context),
                child: const Text('Cancel')
              )
            ]
          ),
        ],
      )
    );
  }

  void _returnChanges(BuildContext context) {
    Task newTask = Task(description: textController.text);
    Navigator.pop(context, newTask);
  }

  void _returnWithoutChanges(BuildContext context) {
    Navigator.pop(context);
  }
}

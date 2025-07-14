import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onToggle;
  final Function(int) onDelete;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(child: Text('No tasks yet.'));
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          leading: Checkbox(
            value: task.isDone,
            onChanged: (_) => onToggle(index),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => onDelete(index),
          ),
        );
      },
    );
  }
}

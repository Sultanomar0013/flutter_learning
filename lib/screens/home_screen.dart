import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_input.dart';
import '../widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = [];

  void addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: [
          TaskInput(onSubmit: addTask),
          Expanded(
            child: TaskList(
              tasks: tasks,
              onToggle: toggleTask,
              onDelete: deleteTask,
            ),
          ),
        ],
      ),
    );
  }
}

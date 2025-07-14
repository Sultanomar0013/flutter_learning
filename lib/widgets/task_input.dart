import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final Function(String) onSubmit;

  const TaskInput({super.key, required this.onSubmit});

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController controller = TextEditingController();

  void handleSubmit() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSubmit(text);
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter a new task...',
              ),
              onSubmitted: (_) => handleSubmit(),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: handleSubmit,
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

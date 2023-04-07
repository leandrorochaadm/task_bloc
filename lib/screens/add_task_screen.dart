import 'package:flutter/material.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text('Adicionar Tarefa', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          TextField(
            controller: titleController,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text('Titulo'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              ElevatedButton(
                  onPressed: () {
                    var task = TaskModel(title: titleController.text);
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Adicionar'))
            ],
          ),
        ],
      ),
    );
  }
}

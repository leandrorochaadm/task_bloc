import 'package:flutter/material.dart';
import 'package:task_bloc/blocs/blocs.dart';

import '../models/models.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<TaskModel> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          final task = taskList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) =>
                  context.read<TasksBloc>().add(UpdateTask(task: task)),
            ),
            onLongPress: () =>
                context.read<TasksBloc>().add(DeleteTask(task: task)),
          );
        },
      ),
    );
  }
}

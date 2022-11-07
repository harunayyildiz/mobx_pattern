import 'package:mobx_pattern/app/task/view_model/task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final TaskViewModel _taskViewModel = TaskViewModel();

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    if (_taskViewModel.contextt == null) {
      _taskViewModel.setContext(context);
    }

    return Scaffold(
      body: Observer(
        builder: (_) {
          switch (_taskViewModel.lifeState) {
            case LifeState.loading:
            case LifeState.idle:
              return const CircularProgressIndicator();
            case LifeState.done:
              return ListView.builder(
                itemCount: _taskViewModel.items?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_taskViewModel.items?[index].description ?? ''),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            _taskViewModel.items?[index].imageUrl ??
                                'https://picsum.photos/200/300')),
                  );
                },
              );
            case LifeState.error:
              return const Icon(Icons.error);
          }
        },
      ),
    );
  }
}

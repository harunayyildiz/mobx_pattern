import 'package:mobx_pattern/app/task/model/task_model.dart';
import 'package:mobx_pattern/app/task/services/i_task_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/network/network_manager.dart';
import '../services/task_service.dart';
part 'task_view_model.g.dart';

class TaskViewModel = TaskViewModelBase with _$TaskViewModel;

abstract class TaskViewModelBase with Store {
  BuildContext? contextt;
  late ITaskService taskService;

  @observable
  List<TaskModel>? items = [];

  @observable
  LifeState lifeState = LifeState.idle;

  TaskViewModelBase({this.contextt}) {
    taskService = TaskService(NetworkManager.instance.dio);
  }

  void setContext(BuildContext? context) {
    contextt = context;
    getAllTask();
  }

  @action
  Future<void> getAllTask() async {
    lifeState = LifeState.loading;
    items = await taskService.getAllTask();
    if (items == null || items!.isEmpty) {
      lifeState = LifeState.error;
    }
    lifeState = LifeState.done;
  }
}

enum LifeState { idle, loading, error, done }

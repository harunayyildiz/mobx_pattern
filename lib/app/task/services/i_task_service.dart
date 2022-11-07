import 'package:dio/dio.dart';
import 'package:mobx_pattern/app/task/model/task_model.dart';

abstract class ITaskService {
  final Dio dio;

  ITaskService(this.dio);
  Future<List<TaskModel>?> getAllTask();
}

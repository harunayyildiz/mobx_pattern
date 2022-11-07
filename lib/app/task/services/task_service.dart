import 'package:dio/dio.dart';
import 'package:mobx_pattern/app/task/model/task_model.dart';
import 'package:mobx_pattern/app/task/services/i_task_service.dart';

part 'task_service_endpoints.dart';

class TaskService extends ITaskService {
  TaskService(Dio dio) : super(dio);
  @override
  Future<List<TaskModel>?> getAllTask() async {
    final response = await dio.get(_TaskServiceEndpoints.dogs.rawValue);
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => TaskModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

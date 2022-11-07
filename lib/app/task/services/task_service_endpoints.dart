part of 'task_service.dart'; //ile bağlantı kuracak (sadece bu class ile)

enum _TaskServiceEndpoints { dogs }

// ignore: library_private_types_in_public_api
extension TaskServiceEndpointsExtension on _TaskServiceEndpoints {
  String get rawValue {
    switch (this) {
      case _TaskServiceEndpoints.dogs:
        return '/dogs.json';
    }
  }
}

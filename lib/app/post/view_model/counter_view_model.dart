import 'package:mobx/mobx.dart';
part 'counter_view_model.g.dart';

class CounterViewModel = CounterViewModelBase with _$CounterViewModel;

abstract class CounterViewModelBase with Store {
  @observable
  int count = 0; //Değer değişecek ise observable olarak işaretlenmelidir.

  @computed //Hesaplanan değerler için kullanılır. (observable göre kendi hayatını çizen değer)
  bool get isEven => count % 2 == 1;

  @action
  void increment() {
    //Fonksiyon olduğu anlaşılsın
    count++;
  }
}



//_$ ile başlayan class ın observable olduğunu anlaması için kendi generate ediyor.
//Bunun için build runner çağırılıyor
//buildrunner çalışması için dev_dependenciesde build_runner olması gereklidir.
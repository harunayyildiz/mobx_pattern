// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskViewModel on TaskViewModelBase, Store {
  late final _$itemsAtom =
      Atom(name: 'TaskViewModelBase.items', context: context);

  @override
  List<TaskModel>? get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<TaskModel>? value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$lifeStateAtom =
      Atom(name: 'TaskViewModelBase.lifeState', context: context);

  @override
  LifeState get lifeState {
    _$lifeStateAtom.reportRead();
    return super.lifeState;
  }

  @override
  set lifeState(LifeState value) {
    _$lifeStateAtom.reportWrite(value, super.lifeState, () {
      super.lifeState = value;
    });
  }

  late final _$getAllTaskAsyncAction =
      AsyncAction('TaskViewModelBase.getAllTask', context: context);

  @override
  Future<void> getAllTask() {
    return _$getAllTaskAsyncAction.run(() => super.getAllTask());
  }

  @override
  String toString() {
    return '''
items: ${items},
lifeState: ${lifeState}
    ''';
  }
}

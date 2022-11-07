// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterViewModel on CounterViewModelBase, Store {
  Computed<bool>? _$isEvenComputed;

  @override
  bool get isEven => (_$isEvenComputed ??= Computed<bool>(() => super.isEven,
          name: 'CounterViewModelBase.isEven'))
      .value;

  late final _$countAtom =
      Atom(name: 'CounterViewModelBase.count', context: context);

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  late final _$CounterViewModelBaseActionController =
      ActionController(name: 'CounterViewModelBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$CounterViewModelBaseActionController.startAction(
        name: 'CounterViewModelBase.increment');
    try {
      return super.increment();
    } finally {
      _$CounterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count},
isEven: ${isEven}
    ''';
  }
}

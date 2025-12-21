import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends Notifier<int> {
  @override
  int build() => 5;
  void update(int value) => state = value;
}

final counterProvider = NotifierProvider<Counter, int>(Counter.new);



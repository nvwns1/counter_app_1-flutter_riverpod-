import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void setToZero() {
    state = 0;
  }
}

final counterProvider1 = ChangeNotifierProvider((ref) => Counter1());

class Counter1 extends ChangeNotifier {
  int _num = 0;

  //we have to do private
  int get data {
    return _num;
  }

  void increment() {
    _num++;
    notifyListeners();
  }

  void decrement() {
    _num--;
    notifyListeners();
  }

  void setToZero() {
    _num = 0;
    notifyListeners();
  }
}

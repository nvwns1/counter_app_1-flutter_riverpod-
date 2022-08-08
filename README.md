# counter_provider_app1
This application is about the Flutter_Riverpod one of the state management technique.


# Stage 1:
1. Get dependencies flutter_riverpod: ^1.0.4
2. Wrap MaterialApp with ProviderScope.
3. Build a simple Ui with a number followed by an Elevated Button using stateless widget.
4. Make a folder named provider and make a file named provider_sample.dart


# Stage 2:
# Note: You can use either StateNotifier or ChangeNotifier according to your need.

# The following is a example of StateNotifier
1. Create a class named Counter that extends StateNotifier
class Counter extends StateNotifier<int> { //int is a datatype of result
  Counter() : super(0); //0 is an initial value, call inside a constructor
  }

2. Make a function increment and decrement inside Counter class just like following
  void increment() {
    state++;
  }

3. Make provider named from state notifier provider
final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());
//put class name and data type 

# Note: ref.watch to fetch data whereas ref.read to access function inside provider
Now we move to main.dart file.
1. Wrap Column with Consumer Widget. Consumer Widget requires a builder and inside builder, it requires context, ref and child and a return function.
Consumer(builder: (context, ref, child) {
          return Column();
          }

2. Call a count variable to fetch state data like the following
Consumer(builder: (context, ref, child) {
          final count = ref.watch(counterProvider);
          return Column();
          }

3. You can call a function by using ref.read
 ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).increment();
                  },
                  child: Text('addition'))

# StateNotifier Provider successfully implemented.




# Stage 3
# The following is an example of ChangeNotifier

1. Create a class named Counter1 that extends ChangeNotifier from foundation.dart
2. Declare the private variable
int _num = 0; //we have to do private
3.  now we have to get access to the _num. So,, we do
 int get data{
    return _num;
  }
4. Make function increment and decrement followed by notifierListeners as follows:
void increment() {
    _num++;
    notifyListeners();
  }
5. Make a provider named from ChangeNorifier Provider
final counterProvider1 = ChangeNotifierProvider((ref) => Counter1());

# Note: ref.watch to fetch data whereas ref.read to access function inside provider
Now we move to main.dart file.

1. Wrap Column with Consumer Widget. Consumer Widget requires a builder and inside builder, it requires context, ref and child and a return function.
Consumer(builder: (context, ref, child) {
          return Column();
          }
 2. Call a count1 variable to fetch data like the following:
Consumer(builder: (context, ref, child) {
          final count1 = ref.watch(counterProvider1).data;
          return Column();
          }

3. You can call a function by using ref.read
 ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider1).increment();
                  },
                  child: Text('addition'))

# ChangeNotifier Provider successfully implemented.

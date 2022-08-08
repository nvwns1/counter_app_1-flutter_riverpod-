import 'package:counter_provider_app1/provider/provider_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: MaterialApp(home: Counter()));
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Riverpod Counter App")),
      body: Center(child: Consumer(builder: ((context, ref, child) {
        final count = ref.watch(counterProvider);
        final count1 = ref.watch(counterProvider1).data;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Using State Notifier"),
            Text(
              '$count',
              style: const TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider.notifier).increment();
                    },
                    child: const Text('Addition')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider.notifier).decrement();
                    },
                    child: const Text('Decrement')),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).setToZero();
                },
                child: const Text('Set 0')),
            const SizedBox(
              height: 100,
            ),
            const Text("Using Change Notifier"),
            Text(
              '$count1',
              style: const TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider1).increment();
                    },
                    child: const Text('Addition')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider1).decrement();
                    },
                    child: const Text('Decrement')),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider1).setToZero();
                },
                child: const Text('Set 0')),
          ],
        );
      }))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ✅ Step 1: Create a provider
final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(
    // ✅ Step 2: Wrap app with ProviderScope
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Step 3: Watch the provider
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Counter'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          'Count: $count',
          style: TextStyle(fontSize: 28),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {
          // ✅ Step 4: Update state
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}

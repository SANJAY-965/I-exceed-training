import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ✅ Create a StateProvider for a list of strings
final namesProvider = StateProvider<List<String>>((ref) => []);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NameListPage(),
    );
  }
}

class NameListPage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(namesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mutable List with Riverpod'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter name'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final newName = _controller.text.trim();
                if (newName.isNotEmpty) {
                  // ✅ Update list immutably
                  ref.read(namesProvider.notifier).state = [
                    ...ref.read(namesProvider),
                    newName,
                  ];
                  _controller.clear();
                }
              },
              child: Text('Add Name'),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(names[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      final updatedList = [...names]..removeAt(index);
                      ref.read(namesProvider.notifier).state = updatedList;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

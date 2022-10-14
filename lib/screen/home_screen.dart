import 'package:flutter/material.dart';
import 'package:provider_in_flutter/provider/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider_in_flutter/screen/second_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Example App (${context.watch<Counter>().count})"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "You have pushed the button this many time: ${context.watch<Counter>().count}"),
            const Count(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()));
                },
                child: const Text("Launch Screen")),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('decrement_floatingActionButton'),
            onPressed: () => context.read<Counter>().decrement(),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            key: const Key('reset_floatingActionButton'),
            onPressed: () => context.read<Counter>().reset(),
            child: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            key: const Key('increment_floatingActionButton'),
            onPressed: () => context.read<Counter>().increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().count}',
      key: const Key("counterState"),
    );
  }
}

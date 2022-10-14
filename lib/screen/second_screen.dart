import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_in_flutter/provider/shopping_cart_provider.dart';
import 'package:provider_in_flutter/provider/counter_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Provider example app (${context.watch<Counter>().count})"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${context.watch<ShoppingCart>().count}'),
            Text('${context.watch<ShoppingCart>().cart}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addItem_floatingActionButton'),
        onPressed: () =>context.read<ShoppingCart>().addItem('Bread'),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}

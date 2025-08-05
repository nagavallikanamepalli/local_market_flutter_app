import 'package:flutter/material.dart';

final List<Map<String, String>> crops = [
  {'name': 'Tomato', 'price': '₹20/kg'},
  {'name': 'Potato', 'price': '₹15/kg'},
  {'name': 'Onion', 'price': '₹25/kg'},
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Market Prices'),
      ),
      body: ListView.builder(
        itemCount: crops.length,
        itemBuilder: (context, index) {
          final crop = crops[index];
          return Card(
            child: ListTile(
              title: Text(crop['name']!),
              subtitle: Text('Current Price: ${crop['price']}'),
            ),
          );
        },
      ),
    );
  }
}

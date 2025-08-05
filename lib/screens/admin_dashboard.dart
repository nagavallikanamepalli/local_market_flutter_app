import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<Map<String, String>> crops = [
    {'name': 'Tomato', 'price': '₹20/kg'},
    {'name': 'Potato', 'price': '₹15/kg'},
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void _addCrop() {
    if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
      setState(() {
        crops.add({
          'name': nameController.text,
          'price': priceController.text,
        });
        nameController.clear();
        priceController.clear();
      });
    }
  }

  void _deleteCrop(int index) {
    setState(() {
      crops.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Crop Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            ElevatedButton(
              onPressed: _addCrop,
              child: Text('Add Crop'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: crops.length,
                itemBuilder: (context, index) {
                  final crop = crops[index];
                  return ListTile(
                    title: Text('${crop['name']}'),
                    subtitle: Text('${crop['price']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteCrop(index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

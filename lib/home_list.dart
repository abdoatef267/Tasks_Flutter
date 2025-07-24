import 'package:flutter/material.dart';

class HomeListPage extends StatelessWidget {
  final List<String> items = [
    "Chat 1",
    "Chat 2",
    "Chat 3",
    "Chat 4",
    "Chat 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Example"),
        backgroundColor: Color(0xff0095FF),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.list),
              title: Text(items[index]),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}

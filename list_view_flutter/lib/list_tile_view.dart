import 'package:flutter/material.dart';

class ListTileView extends StatefulWidget {
  const ListTileView({super.key});

  @override
  State<ListTileView> createState() => _ListTileViewState();
}

class _ListTileViewState extends State<ListTileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("listTile "),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text(
              "My title",
              style: TextStyle(
                  fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "my subtitle",
              style: TextStyle(fontSize: 20),
            ),
            leading: const Icon(
              Icons.person,
              size: 50,
              color: Colors.orange,
            ),
            trailing: const Icon(
              Icons.edit,
              size: 30,
              color: Colors.green,
            ),
            textColor: Colors.blueAccent,
            tileColor: Colors.amberAccent.shade100,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          )
        ],
      ),
    );
  }
}

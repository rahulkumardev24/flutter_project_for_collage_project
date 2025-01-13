import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple List view"),),
      body: ListView(
        children: const [
          ListTile(title: Text("Rahul kumar"),leading: Icon(Icons.account_circle_rounded),),
          ListTile(title: Text("Rahul kumar"),leading: Icon(Icons.account_circle_rounded),),
          ListTile(title: Text("Rahul kumar"),leading: Icon(Icons.account_circle_rounded),),
          ListTile(title: Text("Rahul kumar"),leading: Icon(Icons.account_circle_rounded),),
          ListTile(title: Text("Rahul kumar"),leading: Icon(Icons.account_circle_rounded),),
          ListTile(title: Text("Rahul kumar"),leading: Icon(Icons.account_circle_rounded),),
          ListTile(title: Text("Rahul kumar"),leading: Icon(Icons.account_circle_rounded),),
          ListTile(title: Text("Rahul kumar"),leading: Icon(Icons.account_circle_rounded),),
        ],
      ),
    );
  }
}

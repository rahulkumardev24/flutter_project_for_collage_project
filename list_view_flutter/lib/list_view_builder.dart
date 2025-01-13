import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List view builder"),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              textColor: Colors.red,
              title: Center(
                  child: Text(
                "${index + 1}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            );
          }),
    );
  }
}

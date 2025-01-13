import 'package:flutter/material.dart';

class ListViewSeprater extends StatefulWidget {
  const ListViewSeprater({super.key});

  @override
  State<ListViewSeprater> createState() => _ListViewSepraterState();
}

class _ListViewSepraterState extends State<ListViewSeprater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("list view seprated"),),
      body: ListView.separated(itemBuilder: (context , index){
        return ListTile(
          title: Text("${index + 1}"),
          leading: const Icon(Icons.numbers),
        );
      }, separatorBuilder: (context , index){
        return Container(height: 5, color: Colors.yellow,);
      }, itemCount: 10),
    );
  }
}

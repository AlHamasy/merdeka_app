import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  List<int> number = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              listVertical(),
              listHorizontal(),
              gridView(),
              listVertical(),
              listHorizontal(),
              gridView(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget listVertical(){
    return ListView.builder(
        padding: EdgeInsets.zero, // menghilangkan padding bawaan
        itemCount: 5,
        shrinkWrap: true, // menyesuaikan tinggi list sesuai itemCount
        physics: NeverScrollableScrollPhysics(), // menonaktifkan scroll di list
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Index ke $index"),
            ),
          );
        },
    );
  }

  Widget listHorizontal(){
    return SizedBox(
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text("Index ke $index"),
            ),
          );
        },
      ),
    );
  }

  Widget gridView(){
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // jumlah horizontalnya fix
      //     crossAxisCount: 4,
      //     mainAxisSpacing: 8,
      //     crossAxisSpacing: 8,
      //     //childAspectRatio: 1.3
      // ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( // jumlah horizontalnya dinamis / berubah ketika dirotate
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1
      ),
      itemCount: 10,
      itemBuilder: (context, index){
        return Card(
          child: Column(
            children: [
              Icon(Icons.home),
              Text("Beranda"),
            ],
          ),
        );
      }
    );
  }
  
}

import 'package:flutter/material.dart';

class LatihanRowScreen extends StatelessWidget {
  const LatihanRowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height / 2,
            color: Colors.greenAccent,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text("Button 1")),
                  ElevatedButton(onPressed: (){}, child: Text("Button 2")),
                  ElevatedButton(onPressed: (){}, child: Text("Button 3")),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            //height: height / 2,
            color: Colors.redAccent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Ini Text"),
                Icon(Icons.home, size: 64),
                ElevatedButton(onPressed: (){}, child: Text("Button 1")),
              ],
            ),
          ),
          Stack(
            children: [
              Image.asset("assets/image/sample2.jpeg", fit: BoxFit.cover),
              Positioned(
                  right: 0,
                  bottom: 0,
                  left: 0,
                  top: 0,
                  child: Icon(Icons.home, color: Colors.greenAccent, size: 64)
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: Text("Merdeka App"),
                ),
              ),
              Icon(Icons.verified)
            ],
          ),
          Row(
            children: [
              Flexible(child: Container(color: Colors.orange, child: Text("Merdeka App"))),
              Icon(Icons.verified)
            ],
          )
        ],
      ),
    );
  }
}

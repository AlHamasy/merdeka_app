// stl -> StatelesWidget
// stf ->StatefulWidget

import 'package:flutter/material.dart';

class LatihanScreen extends StatelessWidget {
  const LatihanScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var paddingTop = MediaQuery.of(context).padding.top;
    var paddingBottom = MediaQuery.of(context).padding.bottom;

    debugPrint("Lebar device $width");
    debugPrint("Tinggi device $height");
    debugPrint("Padding top $paddingTop");
    debugPrint("Padding bottom $paddingBottom");

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop),
          //padding: const EdgeInsets.all(16),
          //padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // atur secara horizontal
              children: [
                //SizedBox(height: paddingTop),
                Text(
                    "Ini contoh Text,Ini contoh Text,Ini contoh Text,Ini contoh Text,Ini contoh Text,Ini contoh Text,Ini contoh Text,Ini contoh Text,",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                      backgroundColor: Colors.greenAccent,
                    ),
                  maxLines: 2, // baris maksimal
                  overflow: TextOverflow.ellipsis, // menampilkan ... jika teksnya terlalu panjang
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: (){
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                          "Ini ElevatedButton",
                          style: TextStyle(color: Colors.white)
                      )
                  ),
                ),
                OutlinedButton(
                    onPressed: (){
                    },
                    child: Text(
                        "Ini OutlinedButton",
                        style: TextStyle(color: Colors.black)
                    )
                ),
                FilledButton.tonal(
                    onPressed: (){
                    },
                    child: Text(
                        "Ini FilledButton",
                        style: TextStyle(color: Colors.black)
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.home, color: Colors.orange, size: 36)),
                BackButton(
                  onPressed: (){},
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Ini contoh TextField",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                      //borderRadius: BorderRadius.all(Radius.circular(16))         // bisa seperti ini
                      //borderRadius: BorderRadius.circular(16)                     // bisa seperti ini
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8))  // hanya kiri atas
                    ),
                    focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/image/sample2.jpeg", fit: BoxFit.cover)
                ),
                Image.network(
                  "https://www.idn.id/wp-content/uploads/2019/12/LOGO-IDN-SOSMED-768x240.png",
                  loadingBuilder: (context, child, progress){
                    if (progress == null) return child;
                    return CircularProgressIndicator();
                  },
                ),
                Image.network(
                  "https://www.idn.id/wp-content/uploads/2019/12/LOGO-IDN-SOSMED-768x240.png",
                  loadingBuilder: (context, child, progress){
                    if (progress == null) return child;
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

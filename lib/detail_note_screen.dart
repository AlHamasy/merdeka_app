import 'package:flutter/material.dart';
import 'package:merdeka_app/database/note_database.dart';
import 'package:merdeka_app/form_screen.dart';
import 'package:merdeka_app/model/note.dart';
import 'package:merdeka_app/utils/helper.dart';

class DetailScreen extends StatefulWidget {

  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  bool isLoading = false;
  Note? detailNote;

  @override
  void initState() {
    super.initState();
    getDetailNote();
  }

  void getDetailNote() async{
    isLoading = true;
    await NoteDatabase.getNoteById(widget.id)
        .then((value){
          detailNote = value;
        })
        .catchError((error){
          Helper.showSnackBar(context, "Error, ${error.toString()}", color: Colors.red);
        })
        .whenComplete((){
          setState(() {
            isLoading = false;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Note"),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormScreen(note: detailNote))
              ).then((value){
                if(value == Helper.NEED_REFRESH){
                  Navigator.pop(context, Helper.NEED_REFRESH);
                }
              });
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: (){
              showAlertConfirm();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detailNote?.title ?? "-", style: TextStyle(fontSize: 24)),
                  detailNote?.isCompleted == true
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.warning, color: Colors.orange),
                ],
              ),
              Text("Kategori: ${detailNote?.category}", style: TextStyle(fontSize: 18)),
              Text("Prioritas: ${detailNote?.priority}", style: TextStyle(fontSize: 18)),
              Text("Hari: ${detailNote?.days}", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertConfirm(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (alertContext){
          return AlertDialog(
            title: Text("Konfirmasi"),
            content: Text("Apakah anda yakin untuk menghapus data ini?"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(alertContext);
                  }, child: Text("Batal")
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(alertContext);
                    deleteNote();
                  }, child: Text("Hapus")
              ),
            ],
          );
        }
    );
  }

  void deleteNote() async{
    try{
      await NoteDatabase.deleteNote(widget.id);
      Helper.showSnackBar(context, "Hapus data berhasil", color: Colors.green);
      Navigator.pop(context, Helper.NEED_REFRESH);
    } catch (e){
      Helper.showSnackBar(context, "Hapus data gagal, ${e.toString()}", color: Colors.red);
    }
  }

}

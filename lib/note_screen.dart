import 'package:flutter/material.dart';
import 'package:merdeka_app/database/note_database.dart';
import 'package:merdeka_app/detail_note_screen.dart';
import 'package:merdeka_app/form_screen.dart';
import 'package:merdeka_app/model/note.dart';

import 'utils/helper.dart';

class NoteScreen extends StatefulWidget {

  const NoteScreen({super.key, required this.title});
  final String title;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  bool isLoading = false;
  List<Note> listNote = [];

  @override
  void initState() {
    super.initState();
    getAllNote();
  }

  void getAllNote() async {
    isLoading = true;
    await NoteDatabase.getAllNote()
        .then((value){
            listNote = value;
          })
        .catchError((error){
          Helper.showSnackBar(context, "Error: ${error.toString()}", color: Colors.red);
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : listNote.isNotEmpty
            ? showListNote()
            : Text("Note Kosong"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormScreen())
          ).then((value){
            // trigger untuk reload data
            if (value == Helper.NEED_REFRESH){
              getAllNote();
            }
          });
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget showListNote(){
    return ListView.builder(
        itemCount: listNote.length,
        itemBuilder: (context, index){
          var note = listNote[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(id: note.id ?? 0))
              ).then((value){
                if (value == Helper.NEED_REFRESH){
                  getAllNote();
                }
              });
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(note.title, style: TextStyle(fontSize: 24)),
                        note.isCompleted
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : Icon(Icons.warning, color: Colors.orange),
                      ],
                    ),
                    Text("Kategori: ${note.category}", style: TextStyle(fontSize: 18)),
                    Text("Prioritas: ${note.priority}", style: TextStyle(fontSize: 18)),
                    Text("Hari: ${note.days}", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

}
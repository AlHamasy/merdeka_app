import 'package:flutter/material.dart';
import 'package:merdeka_app/database/note_database.dart';
import 'package:merdeka_app/model/note.dart';

import 'utils/helper.dart';

class FormScreen extends StatefulWidget {

  final Note? note;
  const FormScreen({super.key, this.note});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  String? title;
  String? selectedCategory;
  String? selectedPriority;
  List<String> selectedDays = [];
  bool isCompleted = false;

  // contoh json untuk dropdown
  var data = [
    {
      "id": "1",
      "name": "Senin",
    },
    {
      "id": "2",
      "name": "Selasa",
    }
  ];

  List<String> categories = ["Pekerjaan", "Pribadi", "Lainnya"];
  List<String> priorities = ["Tinggi", "Sedang", "Rendah"];
  List<String> days = ["Senin","Selasa","Rabu","Kamis","Jumat","Sabtu","Minggu"];

  final formKey = GlobalKey<FormState>();

  Note? updateNote;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    updateNote = widget.note;
    if(updateNote != null){
      title = updateNote?.title;
      selectedCategory = updateNote?.category;
      selectedPriority = updateNote?.priority;
      selectedDays = updateNote!.days.split(",");
      isCompleted = updateNote!.isCompleted;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: updateNote != null ? Text("Update Note") : Text("Insert Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Judul", style: TextStyle(color: Colors.grey)),
                  TextFormField(
                    initialValue: title,
                    decoration: InputDecoration(
                        hintText: "Masukkan judul"
                    ),
                    onChanged: (value){
                      title = value;
                    },
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "Judul tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  Text("Kategori", style: TextStyle(color: Colors.grey)),
                  DropdownButtonFormField(
                    hint: Text("Pilih Kategori"),
                    value: selectedCategory,
                    items: categories.map((category){
                      return DropdownMenuItem(
                          value: category,
                          child: Text(category)
                      );
                    }).toList(),
                    onChanged: (onSelected){
                      setState(() {
                        selectedCategory = onSelected;
                      });
                    },
                    validator: (value){
                      if (value == null){
                        return "Kategori harus dipilih";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  Text("Prioritas", style: TextStyle(color: Colors.grey)),
                  Row(
                    children: priorities.map((priority){
                      return Flexible(
                          child: RadioMenuButton(
                              value: priority,
                              groupValue: selectedPriority,
                              onChanged: (onSelected){
                                setState(() {
                                  selectedPriority = onSelected;
                                });
                              },
                              child: Text(priority)
                          )
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 8),
                  Text("Hari", style: TextStyle(color: Colors.grey)),
                  Wrap(
                    children: days.map((day){
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CheckboxMenuButton(
                              value: selectedDays.contains(day),
                              onChanged: (isSelected){
                                setState(() {
                                  if (isSelected == true){
                                    selectedDays.add(day);
                                  } else {
                                    selectedDays.remove(day);
                                  }
                                });
                              },
                              child: Text(day)
                          )
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 8),
                  Text("Sudah Selesai?", style: TextStyle(color: Colors.grey)),
                  Switch(
                      value: isCompleted,
                      onChanged: (value){
                        setState(() {
                          isCompleted = value;
                        });
                      }
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate() && selectedPriority != null && selectedDays.isNotEmpty){
                            updateNote != null ? updateData() : insertNote();
                          } else {
                            Helper.showSnackBar(context, "Lengkapi yang kosong", color: Colors.red);
                          }
                        },
                        child: Text("Submit")
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  void insertNote() async{

    Note note = Note(
        title: title!,
        category: selectedCategory!,
        priority: selectedPriority!,
        days: selectedDays.join(","),
        isCompleted: isCompleted,
        createdTime: DateTime.now()
    );

    try{
      setState(() {
        isLoading = true;
      });
      await NoteDatabase.insertNote(note);
      Helper.showSnackBar(context, "Insert Note berhasil", color: Colors.green);
      Navigator.pop(context, Helper.NEED_REFRESH);
    } catch (e){
      Helper.showSnackBar(context, "Insert Note gagal ${e.toString()}", color: Colors.red);
      debugPrint(e.toString());
    } finally{
      setState(() {
        isLoading = false;
      });
    }

  }

  void updateData() async {

    Note note = Note(
        id: updateNote?.id,
        title: title!,
        category: selectedCategory!,
        priority: selectedPriority!,
        days: selectedDays.join(","),
        isCompleted: isCompleted,
        createdTime: DateTime.now()
    );

    try{
      await NoteDatabase.updateNote(note);
      Helper.showSnackBar(context, "Update Note berhasil", color: Colors.green);
      Navigator.pop(context, Helper.NEED_REFRESH);
    } catch (e){
      Helper.showSnackBar(context, "Update Note gagal ${e.toString()}", color: Colors.red);
    }

  }

}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir/style/app_style.dart';
import 'package:get/get.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.doc['note_title'];
    _mainController.text = widget.doc['note_content'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Read Note",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Color(0xFFB64436),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("Notes")
                            .doc(widget.doc.id)
                            .update({
                          "note_title": _titleController.text,
                          "creation_date": date,
                          "note_content": _mainController.text,
                        }).then((value) => Get.back());
                      },
                      child: Icon(
                        Icons.edit,
                        size: 24.0,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.grey[700],
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 8.0,
                          ),
                        ),
                      ),
                    ),
                    //
                    SizedBox(
                      width: 8.0,
                    ),
                    //
                    ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("Notes")
                            .doc(widget.doc.id)
                            .delete()
                            .then((value) => Get.back());
                      },
                      child: Icon(
                        Icons.delete_forever,
                        size: 24.0,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.red[300],
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 8.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Note Title',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      style: AppStyle.mainTitle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      date,
                      style: AppStyle.dateTitle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _mainController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Note Content',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                          )),
                      style: AppStyle.mainContent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

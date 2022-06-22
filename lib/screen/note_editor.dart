import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir/style/app_style.dart';
import 'package:flutter/cupertino.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  String date = DateTime.now().toString();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();

  Color id_color = new Color(0XFF5F7161);

  String? dropdownValue = 'green';
  List<String> dropdownItems = <String>[
    'white',
    'red',
    'pink',
    'orange',
    'yellow',
    'green',
    'teal',
    'mint',
    'blue',
    'peach',
    'purple',
  ];

  @override
  Widget build(BuildContext context) {
    void _showSnackBar(String text, String ans) {
      final SnackBar snackBar = SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: ans.compareTo('Yes') == 0 ? Colors.green : Colors.red,
        content: Row(
          children: [
            Icon(
              ans.compareTo('Yes') == 0 ? Icons.favorite : Icons.watch_later,
              color: ans.compareTo('Yes') == 0 ? Colors.pink : Colors.yellow,
              size: 24,
              semanticLabel: text,
            ),
            Text(text)
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    Future<void> _cupertinoDialog() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: Text(
                "Simpan note?",
                style: AppStyle.mainContent,
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () async {
                    Navigator.pop(context, "Ya");
                    FirebaseFirestore.instance.collection("Notes").add({
                      "note_title": _titleController.text,
                      "creation_date": date,
                      "note_content": _mainController.text,
                      "color_id": id_color.value
                    }).then((value) => Get.back());
                  },
                  child: Text(
                    "Ya",
                    style: AppStyle.mainContent,
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context, "Batal");
                  },
                  child: Text(
                    "Batal",
                    style: AppStyle.mainContent,
                  ),
                ),
              ],
            );
          })) {
        case "Ya":
          _showSnackBar("Note Tersimpan!", "Ya");
          break;
        case "Batal":
          _showSnackBar("Note Batal tersimpan.", "Batal");
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB64436),
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        title: Text(
          "Add a new Note",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          Container(
            color: Color(0xFFB64436),
            padding: EdgeInsets.all(8),
            child: Center(
              child: DropdownButton(
                dropdownColor: Color(0xFFB64436),
                iconEnabledColor: Color.fromARGB(255, 248, 191, 22),
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 15,
                elevation: 2,
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),
                onChanged: (String? color_id) {
                  setState(() {
                    dropdownValue = color_id;
                    id_color = myColors(dropdownValue!);
                  });
                },
                items:
                    dropdownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: 8,
            ),
            //Waktu
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFB64436),
        onPressed: _cupertinoDialog,
        child: Icon(Icons.save),
      ),
    );
  }

  Color myColors(String _color) {
    if (_color.compareTo("white") == 0) {
      return Color(0XFFF6F5F5);
    } else if (_color.compareTo("red") == 0) {
      return Color(0XFFAA3A3A);
    } else if (_color.compareTo("pink") == 0) {
      return Color(0XFFCA8A8B);
    } else if (_color.compareTo("orange") == 0) {
      return Color(0XFFF1935C);
    } else if (_color.compareTo("yellow") == 0) {
      return Color(0XFFFFC85C);
    } else if (_color.compareTo("green") == 0) {
      return Color(0XFF5F7161);
    } else if (_color.compareTo("teal") == 0) {
      return Color(0XFF5EAAA8);
    } else if (_color.compareTo("mint") == 0) {
      return Color(0XFF94B49F);
    } else if (_color.compareTo("blue") == 0) {
      return Color(0XFF6B7AA1);
    } else if (_color.compareTo("peach") == 0) {
      return Color(0XFFC1A3A3);
    } else if (_color.compareTo("purle") == 0) {
      return Color(0XFF9A86A4);
    } else {
      return Colors.white;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:todolistappfinal/my_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({super.key,required this.controller,required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(255, 191, 128, 5),
      content: Container(

        height: 120,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent), // Make focused outline transparent
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent), // Make outline transparent
                ),

                // border: OutlineInputBorder(),
                hintText: "Add a new task....",
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 8,),
                MyButton(text: "Cancel", onPressed: onCancel),

              ],
            )
          ],
        ),
      ),
    ) ;
  }
}

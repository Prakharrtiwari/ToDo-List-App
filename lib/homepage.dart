import 'package:flutter/material.dart';
import 'package:todolistappfinal/data/database.dart';
import 'package:todolistappfinal/dialog_box.dart';
import 'package:todolistappfinal/todotile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {
  TodoDatabase db= TodoDatabase();

  final TextEditingController _controller = TextEditingController();


  void checkboxchanged(bool? value,int index) {
    setState(() {
      db.Todolist[index][1] = !db.Todolist[index][1];
    });
    db.updateDatabase();
  }
  final _mybox=Hive.box('mybox');

  void saveNewTask() {
    if (_controller.text.isNotEmpty) { // Check if the input is not empty
      setState(() {
        db.Todolist.add([_controller.text, false]); // Add new task as unchecked
        _controller.clear(); // Clear the input
      });
      Navigator.of(context).pop(); // Close the dialog
    } else {
      // Optionally, show an alert if the task is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task cannot be empty!')),
      );
    }
    db.updateDatabase();
  }


    void createNewTask() {
      showDialog(context: context, builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
      );
    }

   void deletetask(int index){
    setState(() {
      db.Todolist.removeAt(index);
    });
    db.updateDatabase();
   }

   void initState(){
     super.initState();
    if(_mybox.get("TODOLIST")==null){
      db.createInitialData();

    }
    else{
      db.loadData();
    }

   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromRGBO(255, 230, 204, 1),


      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255,153,51, 1),


        toolbarHeight: 60,
        title: Text("T O   D O" , style: TextStyle(
          color: Colors.white60,
          fontWeight: FontWeight.bold,
          fontSize: 27,

        ),),
        centerTitle: true,


        ),

        body: ListView.builder(
          itemCount: db.Todolist.length,
          itemBuilder: (context, index) {
            return Todotile(
              taskName: db.Todolist[index][0],
              taskCompleted: db.Todolist[index][1],
              onChanged: (value) => checkboxchanged(value, index),
              deletefunction: (context)=> deletetask(index),
            );
          },
        ),

        floatingActionButton: FloatingActionButton(onPressed: createNewTask,
          child: Icon(Icons.add, size: 35, ),backgroundColor: Color.fromRGBO(255,153,51, 1),
      foregroundColor: Colors.white60, )


    );






  }


}

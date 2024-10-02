import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{
  List Todolist=[];
  final _mybox=Hive.box('mybox');

  void createInitialData(){
    Todolist=[
      ["My First App",false]
    ];
    updateDatabase();
  }

  void loadData(){
    Todolist=_mybox.get("TODOLIST");
  }

  void updateDatabase(){
     _mybox.put("TODOLIST",Todolist);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class Todotile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)?deletefunction;
  Todotile({
    super.key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deletefunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: BehindMotion(),
            children:[
              SlidableAction(
                onPressed: (BuildContext context) {
                  if (deletefunction != null) {
                    deletefunction!(context); // Call the delete function
                  }
                },
                icon: Icons.delete,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.circular(12)//
                // nal: change icon color
              ),
            ] ),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(

            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,
              activeColor: Colors.black87,),
              Text(taskName ,style: TextStyle(color: Colors.black87,
              decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none,),)
            ],
          ),
          decoration: BoxDecoration(color: Color.fromRGBO(255, 191, 128, 5),
          borderRadius: BorderRadius.circular(12),),
        ),
      ),
    );
  }
}

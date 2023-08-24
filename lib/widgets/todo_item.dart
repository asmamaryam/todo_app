import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/todo.dart';

class TODOITEM extends StatelessWidget {
  // // var for ietrating the arry item '=
  final todo tood;
  final ontodoChange;
  final onDeleteItem;
  TODOITEM(
      {Key? key,
      required this.tood,
      required this.ontodoChange,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          ontodoChange(tood);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          tood.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdblue,
        ),
        title: Text(
          tood.text.toString(),
          style: TextStyle(
            color: tdblack,
            fontSize: 16,
            decoration: tood.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdred,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
              size: 18,
            ),
            onPressed: () {
              onDeleteItem(tood.id);
            },
          ),
        ),
      ),
    );
  }
}

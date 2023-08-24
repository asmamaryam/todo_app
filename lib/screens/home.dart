// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';

import '../widgets/todo_item.dart';
import '../constants/colors.dart';
import '../models/todo.dart';

class HOME extends StatefulWidget {
  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  // bring the arry from todo model
  final todoList = todo.todoList();
  List<todo> _searchtodo = [];
  final _todocontrollor = TextEditingController();

  @override
  void initState() {
    _searchtodo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdbgcolor,
        appBar: AppBar(
          backgroundColor: tdbgcolor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                color: tdblack,
                size: 30,
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                      'assets/images/john-cameron-F4afVdyrlz4-unsplash.jpg'),
                ),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: <Widget>[
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            top: 30,
                            bottom: 20,
                          ),
                          child: const Text(
                            'All ToDos',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        for (todo too in _searchtodo.reversed)
                          SingleChildScrollView(
                            child: TODOITEM(
                              tood: too,
                              ontodoChange: _handletodoChange,
                              onDeleteItem: _deletetodoItem,
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0)),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todocontrollor,
                        decoration: InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 40),
                      ),
                      onPressed: () {
                        _addNewItem(_todocontrollor.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tdblue,
                          minimumSize: Size(60, 60),
                          elevation: 10),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
//   for isDone

  void _handletodoChange(todo tada) {
    setState(() {
      tada.isDone = !tada.isDone;
    });
  }

  // for delete
  void _deletetodoItem(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  //  for new item
  void _addNewItem(String todoa) {
    setState(() {
      todoList.add(todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(), text: todoa));
    });
    _todocontrollor.clear();
  }
//  for searxh

  void runfilter(String entervalue) {
    List<todo> result = [];
    if (entervalue.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((element) =>
              element.text!.toLowerCase().contains(entervalue.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchtodo = result;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => runfilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: tdblack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: tdgrey,
          ),
        ),
      ),
    );
  }
}

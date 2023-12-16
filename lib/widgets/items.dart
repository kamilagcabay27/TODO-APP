import 'package:flutter/material.dart';
import 'package:todo_app/color/colors.dart';
import 'package:todo_app/model/todo_model.dart';

class ToDOItems extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItems;

  const ToDOItems({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //print('Clicked on Todo Item');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: todo.isDone ? Colors.blue : todoBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: todo.isDone ? Colors.grey : todoBlack,
            decoration: todo.isDone ? TextDecoration.underline : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: todoRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: MaterialButton(
              padding: const EdgeInsets.only(right: 0.1),
              child: const Icon(
                Icons.delete,
                size: 18,
                color: Colors.white,
              ),
              onPressed: () {
                //debugPrint('Clicked onDeleteItems');
                onDeleteItems(todo.id);
              }),
        ),
      ),
    );
  }
}

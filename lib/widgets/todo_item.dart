import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/TodoModel.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;
  final onToDoChange;
  final onDeleteItem;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToDoChange,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            color: tdBlack,
            fontSize: 16,
            fontWeight: todo.isDone ? FontWeight.normal : FontWeight.bold,
            decoration:
                todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}

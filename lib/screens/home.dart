import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/TodoModel.dart';
import 'package:todo_app/widgets/searchbox.dart';
import 'package:todo_app/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = TodoModel.todoList();
  final todoController = TextEditingController();
  List<TodoModel> foundTodo = [];

  void _handleToDoChange(TodoModel todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteToDo(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  void addTodoItem(String data) {
    setState(() {
      todoList.add(
          TodoModel(id: DateTime.now().microsecond.toString(), todoText: data));
    });
    todoController.clear();
  }

  @override
  void initState() {
    foundTodo = todoList;
    super.initState();
  }

  void searchTodo(String searchText) {
    List<TodoModel> result = [];

    if (searchText.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((element) =>
              element.todoText.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }

    setState(() {
      foundTodo = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: AppBar(
        backgroundColor: tdBgColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            Container(
              height: 60,
              width: 60,
              child: ClipRRect(
                child: Image.asset('assets/images/men1.jpg'),
                borderRadius: BorderRadius.circular(30),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                searchBox(searchTodo),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          "All Todo",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (TodoModel todo in foundTodo)
                        TodoItem(
                          todo: todo,
                          onToDoChange: _handleToDoChange,
                          onDeleteItem: _handleDeleteToDo,
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 10,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(hintText: "Add new todo"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      addTodoItem(todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(60, 60),
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

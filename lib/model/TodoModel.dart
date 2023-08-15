class TodoModel {
  String id;
  String todoText;
  bool isDone;

  TodoModel({required this.id, required this.todoText, this.isDone = false});
  static List<TodoModel> todoList() {
    return [
      TodoModel(id: '1', todoText: "todoText1", isDone: true),
      TodoModel(id: '2', todoText: "todoText2", isDone: true),
      TodoModel(
        id: '3',
        todoText: "todoText3",
      ),
      TodoModel(
        id: '4',
        todoText: "todoText4",
      ),
      TodoModel(id: '5', todoText: "todoText5", isDone: true),
      TodoModel(id: '6', todoText: "todoText6", isDone: true),
      TodoModel(
        id: '7',
        todoText: "todoText7",
      ),
      TodoModel(
        id: '8',
        todoText: "todoText8",
      ),
    ];
  }
}

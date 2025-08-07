import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

class Todo {
  String title;
  bool isDone;
  String? subtitle;

  Todo({
    required this.title,
    this.isDone = false,
    this.subtitle
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'subtitle': subtitle,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      isDone: map['isDone'],
      subtitle: map['subtitle']
    );
  }
}

class TodoController extends GetxController {
  var todoList = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    var box = await Hive.openBox('todoBox');
    todoList.value = box.values.map((e) => Todo.fromMap(Map<String, dynamic>.from(e))).toList();
  }

  Future<void> addTodo(Todo todo) async {
    var box = await Hive.openBox('todoBox');
    await box.add(todo.toMap());
    loadTodos();
  }

  Future<void> updateTodo(Todo todo) async {
    var box = await Hive.openBox('todoBox');
    await box.putAt(todoList.indexOf(todo), todo.toMap());
    loadTodos();
  }

  Future<void> deleteTodo(Todo todo) async {
    var box = await Hive.openBox('todoBox');
    await box.deleteAt(todoList.indexOf(todo));
    loadTodos();
  }
}


class TodoPage extends StatelessWidget {

  final TodoController controller = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Todo Title'),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: subtitleController,
                    decoration: InputDecoration(labelText: 'Todo Subtitle'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (titleController.text.isNotEmpty) {
                      Todo todo = Todo(
                        title: titleController.text,
                        subtitle: subtitleController.text
                      );
                      controller.addTodo(todo);
                      titleController.clear();
                      subtitleController.clear();
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.todoList.length,
                itemBuilder: (context, index) {
                  var todo = controller.todoList[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.subtitle ?? "No Subtitle"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            todo.isDone
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          onPressed: () {
                            todo.isDone = !todo.isDone;
                            controller.updateTodo(todo);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            controller.deleteTodo(todo);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
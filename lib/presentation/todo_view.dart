/*
TO DO VIEW: responsible for UI

- use BlocBuilder
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/domain/models/todo.dart';
import 'package:todo_bloc_app/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  // show dialog for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          // cancel button
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel")),

          // add button
          TextButton(
            onPressed: () {
              todoCubit.addTodo(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // to do cubit
    final todoCubit = context.read<TodoCubit>();

    // SCAFFOLD
    return Scaffold(
        //FAB
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTodoBox(context),
          child: Icon(Icons.add),
        ),

        // BLOC BUILDER
        body: BlocBuilder<TodoCubit, List<Todo>>(
          builder: (context, todos) {
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                // get individual todo from todos list
                final todo = todos[index];

                // List Tile UI
                return ListTile(
                  // text
                  title: Text(todo.text),

                  // checkbox
                  leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) => todoCubit.toggleCompletion(todo)),

                  // delete button
                  trailing: IconButton(
                      onPressed: () => todoCubit.deleteTodo(todo),
                      icon: Icon(Icons.delete)),
                );
              },
            );
          },
        ));
  }
}

/*
TO DO REPOSITORY

Here you define what the app can do.

*/



import 'package:todo_bloc_app/domain/models/todo.dart';

abstract class TodoRepo {
  //get list of todos
  Future<List<Todo>> getTodos();

  //add a new todo
  Future<void> addTodo(Todo newTodo);

  //update an existing todo
  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);
}


/*
Notes:

- the repo in domain layer outlines what operation the app can do, 
  but doesnt worry about the specifics implementation details. 
  thats for the data layer.

- technology agnostic: independent of any technology or framework.

*/
/*
TO DO MODEL

This is what a todo object is.

it has 3 properties:

- id
- text
- isCompleted

methods :

- toggle completion on & off

 */

class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({required this.id, required this.text, this.isCompleted = false});

  Todo toggleCompletion(){
    return Todo(id: id, text: text, isCompleted: !isCompleted);
  }
}

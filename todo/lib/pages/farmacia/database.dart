import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final _farmaciaBox = Hive.box("Farmacia");

  void createInitialData() {
    toDoList = [
      ["Deslize para os lados <-> ", false],
      ["Clique no + para Adicionar", false],
    ];
  }

  void loadData() {
    toDoList = _farmaciaBox.get("TODOLIST");
  }

  void updateDataBase() {
    _farmaciaBox.put("TODOLIST", toDoList);
  }
}

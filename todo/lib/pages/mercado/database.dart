import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];


  final mercadoBox = Hive.box("Mercado");

  void createInitialData() {
    toDoList = [
      ["Deslize para os lados <-> ", false],
      ["Clique no + para Salvar", false],
    ];
  }

  void loadData() {
    toDoList = mercadoBox.get("TODOLIST");
  }

  void updateDataBase() {
    mercadoBox.put("TODOLIST", toDoList);
  }
}

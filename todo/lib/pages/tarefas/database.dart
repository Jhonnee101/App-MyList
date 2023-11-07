import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final _atividadesBox = Hive.box("Atividades");

  void createInitialData() {
    toDoList = [
      ["Deslize para os lados <-> ", false],
      ["Clique no + para Salvar", false],
    ];
  }

  void loadData() {
    toDoList = _atividadesBox.get("TODOLIST");
  }

  void updateDataBase() {
    _atividadesBox.put("TODOLIST", toDoList);
  }
}

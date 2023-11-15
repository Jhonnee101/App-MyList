import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/farmacia/database.dart';
import 'package:todo/util/diolog_box.dart';
import 'package:todo/util/todo_tile.dart';

var box = Hive.openBox("myfarm");

class FarmaciaPage extends StatefulWidget {
  const FarmaciaPage({Key? key}) : super(key: key);

  @override
  _FarmaciaPageState createState() => _FarmaciaPageState();
}

class _FarmaciaPageState extends State<FarmaciaPage> {
  final farmaciaBox = Hive.box("Farmacia");
  ToDoDataBase db = ToDoDataBase();
  final _controller = TextEditingController();

  @override
  void initState() {
    if (farmaciaBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DynamicAlertDialog(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 24, 29, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Farmácia 🩺",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(41, 44, 53, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(41, 44, 53, 1),
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            shadowColor: Color.fromARGB(255, 128, 107, 89),
            elevation: 4),
      ),
      body: db.toDoList.isEmpty
          ? Center(
              child: Text(
                "Sua lista está vazia!",
                style: TextStyle(
                  fontSize: 25,
                  color: const Color.fromRGBO(252, 217, 184, 1),
                ),
              ),
            )
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onDelete: () => deleteTask(index),
                  onCheck: (status) => checkBoxChanged(true, index),
                );
              },
            ),
    );
  }
}

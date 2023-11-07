import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/mercado/database.dart';
import 'package:todo/util/diolog_box.dart';
import 'package:todo/util/todo_tile.dart';

class MercadoPage extends StatefulWidget {
  const MercadoPage({Key? key}) : super(key: key);

  @override
  _MercadoPageState createState() => _MercadoPageState();
}

class _MercadoPageState extends State<MercadoPage> {
  final mercadoBox = Hive.box("Mercado");
  ToDoDataBase db = ToDoDataBase();
  final _controller = TextEditingController();

  @override
  void initState() {
    if (mercadoBox.get("TODOLIST") == null) {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Mercado",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            shadowColor: Colors.yellow.shade700),
      ),
      body: db.toDoList.isEmpty
          ? Center(
              child: Text(
                "Sua lista está vazia!",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
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

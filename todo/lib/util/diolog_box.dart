import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0), // Borda mais arredondada
      child: AlertDialog(
        backgroundColor: const Color.fromARGB(255, 138, 144, 153),
        content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Adicionar",
                  filled: true,
                  fillColor: Color.fromARGB(255, 216, 214, 214),
                  contentPadding: EdgeInsets.all(10),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    text: "Salvar",
                    onPressed: onSave,
                    buttonColor: Colors.green.shade500,
                    textColor: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 45),
                  MyButton(
                    text: "Cancelar",
                    onPressed: onCancel,
                    buttonColor: Colors.red.shade500,
                    textColor: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

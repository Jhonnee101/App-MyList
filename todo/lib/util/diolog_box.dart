import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class DynamicAlertDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DynamicAlertDialog({
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(41, 44, 53, 1),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              minLines: 2,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adicionar',
                filled: true,
                fillColor: Color.fromARGB(255, 95, 93, 93),
                contentPadding: EdgeInsets.all(10),
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
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
                  buttonColor: Colors.green.shade600,
                  textColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 45),
                MyButton(
                  text: "Cancelar",
                  onPressed: onCancel,
                  buttonColor: Colors.red.shade600,
                  textColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}

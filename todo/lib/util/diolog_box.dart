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
      backgroundColor: Color.fromARGB(255, 28, 27, 27),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              minLines: 2,
              maxLines:
                  null, // Defina como null para permitir o crescimento dinâmico
              keyboardType: TextInputType.multiline,
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Adicionar",
                filled: true,
                fillColor: Color.fromARGB(255, 95, 93, 93),
                contentPadding: EdgeInsets.all(10),
                hintStyle: TextStyle(color: Color.fromARGB(255, 214, 205, 205)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 170, 204, 232)),
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

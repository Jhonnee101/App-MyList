import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function() onDelete;
  final Function(bool status) onCheck;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDelete,
    required this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => onCheck(!taskCompleted),
              icon: Icons.check,
              backgroundColor: Colors.green.shade300,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => onDelete(),
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 118, 131, 138),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              //Nome da tarefa
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: taskCompleted
                      ? Colors
                          .black // Defina a cor da linha quando taskCompleted for verdadeiro
                      : null,
                  decorationThickness:
                      3.0, // Ou defina como null para usar a cor padrão do TextDecoration.lineThrough
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

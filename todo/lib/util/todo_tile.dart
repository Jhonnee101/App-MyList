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
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => onCheck(!taskCompleted),
              icon: taskCompleted ? Icons.undo : Icons.done_all,
              label: taskCompleted ? 'Desmarcar' : 'Marcar',
              backgroundColor: taskCompleted
                  ? Color.fromRGBO(179, 93, 13, 1)
                  : Colors.green.shade600,
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
              label: 'Deletar',
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(224, 145, 69, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 234, 232, 232),
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor:
                        taskCompleted ? Color.fromARGB(255, 17, 3, 2) : null,
                    decorationThickness: 4.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

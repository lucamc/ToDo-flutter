import 'package:flutter/material.dart';
import 'package:to_do_list/app/model/task.dart';
import 'package:to_do_list/app/pages/components/shape.dart';
import 'package:to_do_list/app/pages/components/title-principal.dart';

//Page Task List
class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final taskList = <Task>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _Header(),
          Expanded(child: _TaskList(taskList, onTaskDoneChange: (task) {
            task.done = !task.done;
            setState(() {

            });
          },
          )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        onPressed: () => _showNewTaskModal(context),
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }

  //Metodo para renderizar un modal
  void _showNewTaskModal(BuildContext context) {
    //Para mostrar una modal
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) =>
          _NewtaskModal(
            onTaskCreated: (Task task) {
              setState(() {
                taskList.add(task);
              });
            },
          ),
    );
  }
}

//Task Modal para agregar tareas
class _NewtaskModal extends StatelessWidget {
  _NewtaskModal({Key? key, required this.onTaskCreated}) : super(key: key);

  final _controller = TextEditingController();
  final void Function(Task task) onTaskCreated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 128,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(21))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitlePricipal(text: 'Nueva Tarea'),
          SizedBox(
            height: 26,
          ),
          //Campo para añadir texto TextField()
          SingleChildScrollView(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  filled: true, //El fondo es un relleno.
                  fillColor: Colors.white, //El relleno es de color blanco
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  //Placeholder del input
                  hintText: 'Descripcion de la tarea.'),
            ),
          ),
          SizedBox(
            height: 26,
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                final task = Task(_controller.text);
                onTaskCreated(task);
                Navigator.of(context).pop();
              }
              ;
            },
            child: Text('Guardar'),
          )
        ],
      ),
    );
  }
}

//Header del TaskListPage
class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Theme
              .of(context)
              .colorScheme
              .primary,
          child: Column(
            children: [
              Row(
                children: [Shape()],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/tasks-list-image.png',
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 22),
                    child: TitlePricipal(
                      text: 'Completa tus tareas',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//Task List el cual tiene un ListView
class _TaskList extends StatelessWidget {
  const _TaskList(this.taskList, {
    required this.onTaskDoneChange,
    Key? key,
  }) : super(key: key);

  final List<Task> taskList;
  final void Function(Task task) onTaskDoneChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitlePricipal(text: 'Tareas'),
          Expanded(
            child: ListView.separated(
              itemCount: taskList.length,
              separatorBuilder: (_, __) =>
              const SizedBox(
                height: 16,
              ),
              itemBuilder: (_, index) =>
                  _TaskItem(
                    taskList[index],
                    //cambio de estado de cada item cuando se hace tap.
                    onTap: () =>
                        onTaskDoneChange(taskList[index]
                        ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

//Task item, cards con chek_box y titulo de cada tarea.
class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key, this.onTap}) : super(key: key);

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      //Card de cada tarea.
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(
                //Renderizar el tipo de icon cuando sea true o false
                task.done
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary, size: 26,
              ),
              const SizedBox(
                width: 16,
              ),
              //Titulo de cada Tareas.
              Text(
                task.title,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

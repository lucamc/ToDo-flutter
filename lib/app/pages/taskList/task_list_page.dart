import 'package:flutter/material.dart';
import 'package:to_do_list/app/model/task.dart';
import 'package:to_do_list/app/pages/components/shape.dart';
import 'package:to_do_list/app/pages/components/title-principal.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          _Header(),
          Expanded(child: _TaskList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}

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
          color: Theme.of(context).colorScheme.primary,
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

class _TaskList extends StatefulWidget {
  const _TaskList({
    Key? key,
  }) : super(key: key);

  @override
  State<_TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {
  final taskList = <Task>[
    Task('Estudiar'),
    Task('Hacer la compra'),
    Task('Limpiar la cocina'),
  ];

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
              separatorBuilder: (_, __) => const SizedBox(
                height: 16,
              ),
              itemBuilder: (_, index) => _TaskItem(
                taskList[index],
                onTap: () {
                  taskList[index].done = !taskList[index].done;
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key, this.onTap}) : super(key: key);

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                task.done ? Icons.check_box_rounded : Icons.check_box_outline_blank,
                color: Theme.of(context).colorScheme.primary, size: 26,
              ),
              const SizedBox(
                width: 16,
              ),
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

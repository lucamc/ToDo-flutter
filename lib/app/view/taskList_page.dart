import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  int count = 0;

  //Method initState: Para inicializar el estado de una variable lo hacemos dentro de este méthod
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //Method dispose: Se ejecuta justo antes de eliminar la instancia de este widget
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hola el contador es $count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          setState(() {});
          ;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

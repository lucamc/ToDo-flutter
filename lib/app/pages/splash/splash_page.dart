import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_list/app/pages/components/shape.dart';
import 'package:to_do_list/app/pages/components/title-principal.dart';
import 'package:to_do_list/app/pages/taskList/task_list_page.dart';
import 'package:to_do_list/app/pages/components/shape.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: const [
              Shape()
            ],
          ),
          SizedBox( height: size.width > size.height ? 80 : 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Image.asset(
              'assets/images/onboarding-image.png',
              width: double.infinity,
            ),
          ),
          SizedBox( height: size.width > size.height ? 99 : 70,),
          const TitlePricipal(text: 'Lista de Tareas'),

          const SizedBox(
            height: 21,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TaskListPage();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

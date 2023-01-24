import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_list/app/view/components/shape.dart';
import 'package:to_do_list/app/view/components/title-principal.dart';
import 'package:to_do_list/app/view/task_list/task_list_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: const [
              Shape()
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            'assets/images/onboarding-image.png',
            width: 180,
            height: 168,
          ),
          const SizedBox(
            height: 99,
          ),
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
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

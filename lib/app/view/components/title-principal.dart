

import 'package:flutter/material.dart';


class TitlePricipal extends StatelessWidget {

  final String text;
  final Color? color;

  const TitlePricipal({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {

    return Text( text,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: color),
    );
  }
}

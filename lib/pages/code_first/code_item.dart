import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class CodeItem extends StatelessWidget {
  const CodeItem({required this.title,required this.type,Key? key}) : super(key: key);
  final String title;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: <Widget>[
        Image.asset(
          'assets/type${type == 0 ? '0' : '1'}.webp',
          width: 23,
          height: 23,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          overflow: TextOverflow.ellipsis,
        )),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/arrowRight.webp',
          width: 20,
          height: 16,
          fit: BoxFit.cover,
        ),
      ].toRow(),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
          Get.toNamed('/do_input_content',arguments: type);
    });
  }
}

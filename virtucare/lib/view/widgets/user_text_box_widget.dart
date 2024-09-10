import 'package:flutter/material.dart';

class UserTextBox extends StatelessWidget {
  final String text;
  const UserTextBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        //width: double.minPositive,
        //height: double.minPositive,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xB2DFF1E9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.800000011920929),
                fontSize: 15,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )
          ],
        ));
  }
}

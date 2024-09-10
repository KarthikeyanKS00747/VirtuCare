import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:virtucare/blocs/text_input_search/text_input_search_bar_bloc.dart';
//import 'package:virtucare/router/router.dart';
class SuggestionsRouteWidget extends StatelessWidget {
  final String text;
  final String route_location;
  const SuggestionsRouteWidget({super.key, required this.text, required this.route_location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         context.go(route_location);


         },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 15,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w700,
              height: 0,
              ),
              ),
              Icon(Icons.keyboard_arrow_right_outlined,
              color: Color(0xFF888888),)
          ],
        ),
        width: 329,
        height: 56,
        padding: const EdgeInsets.only(
        top: 16,
        left: 22,
        right: 19.59,
        bottom: 20,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
        color: Color(0x99E9F0ED),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),))
        ),
    );
  }
}
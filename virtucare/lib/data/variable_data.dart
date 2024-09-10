import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
//import 'package:virtucare/view/widgets/user_text_box_widget.dart';
TextEditingController searchText = TextEditingController(text: "");
List<Widget> textBoxList = [
  SizedBox(
    height: 182,
  ),
  Text(
    'What could I help you with?',
    style: TextStyle(
      color: Color(0xFF333333),
      fontSize: 36,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
  ),
];
List<ChatMessage> messages = [];
final FocusNode focusNode = FocusNode();
ChatUser currentUser =  ChatUser(id: "0", firstName: "User");
ChatUser geminiUser =  ChatUser(id: "1", firstName: "Gemini");
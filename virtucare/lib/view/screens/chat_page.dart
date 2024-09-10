import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:go_router/go_router.dart';
// import 'package:virtucare/blocs/text_input_search/text_input_search_bar_bloc.dart';
import 'package:virtucare/data/variable_data.dart';
import 'package:virtucare/view/widgets/user_text_box_widget.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Gemini gemini = Gemini.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButtonLocation:
      //         FloatingActionButtonLocation.centerFloat,
      //     floatingActionButton: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      //       child: Container(

      //         height: 48,
      //         width: double.maxFinite,
      //         padding: EdgeInsets.symmetric(vertical: 2),
      //         decoration: BoxDecoration(
      //             color: Colors.black12, borderRadius: BorderRadius.circular(60)),
      //         child: Center(
      //           child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               SizedBox(
      //                 width: 16,
      //               ),
      //               Expanded(
      //                 child: TextField(
      //                   //readOnly: true,
      //                   controller: searchText,
      //                   onSubmitted: (value) {

      //                     setState(() {
      //                     textBoxList.add(UserTextBox(text: searchText.text));
      //                     searchText.text = "";

      //                     });
      //                   },

      //                   decoration: InputDecoration(
      //                     border: InputBorder.none,
      //                     hintText: "Type Something",
      //                     hintStyle: TextStyle(
      //                       color: Colors.black,
      //                       fontFamily: 'Satoshi',
      //                       fontSize: 20,
      //                       fontWeight: FontWeight.w500,

      //                     ),

      //                     //contentPadding: EdgeInsets.symmetric(horizontal: 16),
      //                     fillColor: Color(0xFF66BC98),
      //                   ),
      //                 ),
      //               ),
      //               IconButton(
      //                 icon: Icon(Icons.camera),
      //                 onPressed: () {},
      //                 color: Colors.black,
      //                 iconSize: 33,
      //                 padding: EdgeInsetsDirectional.symmetric(vertical: 6),
      //               ),
      //               SizedBox(
      //                 width: 2,
      //               )

      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Chat Page 1"),
        leading: IconButton(
          onPressed: () => context.go('/home'),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 30),
            child: Center(
                child: DashChat(
              currentUser: currentUser,
              messages: messages,
              inputOptions: InputOptions(trailing: [IconButton(onPressed: (){}, icon: Icon(Icons.image)),]),
              onSend: (message) {
                setState(() {
                  messages = [message, ...messages];

                  try {
                    String question = message.text;
                    gemini.streamGenerateContent(question).listen((event) {
                      ChatMessage? lastMessage = messages.firstOrNull;
                      if (lastMessage != null &&
                          lastMessage.user == geminiUser) {
                        lastMessage = messages.removeAt(0);
                        String response = event.content?.parts?.fold(
                                "", (prev, curr) => "$prev${curr.text}") ??
                            "";
                        lastMessage.text += response;
                        setState(() {
                          messages = [lastMessage!, ...messages];
                        });
                      } else {
                        String response = event.content?.parts?.fold(
                                "", (prev, curr) => "$prev${curr.text}") ??
                            "";
                        ChatMessage message = ChatMessage(
                            user: geminiUser,
                            createdAt: DateTime.now(),
                            text: response);
                        setState(() {
                          messages = [message, ...messages];
                        });
                      }
                    });
                  } catch (e) {
                    print(e);
                  }
                });
              },
            ))),
      ),
    );

    // }ListView.builder(
    //                 //shrinkWrap: true,
    //                 //physics: NeverScrollableScrollPhysics(),
    //                 itemCount: textBoxList.length,
    //                 itemBuilder: (context, index) {
    //                   return Padding(
    //                     padding: const EdgeInsets.only(bottom: 15.0),
    //                     child: (textBoxList[index]),
    //                   );
  }
}

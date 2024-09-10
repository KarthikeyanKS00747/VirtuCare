import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtucare/blocs/seaches_bloc/recent_searches_bloc.dart';
// import 'package:virtucare/blocs/text_input_search/text_input_search_bar_bloc.dart';
import 'package:virtucare/view/widgets/circular_blinking_animation_widget.dart';
import 'package:virtucare/view/widgets/suggestions_route_widget.dart';
import 'package:virtucare/data/variable_data.dart';
import 'package:virtucare/view/widgets/user_text_box_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // Providing the vsync value
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<RecentSearchesBloc, RecentSearchesState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Container(
              height: 48,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(60)),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        //readOnly: true,
                        controller: searchText,
                        onSubmitted: (value) {
                          setState(() {
                            textBoxList.add(UserTextBox(text: searchText.text));
                            searchText.text = "";
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type Something",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Satoshi',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),

                          //contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          fillColor: Colors.white.withOpacity(0),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.camera),
                      onPressed: () {
                        if (controller.isAnimating) {
                          controller.stop();
                        } else {
                          controller.repeat(reverse: true);
                        }
                      },
                      color: Colors.black,
                      iconSize: 33,
                      padding: EdgeInsetsDirectional.symmetric(vertical: 6),
                    ),
                    SizedBox(
                      width: 2,
                    )
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 118,
                    ),
                    Stack(alignment: Alignment.center, children: [
                      CircularBlinkingAnimationWidget(
                        controller: controller,
                        delay: 0,
                        size: 80,
                      ),
                      CircularBlinkingAnimationWidget(
                        controller: controller,
                        delay: 0.1,
                        size: 100,
                      ),
                      CircularBlinkingAnimationWidget(
                        controller: controller,
                        delay: 0.2,
                        size: 120,
                      ),
                    ]),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "How are you feeling?",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Column(
                      children: [
                        SuggestionsRouteWidget(
                            text: "Describe Symptoms",
                            route_location: '/chatpage'),
                        SizedBox(
                          height: 21,
                        ),
                        SuggestionsRouteWidget(
                            text: "Look for Doctors",
                            route_location: '/chatpage'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            centerTitle: true,
            //notchMargin: 6.0,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.comment_rounded),
                    iconSize: 36,
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.local_hospital_rounded),
                    iconSize: 36,
                    onPressed: () {}),
              ],
            ),
          ),
        );
      },
    ));
  }
}

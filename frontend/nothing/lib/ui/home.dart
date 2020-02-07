import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/bloc/questions/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/ui/cardsmaster.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (BlocProvider.of<FeedBloc>(context).state.len < 36) {
      BlocProvider.of<QuestionsBloc>(context).add(const FetchQuestions());
    }
    focusNode.unfocus();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: NothingScheme.of(context).card,
        // color: Color(0xff5d26db),
        child: Stack(
          children: [
            _inputPoint(),
            Game(),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                focusNode.unfocus();
                focusNode.requestFocus();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputPoint() {
    return SizedBox(
      height: 1,
      width: 1,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: 200,
          width: 200,
          child: TextField(
            focusNode: focusNode,
            textInputAction: TextInputAction.go,
            onChanged: print,
          ),
        ),
      ),
    );
  }
}

class Game extends StatelessWidget {
  const Game({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.biggest.height);
          return Column(
            children: [
              SizedBox(
                height: 60,
                child: Label(),
              ),
              SizedBox(
                height: min(220, constraints.biggest.height - (60 + 70 + 12)),
                child: Center(
                  child: Question(),
                ),
              ),
              SizedBox(
                height: 70,
                child: Answer(
                  height: 70,
                ),
              ),
              // Expanded(
              //   child: Placeholder(),
              // )
            ],
          );
        },
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final double height;

  const Answer({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Color(0xfffdcf3c),
        borderRadius: BorderRadius.circular(28),
      ),
      // height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                onPressed: () => print("Press"),
                icon: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
          ),
          Center(
            child: AutoSizeText(
              "123123",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: NothingScheme.of(context).question,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class Question extends StatelessWidget {
  const Question({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "A K Q J ?",
      maxLines: 4,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 52,
        fontWeight: FontWeight.bold,
        color: NothingScheme.of(context).question,
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Text(
          "NOTHING PUZZLE 2",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

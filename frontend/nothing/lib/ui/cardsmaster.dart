import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/bloc/feed/bloc.dart';
import 'package:nothing/color/scheme.dart';
import 'package:nothing/data/model/question.dart';
import 'package:nothing/ui/cards.dart';

// Bind to dataflow and tune Cards widget
class CardsMaster extends StatelessWidget {
  const CardsMaster({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, Feed>(
      builder: (context, state) => Cards(
        feed: state,
        contentfactory: (ctx, que, anim) => NothingContent(que, anim),
        materialfactory: (ctx, cnt, anim) => NothingMaterial(cnt, anim),
        heightFactor: 0.60,
        widthFactor: 0.85,
        stack: 3,
      ),
    );
  }
}

class NothingContent extends StatelessWidget {
  final Question question;
  final Animation<double> animation;

  const NothingContent(this.question, this.animation);

  @override
  Widget build(BuildContext context) {
    return Text(
      question.question,
      style: TextStyle(
        color: NothingScheme.of(context).textbase,
        fontSize: 18,
      ),
    );
  }
}

class NothingMaterial extends StatelessWidget {
  final Widget content;
  final Animation<double> animation;

  const NothingMaterial(this.content, this.animation);

  @override
  Widget build(BuildContext context) {
    final scheme = NothingScheme.of(context);
    return Material(
      shadowColor: scheme.shadow,
      color: scheme.card,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: scheme.cardborder, width: 4),
        borderRadius: BorderRadius.circular(28),
      ),
      elevation: lerpDouble(1, 7, animation.value),
      child: content,
    );
  }
}

import 'package:coffere_app/library/intro_views_flutter-2.4.0/lib/Models/page_view_model.dart';
import 'package:flutter/material.dart';

/// This is the class which contains the Page UI.
class PageIntro extends StatelessWidget {
  ///page details
  final PageViewModel pageViewModel;

  ///percent visible of page
  final double percentVisible;

  /// [MainAxisAlignment]
  final MainAxisAlignment columnMainAxisAlignment;

  //Constructor
  const PageIntro({
    Key? key,
    required this.pageViewModel,
    this.percentVisible = 1.0,
    this.columnMainAxisAlignment = MainAxisAlignment.spaceAround,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Stack(
      children: [
        Positioned(
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.brown, blurRadius: 180, spreadRadius: 90),
              ],
            ),
          ),
          left: 20,
          right: 20,
          top: -size.height * 0.3,
          height: size.height,
        ),
        Positioned(
          height: 50,
          left: 20,
          top: 60,
          child: TweenAnimationBuilder<double>(
            child: Image.asset("assets/images/logo.png"),
            builder: (ctx, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            duration: const Duration(seconds: 2),
            tween: Tween(begin: 0.0, end: 1.0),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Opacity(
            //Opacity is used to create fade in effect
            opacity: percentVisible,
            child: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
              return orientation == Orientation.portrait
                  ? _buildPortraitPage(width, height)
                  : Container();
            }), //OrientationBuilder
          ),
        ),
      ],
    );
  }

  /// when device is Portrait place title, image and body in a column
  Widget _buildPortraitPage(double width, double height) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _ImagePageTransform(
            percentVisible: percentVisible, pageViewModel: pageViewModel),
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
                  child: _TitlePageTransform(
                    percentVisible: percentVisible,
                    pageViewModel: pageViewModel,
                  ),
                ), //Transform
                const SizedBox(
                  height: 15,
                ),
                Flexible(
                  flex: 2,
                  child: _BodyPageTransform(
                    percentVisible: percentVisible,
                    pageViewModel: pageViewModel,
                  ),
                ),
              ] //Transform
              ),
        )
      ],
    );
  }
}

/// Body for the Page.
class _BodyPageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _BodyPageTransform({
    Key? key,
    required this.percentVisible,
    required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //Used for vertical transformation
      transform:
          Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 15.0,
          left: 10.0,
          right: 10.0,
        ),
        child: DefaultTextStyle.merge(
          style: pageViewModel.bodyTextStyle,
          textAlign: TextAlign.center,
          child: pageViewModel.body,
        ),
      ), //Padding
    );
  }
}

/// Main Image of the Page
class _ImagePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _ImagePageTransform({
    Key? key,
    required this.percentVisible,
    required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //Used for vertical transformation
      transform:
          Matrix4.translationValues(0.0, 50.0 * (1 - percentVisible), 0.0),
      child: pageViewModel.mainImage, //Padding
    );
  }
}

/// Title for the Page
class _TitlePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _TitlePageTransform({
    Key? key,
    required this.percentVisible,
    required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //Used for vertical transformation
      transform:
          Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 0.0,
          left: 10.0,
          right: 10.0,
        ),
        child: DefaultTextStyle.merge(
          style: pageViewModel.titleTextStyle,
          child: pageViewModel.title,
        ),
      ), //Padding
    );
  }
}

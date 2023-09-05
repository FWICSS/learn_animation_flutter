import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class ExempleAnimationWidget extends StatefulWidget {
  const ExempleAnimationWidget({super.key});

  @override
  State<ExempleAnimationWidget> createState() => _ExempleAnimationWidgetState();
}

class _ExempleAnimationWidgetState extends State<ExempleAnimationWidget>
    with TickerProviderStateMixin {
  Size containerSize = Size(100, 100);
  Random random = Random();
  Color containerColor = Colors.blue;
  late AnimationController _controller;
  late Animation<Offset> slideTween;
  late Animation<double> rotateTween;
  late Animation<double> slide;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    slideTween = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1, 0.0),
    ).animate(_controller);

    rotateTween = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    slide = Tween<double>(begin: -60, end: 60).animate(_controller);

    Timer.periodic(Duration(seconds: 1), (timer) {
      containerSize = Size(
        random.nextInt(200).toDouble(),
        random.nextInt(200).toDouble(),
      );
      containerColor = Color.fromARGB(
          255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //? AnimationContainer
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Center(
  //       child: AnimatedContainer(
  //         color: containerColor,
  //         width: containerSize.width,
  //         height: containerSize.height,
  //         duration: Duration(seconds: 1),
  //       ),
  //     ),
  //   );
  // }

  //? FadeInImage
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child:
  //     FadeInImage.assetNetwork(
  //       placeholder: 'assets/placeholder.png',
  //       image: 'https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?cs=srgb&dl=pexels-pixabay-147411.jpg&fm=jpg',
  //       fit: BoxFit.cover,
  //     ),
  //     // Image.network(
  //     //   'https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?cs=srgb&dl=pexels-pixabay-147411.jpg&fm=jpg',
  //     //   fit: BoxFit.cover, // Ajustez le mode d'ajustement selon vos besoins
  //     // ),
  //   );
  // }

  // ? FadeTransition
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       child: Center(
  //     child: FadeTransition(
  //       opacity: _controller,
  //       child: Container(
  //         width: 100,
  //         height: 100,
  //         color: Colors.indigo,
  //       ),
  //     ),
  //   ));
  // }

  // ? SlideTransition
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       child: Center(
  //     child: SlideTransition(
  //       position: slideTween,
  //       child: Container(
  //         width: 200,
  //         height: 200,
  //         color: Colors.indigo,
  //       ),
  //     ),
  //   ));
  // }

  // ?  Transform
  // ?  Transform.rotate Transform.scale Transform.translate
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Transform.translate(
        offset: Offset(slide.value, slide.value),
        child: Transform.rotate(
          angle: rotateTween.value,
          child: AnimatedContainer(
            color: containerColor,
            width: containerSize.width,
            height: containerSize.height,
            duration: Duration(seconds: 1),
          ),
        ),
      ),
    ));
  }
}

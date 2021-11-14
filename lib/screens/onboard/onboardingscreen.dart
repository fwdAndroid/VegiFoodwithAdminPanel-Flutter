import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/screens/config/constant.dart';

class OnBoardingScreens extends StatefulWidget {
  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

int currentPage = 0;

final _controller = PageController(initialPage: 0);
List<Widget> _pages = [
  Column(
    children: [
      Expanded(child: Image.asset('assets/logo.png')),
      Text(
        'First Page',
        style: kPageView,
      ),
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('assets/logo.png')),
      Text(
        'Second Page',
        style: kPageView,
      ),
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('assets/logo.png')),
      Text(
        'Last Page',
        style: kPageView,
      ),
    ],
  ),
];

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _pages.length,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: Colors.redAccent,
          ),
        )
      ],
    );
  }
}

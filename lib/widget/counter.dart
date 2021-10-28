import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vegifood/config/config.dart';

class Counter extends StatefulWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 60,
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                    }
                    if (count < 1) {
                      setState(() {
                        count--;
                      });
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    color: Color(0xffd1ad17),
                    size: 20,
                  ),
                ),
                Text(
                  '$count',
                  style: TextStyle(
                    color: Color(0xffd1ad17),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Color(0xffd1ad17),
                      size: 20,
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: InkWell(
                  onTap: () {
                    setState(
                      () {
                        isTrue = true;
                      },
                    );
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(color: primaryColor),
                  )),
            ),
    );
  }
}

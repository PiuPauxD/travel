import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResonsive;
  double? width;

  ResponsiveButton({Key? key, this.width, this.isResonsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 20, 7, 204),
      ),
      child: Row(
        children: [
          TextButton(
            child: const Text(
              "Begin journey",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

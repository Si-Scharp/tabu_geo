import 'package:flutter/material.dart';

class KarteRueckseite extends StatelessWidget {
  bool showSecondIcon;
  VoidCallback? onTap;
  KarteRueckseite({this.showSecondIcon = false, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SizedBox.expand(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: AnimatedCrossFade(
            crossFadeState: showSecondIcon ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
            firstChild: Icon(Icons.keyboard_arrow_down, size: 60,),
            secondChild: Icon(Icons.threesixty, size: 60,),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class Wegwerfbar extends StatefulWidget {
  VoidCallback? onThrowAway;
  bool throwEnabled;
  Widget child;
  Wegwerfbar({Key? key, required this.child, this.onThrowAway, this.throwEnabled = true} ) : super(key: key);

  @override
  _WegwerfbarState createState() => _WegwerfbarState();
}

class _WegwerfbarState extends State<Wegwerfbar> {
  Offset target = Offset.zero;
  bool center = true;
  bool throwing = false;
  Offset? lastMovement;

  @override
  Widget build(BuildContext context) {

    return TweenAnimationBuilder(
      tween:  Tween<Offset>(
        begin: target,
        end: center || !widget.throwEnabled ? Offset(0,0) : target,
      ),
      duration: center || throwing ? Duration(milliseconds: 200) * target.distance.abs() * 0.003: Duration.zero,
      curve: Curves.easeOutQuad,
      builder: (_,Offset offset, child) {
        return Transform.translate(
            offset: offset,
            child: child!
        );
      },

      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanStart: (details) {
          setState(() {
            target = Offset.zero;
            center = false;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            target += details.delta;
            center = false;
          });
          lastMovement = details.delta;
        },
        onPanEnd: (details) {
          setState(() {
            center = true;
          });
          if (widget.throwEnabled && lastMovement != null && lastMovement!.distance.abs() > 4) {
            setState(() {
              center = false;
              throwing = true;
              target = target * 20;
            });
            if (widget.onThrowAway != null)
              widget.onThrowAway!();
          }
        },
        child: widget.child,

      ),
    );
  }
}

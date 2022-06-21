import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MouseButtonWidget extends StatelessWidget {
  final Color unFocusedTextColor;
  final Color focusedTextColor;
  final Widget child;

  const MouseButtonWidget({
    Key? key,
    this.unFocusedTextColor = Colors.grey,
    this.focusedTextColor = Colors.white,required this.child,}) : super(key: key);

  const MouseButtonWidget.text({
    Key? key,
    this.unFocusedTextColor = Colors.grey,
    this.focusedTextColor = Colors.white,
    required String text,
    this.child = const _MouseTextButtonWidget(
      text: text,
    ),
  }) : super(key: key);

  const MouseButtonWidget.icon({
    Key? key,
    this.unFocusedTextColor = Colors.grey,
    this.focusedTextColor = Colors.white,
    this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _MouseTextButtonWidget extends StatefulWidget {
  final String text;

  const _MouseTextButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<_MouseTextButtonWidget> createState() => _MouseTextButtonWidgetState();
}

class _MouseTextButtonWidgetState extends State<_MouseTextButtonWidget> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent enterEvent) {
        if (!_focused) {
          setState(() {
            _focused = true;
          });
        }
      },
      onExit: (PointerExitEvent exitEvent) {
        if (_focused) {
          setState(() {
            _focused = false;
          });
        }
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: _focused ? widget.focusedTextColor : widget.unFocusedTextColor,
              ),
            if (widget.text != null)
              Text(
                widget.text!,
                style: TextStyle(
                  color: _focused ? widget.focusedTextColor : widget.unFocusedTextColor,
                  fontSize: 16.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// class MouseButtonWidget extends StatefulWidget {
//   final Color unFocusedTextColor;
//   final Color focusedTextColor;
//   final String? text;
//   final IconData? icon;

//   const MouseButtonWidget.text({
//     Key? key,
//     this.unFocusedTextColor = Colors.grey,
//     this.focusedTextColor = Colors.white,
//     required this.text,
//     this.icon,
//   })  : assert((text != null) != (icon != null)),
//         super(key: key);

//   const MouseButtonWidget.icon({
//     Key? key,
//     this.unFocusedTextColor = Colors.grey,
//     this.focusedTextColor = Colors.white,
//     this.text,
//     required this.icon,
//   })  : assert((text != null) != (icon != null)),
//         super(key: key);

//   @override
//   State<MouseButtonWidget> createState() => _MouseButtonWidgetState();
// }

// class _MouseButtonWidgetState extends State<MouseButtonWidget> {
//   bool _focused = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (PointerEnterEvent enterEvent) {
//         if (!_focused) {
//           setState(() {
//             _focused = true;
//           });
//         }
//       },
//       onExit: (PointerExitEvent exitEvent) {
//         if (_focused) {
//           setState(() {
//             _focused = false;
//           });
//         }
//       },
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () {},
//         child: Stack(
//           children: [
//             if (widget.icon != null)
//               Icon(
//                 widget.icon,
//                 color: _focused ? widget.focusedTextColor : widget.unFocusedTextColor,
//               ),
//             if (widget.text != null)
//               Text(
//                 widget.text!,
//                 style: TextStyle(
//                   color: _focused ? widget.focusedTextColor : widget.unFocusedTextColor,
//                   fontSize: 16.0,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

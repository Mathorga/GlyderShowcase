import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MouseButtonWidget extends StatelessWidget {
  final Widget child;

  MouseButtonWidget.text({
    Key? key,
    Color unFocusedColor = Colors.grey,
    Color focusedColor = Colors.white,
    required String text,
  })  : child = _MouseTextButtonWidget(
          focusedColor: focusedColor,
          unFocusedColor: unFocusedColor,
          text: text,
        ),
        super(key: key);

  MouseButtonWidget.icon({
    Key? key,
    Color unFocusedColor = Colors.grey,
    Color focusedColor = Colors.white,
    required IconData icon,
  })  : child = _MouseIconButtonWidget(
          focusedColor: focusedColor,
          unFocusedColor: unFocusedColor,
          icon: icon,
        ),
        super(key: key);

  MouseButtonWidget.asset({
    Key? key,
    Color? unFocusedColor,
    Color? focusedColor,
    required String path,
  })  : child = _MouseImageButtonWidget(
          focusedColor: focusedColor,
          unFocusedColor: unFocusedColor,
          path: path,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class _MouseTextButtonWidget extends StatefulWidget {
  final Color unFocusedColor;
  final Color focusedColor;
  final String text;

  const _MouseTextButtonWidget({
    Key? key,
    this.unFocusedColor = Colors.grey,
    this.focusedColor = Colors.white,
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
        child: Text(
          widget.text,
          style: TextStyle(
            color: _focused ? widget.focusedColor : widget.unFocusedColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class _MouseIconButtonWidget extends StatefulWidget {
  final Color unFocusedColor;
  final Color focusedColor;
  final IconData icon;

  const _MouseIconButtonWidget({
    Key? key,
    this.unFocusedColor = Colors.grey,
    this.focusedColor = Colors.white,
    required this.icon,
  }) : super(key: key);

  @override
  State<_MouseIconButtonWidget> createState() => _MouseIconButtonWidgetState();
}

class _MouseIconButtonWidgetState extends State<_MouseIconButtonWidget> {
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
        child: Icon(
          widget.icon,
          color: _focused ? widget.focusedColor : widget.unFocusedColor,
        ),
      ),
    );
  }
}

class _MouseImageButtonWidget extends StatefulWidget {
  final Color? unFocusedColor;
  final Color? focusedColor;
  final String path;

  const _MouseImageButtonWidget({
    Key? key,
    this.unFocusedColor,
    this.focusedColor,
    required this.path,
  }) : super(key: key);

  @override
  State<_MouseImageButtonWidget> createState() => _MouseImageButtonWidgetState();
}

class _MouseImageButtonWidgetState extends State<_MouseImageButtonWidget> {
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
        child: Image.asset(
          widget.path,
          color: _focused ? widget.focusedColor : widget.unFocusedColor,
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverBuilder extends StatefulWidget {
  final OutlinedBorder? shape;
  final Color foregroundColor;
  final EdgeInsets paddingSize;

  const HoverBuilder({
    required this.builder,
    this.shape,
    this.foregroundColor = Colors.green,
    this.paddingSize = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  final Widget Function(bool isHovered) builder;

  @override
  _HoverBuilderState createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor:
              _isHovered ? Colors.transparent : widget.foregroundColor,
          minimumSize: Size.zero,
          padding: widget.paddingSize,
          shape: widget.shape ?? const CircleBorder(),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: widget.builder(_isHovered),
      ),
    );
  }

  void _onHoverChanged({required bool enabled}) {
    setState(() {
      _isHovered = enabled;
    });
  }
}

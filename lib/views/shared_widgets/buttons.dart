// Shared Custom Button Widgets
import 'package:flutter/material.dart';

// Primary Action Button
class SharedPrimaryActionButton extends StatefulWidget {
  final String label;
  final bool isEnabled;
  final VoidCallback callback;
  final Color overlayColor;
  final Color backgroundColor;
  bool isLoading;

  SharedPrimaryActionButton({
    super.key,
    required this.label,
    required this.isEnabled,
    required this.callback,
    required this.overlayColor,
    required this.backgroundColor,
    this.isLoading = false,
  });

  @override
  State<SharedPrimaryActionButton> createState() =>
      _SharedPrimaryActionButtonState();
}

class _SharedPrimaryActionButtonState extends State<SharedPrimaryActionButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed:
            (widget.isEnabled && !widget.isLoading) ? widget.callback : null,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          overlayColor: WidgetStatePropertyAll(widget.overlayColor),
          backgroundColor: WidgetStatePropertyAll(
            (widget.isEnabled && !widget.isLoading)
                ? widget.backgroundColor
                : Colors.grey[600],
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
          ),
        ),
        child: Text(
          (widget.isLoading) ? "Loading.." : widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// Shared Text Input Widget
import 'package:flutter/material.dart';
import 'package:greentoad_app/config/constants.dart';

class SharedTextInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final String? hintText;
  final FormFieldValidator<String>? validatorFn;

  const SharedTextInputWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLength,
    this.maxLines,
    this.prefixIcon,
    this.hintText,
    this.validatorFn,
  });

  @override
  State<SharedTextInputWidget> createState() => _SharedTextInputWidgetState();
}

class _SharedTextInputWidgetState extends State<SharedTextInputWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.labelText,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 4.0),
          TextFormField(
            controller: widget.controller,
            maxLength: (widget.maxLength == null) ? null : widget.maxLength,
            maxLines: (widget.maxLines == null) ? 1 : widget.maxLines,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelSmall,
              prefixIcon: widget.prefixIcon,
              filled: true,
              fillColor: Theme.of(context).primaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: primaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorStyle: const TextStyle(
                fontSize: 14.0,
                color: Colors.red,
              ),
              counterStyle: Theme.of(context).textTheme.labelSmall,
            ),
            cursorColor: Theme.of(context).primaryColorDark,
            style: Theme.of(context).textTheme.bodySmall,
            validator: widget.validatorFn,

            // closes system keyboard when user clicks outside the field
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}

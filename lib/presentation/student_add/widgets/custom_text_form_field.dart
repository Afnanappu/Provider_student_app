import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required this.label,
    required this.validator,
    this.keyboardType,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String? Function(String? value)? validator;
  final String label;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: _controller,
        validator: validator,
        cursorOpacityAnimates: true,
        enableIMEPersonalizedLearning: true,
        enableInteractiveSelection: true,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          // hoverColor: ,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          hoverColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.white),
          errorStyle: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

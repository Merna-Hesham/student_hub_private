import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.validator,
    required this.isPassword,
    required this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>{
  bool _hidden = true;

  @override
  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _hidden,
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
        ),
        prefixIcon: Icon(
          widget.icon,
          size: 24,
          color: scheme.onSurfaceVariant,
        ),
        suffixIcon: widget.isPassword ?
        IconButton(
          icon: Icon(
            _hidden ? Icons.visibility_off : Icons.visibility,
            size: 24,
            color: scheme.onSurfaceVariant,
          ),
          onPressed: () {
            setState(() {
              _hidden = !_hidden;
            });
          },
        ) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

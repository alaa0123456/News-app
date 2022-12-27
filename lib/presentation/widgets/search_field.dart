import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChangedFun,
    required this.suffixIcon,
    required this.controller,
  });
  final Function(String) onChangedFun;
  final Widget suffixIcon;

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChangedFun,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: 'Search ...',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

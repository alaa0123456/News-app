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
      style: const TextStyle(color: Colors.white),
      controller: controller,
      onChanged: onChangedFun,
      cursorColor: const Color.fromARGB(255, 127, 148, 203),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: 'Search ...',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}

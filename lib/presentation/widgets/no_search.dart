import 'package:flutter/material.dart';

class NoSearchFound extends StatelessWidget {
  const NoSearchFound({super.key, required this.searchedText});
  final String searchedText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.search,
            size: 150,
            color: Colors.grey,
          ),
          Text(
            'No results found for "$searchedText"',
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          )
        ],
      ),
    );
  }
}

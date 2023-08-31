import 'package:flutter/material.dart';

class PublicTitleSubPagesWidget extends StatelessWidget {
  const PublicTitleSubPagesWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: 750,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            const VerticalDivider(color: Colors.grey),
            Expanded(
              child: Text(description),
            )
          ],
        ),
      ),
    );
  }
}

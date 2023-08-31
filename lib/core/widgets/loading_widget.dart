import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: SizedBox(
          width: 300,
          // height: 150,
          child: Column(
            children: [
              // const SizedBox(height: 8),
              const LinearProgressIndicator(
                minHeight: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
          )),
    );
  }
}

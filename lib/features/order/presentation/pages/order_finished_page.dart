import 'package:flutter/material.dart';

class OrderFinishedPage extends StatelessWidget {
  const OrderFinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: const Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Obrigado pela compra',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 1.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}

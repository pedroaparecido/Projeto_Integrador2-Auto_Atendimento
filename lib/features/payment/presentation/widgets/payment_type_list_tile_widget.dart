import 'package:flutter/material.dart';

class PaymentTypeListTileWidget extends StatelessWidget {
  const PaymentTypeListTileWidget({super.key, required this.title, required this.onPressed, required this.icon});

  final String title;
  final void Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: const EdgeInsets.all(20),
        elevation: 4,
        child: Container(
          width: 200,
          height: 160,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(children: [
            icon,
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
          ]),
        ),
      ),
    );
  }
}

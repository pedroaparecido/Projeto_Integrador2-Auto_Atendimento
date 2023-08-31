import 'package:flutter/material.dart';

import '../../../../core/widgets/footer_widget.dart';

class AdminBodyWidget extends StatelessWidget {
  const AdminBodyWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Card(
              elevation: 5,
              child: SizedBox(
                width: 900,
                child: Column(
                  children: [
                    ...children,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomCenter,
              child: FooterWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

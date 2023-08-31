import 'package:flutter/material.dart';

class PublicBodyWidget extends StatelessWidget {
  const PublicBodyWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const HeaderWidget(),
            ...children,
            // FooterWidget(),
          ],
        ),
      ),
    );
  }
}

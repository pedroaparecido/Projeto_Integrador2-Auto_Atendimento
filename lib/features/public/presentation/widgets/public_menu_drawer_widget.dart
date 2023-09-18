import 'package:flutter/material.dart';

import '../../../../core/helpers/helper_menu_list_buttons.dart';

class PublicMenuDrawerWidget extends StatelessWidget {
  const PublicMenuDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ClipOval(
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/logo_rei_do_espeto.jpg',
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white.withOpacity(0.8),
            thickness: 4,
          ),
          const SizedBox(height: 35),
          ...menuListButtons.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: e,
            ),
          )
        ],
      ),
    );
  }
}

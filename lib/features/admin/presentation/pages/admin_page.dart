import 'package:flutter/material.dart';

import '../widgets/admin_menu_drawer_widget.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administração'),
      ),
      drawer: const AdminMenuDrawerWidget(),
      body: const Padding(padding: EdgeInsets.all(20.0), child: Center(child: FlutterLogo())),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qr_app/pages/directions.dart';
import 'package:qr_app/pages/history_page.dart';
import 'package:qr_app/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever_rounded))
        ],
      ),
      body: _HomePageBody(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final option = 0;
    switch (option) {
      case 0:
        return HistoryPage();
        break;
      case 1:
        return DirectionsPage();
        break;
      default:
        return HistoryPage();
    }
  }
}

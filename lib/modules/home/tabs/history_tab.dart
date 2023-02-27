import 'package:flutter/material.dart';
import 'package:voolo_app/shared/shared.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.vooloAppBar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimension.scaffoldHorPadding),
        child: const Center(
          child: Text(
            "Trang lịch sử",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voolo_app/shared/shared.dart';

class PromoTab extends StatelessWidget {
  const PromoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.vooloAppBar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimension.SCAFFOLD_HOR_PADDING),
        child: const Center(
          child: Text(
            "Trang khuyến mãi",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:luci_test/theme/app_fonts.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Lỗi Server",
        style: AppFonts.size15(),
      ),
    );
  }
}

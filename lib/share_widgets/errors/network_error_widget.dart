import 'package:flutter/material.dart';

import '../../theme/app_fonts.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Lỗi Mạng",
        style: AppFonts.size15(),
      ),
    );
  }
}

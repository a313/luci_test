import 'package:flutter/material.dart';
import 'package:luci_test/core/util/util.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.screenSize.height,
        child: const Center(child: CircularProgressIndicator()));
  }
}

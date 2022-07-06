import 'package:flutter/material.dart';

import 'injection.dart' as global;
import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  global.setup();
  runApp(const MyApp());
}

import 'package:flutter/material.dart';
import 'package:goevent2/login_signup/login.dart';
import 'package:provider/provider.dart';

import 'utils/colornotifire.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifire()),
      ],
      child: const MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

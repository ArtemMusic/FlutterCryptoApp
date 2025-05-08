import 'package:crypto_app/router/router.dart';
import 'package:crypto_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routers,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resepku/providers/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: SwitchListTile(
        title: const Text('Mode gelap'),
        value: themeMode == ThemeMode.dark,
        onChanged: context.read<ThemeProvider>().setDarkMode,
        secondary: const Icon(Icons.dark_mode_outlined),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeflutt/src/core/assets/assets.dart';

import '../../../../core/theme/theme_app.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key});

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<ThemeApp>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.optionTitile,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.op,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(Strings.optionDescription),
                  ],
                ),
                Spacer(),
                Switch(
                  value: theme.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    setState(() {
                      theme.toggleTheme();
                    });
                  },
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

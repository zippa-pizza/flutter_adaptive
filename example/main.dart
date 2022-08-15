import 'package:adaptive_icons/adaptive_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return adaptive.Route(
      title: 'App',
      child: SliverList(
        delegate: SliverChildListDelegate([
          adaptive.ListTile(
            leading: Icon(AdaptiveIcons(context).info),
            title: const Text('About'),
            onTap: () => showAboutDialog(context: context),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../generated/l10n.dart';

class HelpScreenTab extends StatelessWidget {
  const HelpScreenTab({Key? key}) : super(key: key);

  Future<void> _onOpen(LinkableElement link) async {
    final url = link.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Linkify(
          onOpen: _onOpen,
          text: S.of(context).helpText,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
          linkStyle: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'tawk_visitor.dart';

/// [Tawk] Widget.
class Tawk extends StatefulWidget {
  /// Tawk direct chat link.
  final String directChatLink;

  /// Object used to set the visitor name and email.
  final TawkVisitor? visitor;

  /// Called right after the widget is rendered.
  final Function? onLoad;

  /// Called when a link pressed.
  final Function(String)? onLinkTap;

  /// Render your own loading widget.
  final Widget? placeholder;

  const Tawk({
    Key? key,
    required this.directChatLink,
    this.visitor,
    this.onLoad,
    this.onLinkTap,
    this.placeholder,
  }) : super(key: key);

  @override
  _TawkState createState() => _TawkState();
}

class _TawkState extends State<Tawk> {
  @override
  void initState() {
    _launchUrl(widget.directChatLink);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
    throw Exception('Could not launch $url');
  }
}

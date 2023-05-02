import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsIcon extends StatelessWidget {
  const SocialsIcon({
    super.key,
    required this.theme,
    required this.url,
    required this.icon,
  });

  final String url;
  final IconData icon;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final parsedUrl = Uri.parse(url);
          if (await canLaunchUrl(parsedUrl)) {
            await launchUrl(parsedUrl);
          } else {
            throw "Couldn't launch $parsedUrl";
          }
          print('Hello');
        },
        child: FaIcon(
          icon,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}

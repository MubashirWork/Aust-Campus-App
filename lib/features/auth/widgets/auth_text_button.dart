import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AuthTextButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: WidgetStateColor.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: child,
    );
  }
}

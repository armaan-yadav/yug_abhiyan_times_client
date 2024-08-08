import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard({required String text, required BuildContext context}) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Copied to clipboard'),
      duration: Durations.long1,
    ),
  );
}

import 'package:flutter/material.dart';

extension StringExtension on String {
  Widget stylit({
    List<TextStyle> styles = const [],
    startSymbol = '<span>',
    endSymbol = '</span>',
  }) {
    assert(startSymbol != endSymbol);

    final List<TextSpan> textSpans = _stringToTextWidget(
      string: this,
      styles: styles,
      startSymbol: startSymbol,
      endSymbol: endSymbol,
    );
    return Text.rich(TextSpan(children: textSpans));
  }
}

List<TextSpan> _stringToTextWidget({
  required String string,
  required List<TextStyle> styles,
  required String startSymbol,
  required String endSymbol,
}) {
  if (!string.contains(startSymbol) || !string.contains(endSymbol)) {
    return [TextSpan(text: string)];
  }

  if (styles.isEmpty) {
    return [
      TextSpan(
        text: string.replaceAll(startSymbol, '').replaceAll(endSymbol, ''),
      ),
    ];
  }

  final int startSymbolIndex = string.indexOf(startSymbol);

  assert(startSymbolIndex > -1);

  if (!string.startsWith(startSymbol)) {
    return [
      TextSpan(text: string.substring(0, startSymbolIndex)),
      ..._stringToTextWidget(
        string: string.substring(startSymbolIndex),
        styles: styles,
        startSymbol: startSymbol,
        endSymbol: endSymbol,
      ),
    ];
  }

  final int endSymbolIndex = string.indexOf(endSymbol);

  assert(startSymbolIndex < endSymbolIndex);

  return [
    TextSpan(
      text: string.substring(
        startSymbolIndex + startSymbol.length,
        endSymbolIndex,
      ),
      style: styles.removeAt(0),
    ),
    ..._stringToTextWidget(
      string: string.substring(endSymbolIndex + endSymbol.length),
      styles: styles,
      startSymbol: startSymbol,
      endSymbol: endSymbol,
    ),
  ];
}

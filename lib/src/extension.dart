import 'package:flutter/material.dart';

extension StringExtension on String {
  Widget stylit({
    TextStyle? style,
    List<TextStyle> customStyles = const [],
    String tag = 'span',
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    TextScaler? textScaler,
    int? maxLines,
    String? semanticsLabel,
    String? semanticsIdentifier,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) {
    final List<TextSpan> textSpans = _stringToTextSpans(
      string: this,
      styles: customStyles,
      tag: tag,
    );

    return Text.rich(
      TextSpan(children: textSpans),
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      semanticsIdentifier: semanticsIdentifier,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}

List<TextSpan> _stringToTextSpans({
  required String string,
  required List<TextStyle> styles,
  required String tag,
}) {
  final String openingTag = '<$tag>';
  final String closingTag = '</$tag>';
  if (!string.contains(openingTag) || !string.contains(closingTag)) {
    return [TextSpan(text: string)];
  }

  if (styles.isEmpty) {
    return [
      TextSpan(
        text: string.replaceAll(openingTag, '').replaceAll(closingTag, ''),
      ),
    ];
  }

  final int openingTagIndex = string.indexOf(openingTag);

  assert(openingTagIndex > -1);

  if (!string.startsWith(openingTag)) {
    return [
      TextSpan(text: string.substring(0, openingTagIndex)),
      ..._stringToTextSpans(
        string: string.substring(openingTagIndex),
        styles: styles,
        tag: tag,
      ),
    ];
  }

  final int endSymbolIndex = string.indexOf(closingTag);

  assert(openingTagIndex < endSymbolIndex);

  final String styledString = string.substring(
    openingTagIndex + openingTag.length,
    endSymbolIndex,
  );

  return [
    TextSpan(text: styledString, style: styles.removeAt(0)),
    ..._stringToTextSpans(
      string: string.substring(endSymbolIndex + closingTag.length),
      styles: styles,
      tag: tag,
    ),
  ];
}

# stylit

A Flutter package that allows you to effortlessly turn a plain string into a beautifully styled Text widget.

Example:

```dart
const String text = '<span>Flutter</span> <span>everything</span> is a <span>Widget</span>';
final Widget textWidget = text.stylit(
  styles: [
    TextStyle(
      color: Colors.blue,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    TextStyle(
      color: Colors.pinkAccent,
      fontSize: 16,
      decoration: TextDecoration.underline,
      decorationColor: Colors.red,
      decorationStyle: TextDecorationStyle.double,
    ),
    TextStyle(
      color: Colors.lightBlueAccent,
      fontSize: 20,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
  ],
);
```

## LICENSE

```legal
MIT License

Copyright (c) 2025 Abdelouahed Medjoudja

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

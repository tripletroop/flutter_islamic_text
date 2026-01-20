# Islamic Text

A Flutter widget to render Islamic phrases with compact ligatures and custom font.  
This package replaces common phrases like "صلى الله عليه وسلم" with symbols such as "ﷺ" and paints them in a dedicated font. It is designed to be **safe, performant, and extensible** for future glyph rendering.


## Features

- Replace Islamic phrases with compact ligatures
- Render ligatures using a custom font
- Support for multi-line text and text styling
- Safe fallback if the font is missing (Web or misconfigured apps)
- Future-ready: can extend to glyph rendering and complex shaping
- Fully reversible text encoding/decoding for serialization or testing


## Preview

| Without IslamicText | With IslamicText |
|-------------------|-----------------|
| ![](assets/images/islamic_text_before.png) | ![](assets/images/islamic_text_after.png) |

---

## Getting Started

### Prerequisites

- Flutter >= 3.7.0
- Dart >= 3.0.0
- Add the custom font as shown above

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  islamic_text: ^1.0.2
```

Then run:

```bash
flutter pub get
```

Add the islamic font loaded to your app entry point

```dart
import 'package:islamic_text/islamic_text.dart';

void main() async {
  ...
  await IslamicTextFontLoader.load();
  runApp(...);
}
```

---

## Usage

### Simple Example

```dart
import 'package:flutter/material.dart';
import 'package:islamic_text/islamic_text.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IslamicText Example')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: IslamicText(
          text: 'محمد صلى الله عليه وسلم',
        ),
      ),
    );
  }
}
```

### Custom Styles

```dart
IslamicText(
  text: 'محمد صلى الله عليه وسلم',
  normalTextStyle: TextStyle(fontSize: 18, color: Colors.black87),
  islamicTextStyle: TextStyle(fontSize: 20, color: Colors.green),
  textAlign: TextAlign.center,
)
```

---

## Additional Information

- **GitHub:** [https://github.com/tripletroop/flutter_islamic_text](https://github.com/tripletroop/flutter_islamic_text)  
- **Pub.dev:** [https://pub.dev/packages/islamic_text](https://pub.dev/packages/islamic_text)

### Contributing

1. Fork the repository
2. Create a feature branch
3. Submit a pull request
4. Include tests for new features

### Issues

- File issues on GitHub  
- Include Flutter/Dart version and error details  
- Expect response within 1–3 business days

---

## License

MIT License. See [LICENSE](LICENSE) file.
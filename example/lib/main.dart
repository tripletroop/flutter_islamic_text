import 'package:flutter/material.dart';
import 'package:islamic_text/islamic_text.dart';

void main() {
  runApp(const IslamicTextExampleApp());
}

class IslamicTextExampleApp extends StatelessWidget {
  const IslamicTextExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islamic Text Example',
      theme: ThemeData.light(),
      home: const IslamicTextDemoPage(),
    );
  }
}

class IslamicTextDemoPage extends StatelessWidget {
  const IslamicTextDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Islamic Text Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: IslamicText(
                text:
                    'إن الله جل جلاله هو الخالق العظيم الذي أوجد هذا الكون بنظام محكم ودقة متناهية.\nوقد دعا الإنسان إلى التفكر في آياته في الأرض والسماء. والكون كله يشهد بعظمته سبحانه وتعالى من خلال ما فيه من تنوع وإبداع.\nوقد بعث الله الأنبياء لهداية البشر، فكان من بينهم موسى عليه السلام الذي دعا قومه إلى التوحيد، ثم جاء من بعدهم نبينا محمد صلى الله عليه وسلم ليتمم رسالة السماء.\nوقد حمل الصحابة هذا الدين بأمانة، فكان فيهم من نترضّى عنه بقولنا رضي الله عنه، ومنهم من نقول في حقها رضي الله عنها، كما كان منهم من عُرف بصحبته مع غيره فنقول رضي الله عنهما، ونجمعهم جميعًا في دعائنا بقولنا رضي الله عنهم، سائلين الله عز وجل أن يجزيهم خير الجزاء.',
                normalTextStyle: const TextStyle(fontSize: 30),
                islamicTextStyle: const TextStyle(),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

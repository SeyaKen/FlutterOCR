import 'package:englishscanner/providers/text_provider.dart';
import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final TextViewModel? textProvider;
  const DisplayText(this.textProvider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '単語を書き起こしました。',
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Expanded(
            child: ListView.builder(
          // text_provider.dartのTextViewModelの
          // _processedTexts（解析済みの文字）
          itemCount: textProvider!.processedTexts!.length,
          padding: const EdgeInsets.all(12.0),
          itemBuilder: (_, index) {
            print(index);
            return Center(
                child: Center(
                    child: ListTile(
                        title: Center(
                            child: SelectableText(
                                '${index + 1}: ${textProvider!.processedTexts![index].block}')))));
          },
        ))
      ],
    );
  }
}

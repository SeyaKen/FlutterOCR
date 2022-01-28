import 'package:englishscanner/model/text_model.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class MlService {
  Future<List<RecognizedText>> getText(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    final textDetector = GoogleMlKit.vision.textDetector();

    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

    // RecoginizedTextの中身は
    //「String? block」と「List<TextLine>? lines」
    List<RecognizedText> recognizedList = [];
    int i = 0;
    for (TextBlock block in recognisedText.blocks) {
      int hajimari = 0;
      // for(block.text.length) {

      // }
      i++;
      for (var i = 0; i < block.text.length; i++) {
        // 引数の名前を指定して、設定
        // block.textに単語（何個も）が入っている。
        // 正規表現を使ってここで単語ごとに分割する必要がある。

        if (block.text[i] == "\"" ||
            block.text[i] == " " ||
            block.text[i] == "," ||
            block.text[i] == "?" ||
            block.text[i] == "." ||
            block.text[i] == "'" ||
            block.text[i] == "\n" ||
            block.text[i] == "!") {
              
            recognizedList.add(
              // 引数の名前を指定して、設定
              // block.textに単語（何個も）が入っている。
              // 正規表現を使ってここで単語ごとに分割する必要がある。
              
              RecognizedText(block: block.text.substring(hajimari, i)));
          
          
          hajimari = i + 1;
        }
      }
    }

    return recognizedList;
  }
}

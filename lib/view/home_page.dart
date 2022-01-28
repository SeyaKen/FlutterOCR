import 'package:englishscanner/providers/base_model.dart';
import 'package:englishscanner/providers/image_provider.dart';
import 'package:englishscanner/providers/text_provider.dart';
import 'package:englishscanner/view/custom_widgets.dart/display_image.dart';
import 'package:englishscanner/view/custom_widgets.dart/upload_image_button.dart';
import 'package:englishscanner/view/result_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Image recognition'),
            centerTitle: true,
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                // Consumerで囲まれた部分だけ再ビルドされる
                // image_proverがらimportしたやつ
                // <>野中に設定したImageViewModelに変更があるたびに
                // 発火する
                Consumer<ImageViewModel>(
                    // image_prover.dartからimportした
                    // imageProviderはImageViewModelなのかな?
                    builder: (_, imageProvider, __) =>
                        // setStateで状態管理していたのをここで利用する
                        imageProvider.state == CurrentState.loading
                            ? const Center(child: CircularProgressIndicator())
                            : imageProvider.state == CurrentState.loaded
                                ? Flexible(
                                  child: Column(children: [
                                      // display_image.dartからimportしたやつ
                                      // ここで画像を表示
                                      Flexible(child: DisplayImage(imageProvider.image.imagePath)),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomButton(
                                        text: '他の画像を使う',
                                        // ここでimage_provider.dartのimageに
                                        // 値を代入している
                                        onTap: imageProvider.getImage,
                                      )
                                    ]),
                                )
                                : CustomButton(
                                    text: 'Upload image',
                                    onTap: imageProvider.getImage,
                                  )),
                const SizedBox(
                  height: 15,
                ),
                Consumer2<TextViewModel, ImageViewModel>(
                    builder: (_, textProvider, imageProvider, __) =>
                        ElevatedButton(
                            onPressed: imageProvider.image == null
                                ? null
                                : () {
                                    // 
                                    textProvider.getText();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const ResultPage()));
                                  },
                            child: const Text('Get text!')))
              ])),
    );
  }
}

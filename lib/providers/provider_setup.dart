import 'package:englishscanner/providers/image_provider.dart';
import 'package:englishscanner/providers/text_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  // ProviderやChageNotifierProviderとかについては
  // https://qiita.com/kazutxt/items/e6e84957f92aafc472b4
  // サイトがわかりやすい。
  // 
  ChangeNotifierProvider<ImageViewModel>(
    create: (context) => ImageViewModel(),
  ),
  
  ChangeNotifierProxyProvider<ImageViewModel, TextViewModel>(
    create: (_) => TextViewModel(),
    update: (BuildContext context, ImageViewModel? imageProvider,
        TextViewModel? textprovider) {
      textprovider!.imageProvider = imageProvider!;
      return textprovider;
    },
    lazy: true,
  ),
];
import 'package:englishscanner/providers/base_model.dart';
import 'package:englishscanner/providers/text_provider.dart';
import 'package:englishscanner/view/custom_widgets.dart/display_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: Consumer<TextViewModel>(
        builder: (_, textProvider, __) => 
          textProvider.state == CurrentState.idle
          ? const Center(
            child: Text('Nothing here'),
          ) 
          : textProvider.state == CurrentState.error
          ? const Center(
            child: Text('No Image To Analyze'),
          )
          : textProvider.state == CurrentState.loading
          ? const Center(child: CircularProgressIndicator())
          : Center(child: DisplayText(textProvider))
      )
    );
  }
}
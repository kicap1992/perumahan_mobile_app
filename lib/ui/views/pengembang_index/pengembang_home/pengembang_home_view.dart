import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import './pengembang_home_view_model.dart';

class PengembangHomeView extends StatelessWidget {
  const PengembangHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PengembangHomeViewModel>.reactive(
      viewModelBuilder: () => PengembangHomeViewModel(),
      onModelReady: (PengembangHomeViewModel model) async {
        await model.init();
      },
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
      builder: (
        BuildContext context,
        PengembangHomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: WebView(
            // initialUrl: 'http://192.168.43.125/rekam-medis',
            initialUrl: model.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              // _controller.complete(webViewController);
              model.webViewControllerCompleter.future
                  .then((value) => model.webVIewcontroller = value);
              model.webViewControllerCompleter.complete(webViewController);
            },
            onProgress: (int progress) {
              double progressDouble = progress / 100;
              model.myEasyLoading.showProgress(progressDouble, "Loading Denah");
            },
            // javascriptChannels: <JavascriptChannel>{
            //   _toasterJavascriptChannel(context),
            // },
            javascriptChannels: <JavascriptChannel>{
              JavascriptChannel(
                name: 'messageHandler',
                onMessageReceived: (JavascriptMessage message) {
                  model.log.d(message.message);
                  model.goToDetail(message.message);

                  // dev.i("message from the web view=\"${message.message}\"");
                  // if (message.message == "coba") {
                  //   dev.i("sini untuk coba");
                  //   controller.runJavascript("coba22('heheheh')");
                  // }
                },
              ),
            },
            // navigationDelegate: (NavigationRequest request) async {},
            onPageStarted: (String url) {},
            onPageFinished: (String url) {
              // dev.i('Page finished loading: $url');
              model.myEasyLoading.dismissLoading();
            },

            gestureNavigationEnabled: true,
            backgroundColor: const Color(0x00000000),
          ),
        );
      },
    );
  }
}

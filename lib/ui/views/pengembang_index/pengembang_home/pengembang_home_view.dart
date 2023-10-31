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
      onViewModelReady: (PengembangHomeViewModel model) async {
        await model.init();
      },
      disposeViewModel: false,
      fireOnViewModelReadyOnce: true,
      builder: (
        BuildContext context,
        PengembangHomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              // model.log.i('backPressed: ${model.globalVar.backPressed}');
              if (model.globalVar.backPressed == 'exitApp') {
                // model.back();
                model.quitApp(context);
              }
              return false;
            },
            child: WebView(
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
                LinearProgressIndicator(
                  value: progressDouble,
                );
                // model.myEasyLoading.showProgress(progressDouble, "Loading Denah");
              },
              // javascriptChannels: <JavascriptChannel>{
              //   _toasterJavascriptChannel(context),
              // },
              javascriptChannels: <JavascriptChannel>{
                JavascriptChannel(
                  name: 'messageHandler',
                  onMessageReceived: (JavascriptMessage message) {
                    model.log.d(message.message);
                    // var data = JsonDecoder().convert(message.message);
                    // model.log.d(data['status']);
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
                model.easyLoading.dismiss();
              },

              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
            ),
          ),
        );
      },
    );
  }
}

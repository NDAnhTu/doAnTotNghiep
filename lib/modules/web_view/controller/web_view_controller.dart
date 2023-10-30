import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:petcare/theme/colors.dart';
import '../../_auth/authen_service.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewController extends GetxController {
  dynamic argumentData = Get.arguments;
  final auth = Get.find<AuthenService>();

  final _isLoading = false.obs;
  final _url = ''.obs;

  bool get isLoading => _isLoading.value;
  String get url => _url.value;

  set isLoading(value) => _isLoading.value = value;
  set url(value) => _url.value = value;

  InAppWebViewController? webViewController;
  PullToRefreshController? pullToRefreshController;

  InAppWebViewSettings settings = InAppWebViewSettings(
    supportZoom: false,
    isInspectable: true,
    javaScriptEnabled: true,
    useHybridComposition: true,
    transparentBackground: true,
    disableHorizontalScroll: true,
    allowsInlineMediaPlayback: true,
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    preferredContentMode: UserPreferredContentMode.MOBILE,
  );

  @override
  void onInit() {
    super.onInit();
    _url.value = argumentData[0]['url'];
    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(
          color: AppColors.newsColor,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void onReady() {
    _isLoading.value = true;
    super.onReady();
  }

  Future<void> removeHeaderBar(wController) async {
    // wController.evaluateJavascript(source:"document.getElementsByClassName('contents_wrap')[0].style.margin='unset'");
    wController.evaluateJavascript(source:"document.querySelectorAll('.adsbygoogle').forEach(el => el.remove())");
    wController.evaluateJavascript(source:"document.getElementsByClassName('position-relative container')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('d-block mb-5')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('mt-5')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('btn btn-sm bg-light transition-3d-hover border rounded-circle p-2 btn-light shadow-sm')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('pt-6 font-weight-medium')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('container space-2')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('border-top border-bottom py-2 mb-5')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('w-lg-75 border-top space-2 mx-lg-auto')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('row justify-content-sm-between align-items-sm-center mt-5')[0].remove();");
    wController.evaluateJavascript(source:"document.getElementsByClassName('media align-items-center border-top py-5 my-8')[0].remove();");
    wController.evaluateJavascript(source:"document.getElementsByClassName('breadcrumb font-weight-normal mt-n3 mt-md-0 pt-0 px-0')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('card rounded-0 p-3 border-right-0 border-bottom-0 mt-6 mb-6 relate-inserted')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('card rounded-0 p-3 border-right-0 border-bottom-0 mt-6 mb-6 relate-inserted')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('card rounded-0 p-3 border-right-0 border-bottom-0 mt-6 mb-6 relate-inserted')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('card rounded-0 p-3 border-right-0 border-bottom-0 mt-6 mb-6 relate-inserted')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementsByClassName('card rounded-0 p-3 border-right-0 border-bottom-0 mt-6 mb-6 relate-inserted')[0].remove()");
    wController.evaluateJavascript(source:"document.getElementById('navbar-landing').remove()");
  }

}



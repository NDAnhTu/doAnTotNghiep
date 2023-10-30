import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/theme/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controller/web_view_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends GetView<WebViewController> {
  WebView({Key? key}) : super(key: key);
  final GlobalKey webViewKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[30],
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Thông tin chung', style: TextStyle(color: AppColors.newsColor, fontWeight: FontWeight.w700)),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.chevron_left_outlined, color: AppColors.newsColor, size: 30),
        ),
      ),
      body: Obx(() => Stack(
        children: [
          InAppWebView(
            key: webViewKey,
            initialSettings: controller.settings,
            initialUrlRequest: URLRequest(url: WebUri(controller.url)),
            pullToRefreshController: controller.pullToRefreshController,
            onWebViewCreated: (ctrl) {
              controller.webViewController = ctrl;
            },
            onLoadStart: (ctrl, url) async {
              controller.isLoading = true;
              controller.url = url.toString();
            },
            onPermissionRequest: (controller, request) async {
              return PermissionResponse(
                  resources: request.resources,
                  action: PermissionResponseAction.GRANT);
            },
            shouldOverrideUrlLoading: (ctrl, navigationAction) async {
              var    uri     = navigationAction.request.url!;
              print(uri);
              return NavigationActionPolicy.ALLOW;
            },
            onLoadStop: (ctrl, url) async {
              controller.pullToRefreshController?.endRefreshing();
              controller.url = url.toString();
              await Future.delayed(const Duration(milliseconds: 50)).then((value) {
                controller.isLoading = false;
              });
            },
            onReceivedError: (ctrl, request, error) {
              controller.pullToRefreshController?.endRefreshing();
            },
            onProgressChanged: (ctrl, progress) async {
              if (progress == 100) {
                controller.removeHeaderBar(ctrl);
                controller.pullToRefreshController?.endRefreshing();
              }
            },
            onUpdateVisitedHistory: (controller, url, androidIsReload) {
            },
            onConsoleMessage: (controller, consoleMessage) {
              print(consoleMessage);
            },
          ),
          controller.isLoading
              ? Container(
                  color: Colors.white,
                  child: Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                          color: AppColors.newsColor, size: 45)),
                )
              : const SizedBox(),
        ],
      )),
    );
  }
}

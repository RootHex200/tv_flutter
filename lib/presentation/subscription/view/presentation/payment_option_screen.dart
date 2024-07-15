


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/presentation/subscription/view/presentation/cancel_payment_screen.dart';
import 'package:live_tv/presentation/subscription/view/presentation/success_payment_screen.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String link;
  const PaymentScreen({super.key,required this.link});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late WebViewController controller;
  bool _isLoading = true; // Track loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          title: const Text(
            "Payment",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryWhiteColor),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryAppBlacColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: AppColors.primaryWhiteColor,
              ),
            ),
          ),
        ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.link,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewcontroller) {
              controller = webviewcontroller;
            },
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) {
              if(url.contains("/api/paypal/return")){
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const SuccessScreen()), (route) => false);
                return;
              }
              if(url.contains("/api/paypal/cancel")){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const CancelScreen()), (route) => false);
                return;
              }
              Get.deleteAll();
              setState(() {
                _isLoading = false;
              });
            },
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(), // Show loading indicator when loading
        ],
      ),
    );
  }
}
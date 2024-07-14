


import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Removes back button
        elevation: 20,
        title: const Text(
          'Payment',
          style: TextStyle(color: AppColors.primaryWhiteColor),
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
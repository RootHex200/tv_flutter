

import 'package:flutter/material.dart';
import 'package:live_tv/utils/value/colors/colors.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Privay & Policy",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryAppRedColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Text(
            '''
BioscopeBox Mobile App - Privacy Policy
Last Updated: July 11, 2024
At BioscopeBox, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our mobile application (the "App"). By using the App, you agree to the collection and use of information in accordance with this policy.
1. Information We Collect
Personal Information: We may collect personal information that you provide to us when you register for an account, subscribe to a premium plan, or contact our support team. This information may include your name, email address, payment information, and any other information you choose to provide.
Usage Data: We automatically collect information about how you access and use the App. This may include your IP address, device type, operating system, browser type, usage times, and pages viewed. This data helps us understand how the App is used and improve our services.
Cookies and Tracking Technologies: We use cookies and similar tracking technologies to track the activity on our App and store certain information. Cookies are files with small amounts of data that are sent to your browser from a website and stored on your device. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some parts of our App.
2. How We Use Your Information
We use the information we collect for various purposes, including:
•	Providing and maintaining the App.
•	Processing your transactions and managing your subscriptions.
•	Improving, personalising, and expanding our App.
•	Understanding and analysing how you use our App.
•	Communicating with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the App, and for marketing and promotional purposes.
•	Detecting, preventing, and addressing technical issues.
3. Disclosure of Your Information
We may share your information in the following circumstances:
•	With Service Providers: We may share your information with third-party service providers who perform services on our behalf, such as payment processing, data analysis, email delivery, hosting services, customer service, and marketing assistance.
•	For Legal Reasons: We may disclose your information if required to do so by law or in response to valid requests by public authorities (e.g., a court or government agency).
•	Business Transfers: If we are involved in a merger, acquisition, or asset sale, your information may be transferred as part of that transaction. We will notify you of any change in ownership or use of your personal information.
•	With Your Consent: We may disclose your information for any other purpose with your consent.
4. Security of Your Information
We take the security of your information seriously and use reasonable administrative, technical, and physical safeguards to protect it from unauthorised access, use, alteration, and destruction. However, no method of transmission over the Internet or method of electronic storage is 100% secure. Therefore, while we strive to use commercially acceptable means to protect your information, we cannot guarantee its absolute security.
5. Your Data Protection Rights
Depending on your location, you may have the following data protection rights:
•	Access: You can request access to the personal information we hold about you.
•	Correction: You can request that we correct or update any inaccurate or incomplete information.
•	Deletion: You can request that we delete your personal information, subject to certain exceptions.
•	Restriction: You can request that we restrict the processing of your personal information.
•	Objection: You can object to the processing of your personal information.
•	Data Portability: You can request a copy of your personal information in a structured, commonly used, and machine-readable format.
To exercise these rights, please contact us at hasan.iliev94@gmail.com. We will respond to your request within a reasonable timeframe.
6. Children's Privacy
The App is not intended for use by children under the age of 13. We do not knowingly collect personally identifiable information from children under 13. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us. If we become aware that we have collected personal information from children without verification of parental consent, we take steps to remove that information from our servers.
7. Changes to This Privacy Policy
We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date at the top. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.
8. Contact Us
If you have any questions about this Privacy Policy, please contact us at:
•	Email: hasan.iliev94@gmail.com
Thank you for using BioscopeBox. We are committed to protecting your privacy and ensuring a secure and reliable browsing experience.
            '''
            ,style: TextStyle(
                fontSize: 16
            ),),
          )
        ],
      ),
    );
  }
}
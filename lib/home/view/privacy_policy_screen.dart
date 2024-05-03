import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

import '../../authentication/components/buttons/regular/custom_botton.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(50),
                    getText(
                      context: context,
                      title: 'PRIVACY POLICY STATEMENT',
                      color: AppColours.black,
                      fontSize: 12,
                      weight: FontWeight.w700,
                    ),
                    addVerticalSpace(20),
                    getText(
                        wordSpacing: 3,
                        textHeight: 20,
                        color: AppColours.black,
                        fontSize: 12,
                        context: context,
                        title:
                            'Sharing your personal information on DayTrit is based on trust.\nAnd we respect your privacy when you use our services.\nPlease review this privacy policy statement (“Statement”)\ncarefully to learn about our privacy practices.\n'
                            'DayTrit operate a service that enables users (“you”, “your”) to\nexplore, research, find, and book travel experiences\nworldwide. Users gets to benefit from our free special treats\nsuch as; Cakes, Chicken box, Gift Food Tray, Mobile Data,\nPizza’s, Shopping Voucher Etc, to enjoy special moments.\n'
                            'Users also gets to enjoy fantastic tourist destinations by\ntraveling now and pay later. In this Statement, these are\ncollectively referred to as our Services.\n'
                            'Our Services are owned and operated by DayTrit Projects\nLimited. By using our Services and visiting our websites and\nrelated applications, whether on a computer, phone, tablet or\nsimilar device (these are all referred to as a “Device”), you are\naccepting the practices described below.\n'
                            'As a global company, DayTrit operate where the laws and\ncustoms permits. This Statement provides a general overview\nof our privacy policy practices. The following data are what we\nrequire; Information Collected, Information Uses, Information\nSharing, Information Choice, Information Transfers,\nInformation Security, Information Retention, Do Not Track\nSignals, Cookies, Cookie Consent Tool, Statement Changes\nand Notification, and Contacts.\n'
                            'When you access or use our Services, we collect information\nfrom and about you to provide a more personalized and\nrelevant experience. Some information we collect\nautomatically. Other information we collect from different\nsources, including affiliated entities, business partners, and\nother independent third-party sources. When you use our\nServices by “clicking-through” from a third-party site or when\nyou visit third-party sites via our Services, those third-party\nsites may share information with us about your use of their\nservice. Information collected may include the following:\n'
                            'Contact information, including name, phone number and\npostal and email addresses\n'
                            'Billing or payment information (such as your credit card\nnumber, cardholder name, expiration date, authentication\ncode and billing address)\n'
                            'User name, Photos, reviews and social posts and videos you\nmay have provided to us\nGeolocation information\n'
                            'Device information, such as when you accessed our Services\nand information about the Device used (for example, IP\naddress, software or internet browser used, preferred\nlanguages, unique Device identifiers and advertising\nidentifiers)\n'
                            'Online activity, including pages you have visited, content\nreviewed and apps reviewed\nBooking history\n'
                            'Information about your travel plans and preferences\n'
                            'We may also collect, in instances where you have provided it,\n information about other travellers, including their email\naddress and other travel-related information. If you are\nsharing information with us about other individuals, you must\nobtain their consent.\n'
                            'In addition to the categories noted above, we may also collect\nlocation information if you have instructed your Device to send\nsuch information via the privacy settings on that Device, or, for\nexample, if you have uploaded videos or photos tagged with\nlocation information. We may use your location information\ndirectly and/or share your location with third parties. We\ncollect and share location information in order to provide you\nwith relevant content, to analyze your use of our Services, to\nimprove our Services and to provide contextual advertising or\nrecommendations. For example, we may use your location to\nshow you reviews of hotels, restaurants or attractions near\nyou when you are traveling.\n'
                            'You can change the privacy settings of your Device at any\ntime in order to turn off the functionality that collects and\nshares location information and/or the functionality to tag\nyour photos with location information. However, turning off\nlocation-sharing may affect certain features that we offer. If\nyou have any questions about the privacy settings of your\nDevice, we suggest you contact the manufacturer of your\nDevice or your mobile service provider for help.\n'
                            'Please see the section on Cookies below for more information regarding the use of cookies and other technology described in this section, including regarding your choices relating to such technologies.\nInformation Uses\n'
                            'We are committed to providing you with relevant content on\nour Services and respect the data privacy laws of the different\njurisdictions in which we operate. We use information about\nyou so we can help you enjoy and use our Services, including\nin the following ways:\nRegister and manage your DayTrit account\nFacilitate your bookings\n'
                            'Measure interest in and improve our Services\n'
                            'Notify you about special offers, prize draws, competitions and\nservices available from us, our affiliates, or our partners that\nmay be of interest to you\nCommunicate with you\n'
                            'Enable communication between travelers and operators of\ntravel experiences listed through us\n'
                            'Enable us to publish your reviews, ratings, photos, videos and\nother content\n'
                            'Customize your experience, including customizing the ads\nshown to you on our Services and across the internet\n'
                            'Make inferences about your interests or preferences\n'
                            'Provide you with an optimized experience and to group users\nof our Services based on, for example, usage and\ndemographics\n'
                            'Send you survey or market research invitations\n'
                            'Respond to your questions and comments\n'
                            'Resolve disputes or troubleshoot problems\n'
                            'Prevent potentially prohibited or unlawful activities\n'
                            'Enforce our terms of use and notices; and as otherwise\ndescribed to you at the point of collection\n'
                            'Please note some information about you is required in order\nfor us to provide you with relevant offerings from us, our\naffiliates and our partners and to enable you to enjoy other\nbenefits of being a Viator user. Please review the “Information\nChoices” section below with respect to your choices related\nto the collection and use of your information.\nInformation Sharing\n'
                            'In order to provide some of our Services, we may need to\nshare information with certain other third parties, including our\ngroup of companies, in the following circumstances:\n'
                            'Our Group of Companies. We share information with\ncompanies in our corporate family so we can provide you with\ninformation about products and services, both travel-related\nand others, which might interest you. These companies and\nwebsites will comply with this Statement and all applicable\nlaws governing the transmission of promotional\ncommunications.\n'
                            'Experience Suppliers. We share your information with\nsuppliers of travel experiences to allow them to fulfil the\nbookings you make through ur Services.'
                            'Service Providers. We share information with certain service providers used to facilitate our Services,including to help with\ntransactions.\n'
                            'Business Partners. We may share information about you, your\nDevices and your use of our Services with our trusted\nbusiness partners. For example, we may share information so\nthat we can provide you with relevant content or in order to\nfacilitate payment for a booking. This sharing is generally pursuant to written agreements which include confidentiality,\nprivacy and security obligations; however, note that we do not\ncontrol the privacy practices of these third-party business\npartners.\n'
                            'Social Media Sites. When you use our Services and elect to\nshare information with third-party social media sites, the\ninformation you share will be governed by the privacy policies\nof those social media sites and the privacy settings you have\nset with those social media websites.\n'
                            'Advertising Networks. We sometimes collect and share\ninformation about your interests with advertising networks.\nSome of these companies are members of the Network\nAdvertising Initiative or the Digital Advertising Alliance, which\noffer a single location to opt-out of ad targeting from member\ncompanies.\n'
                            'Other third parties, such as referring websites.Third parties\nmay also assist us in collecting information by, for example,\noperating features of our website or facilitating the delivery of\nonline advertising tailored to your interests. We may share\naudience segments and other information with third parties\nthat use that information for tailored advertising to you.\n'
                            'Third parties may only collect or access information as\nneeded to perform their permitted functions.\n'
                            'Certain Device operating system versions permit you to opt out of certain types of information sharing, including to certain advertising networks. Please check your Device settings if you want to limit such tracking.\nInformation Choices\n'
                            'You have options with respect to the collection and use of\nyour information.\nYour options:\n'
                            'You can choose not to provide us with certain information,\nalthough it may be needed to take advantage of certain\nfeatures offered on our application.\n'
                            'You can prevent the collection of geolocation information, but\nnote that turning off location sharing may affect certain\nfeatures of our Services.\n'
                            'You also can add or update information and close your\naccount. If you close your account, we will deactivate your\naccount and remove your profile information. We may retain some information associated with your account (including\npast transactions) for internal purposes including backups,\nfraud prevention, dispute resolution, investigations and legal\ncompliance for the period necessary to fulfill the purposes\noutlined in this Statement.\n'
                            'You will be given the opportunity to unsubscribe from promotional messages, including emails with travel-related opportunities, in any such promotional message we send.\n'
                            'Information Transfers\n'
                            'We are a global company and we operate in many different\njurisdictions. If we transfer your information to other countries,\nwe will use and protect that information as described in this\nStatement and in accordance with applicable law.\nInformation Security\n'
                            'We have implemented appropriate administrative, technical,\nand physical security procedures to help protect your\ninformation. We only authorize specific employees to access\npersonal information and they may do so only for permitted\nbusiness functions. We use encryption when transmitting your\ninformation between your system and ours, and between our\nsystem and those of the parties with whom we share\ninformation. We also employ firewalls and intrusion detection\nsystems to help prevent unauthorized access to your\ninformation. However, we cannot guarantee the security of\ninformation from unauthorized entry or use, hardware or\nsoftware failure, or other circumstances outside of our control.\n'
                            'Information Retention\n'
                            'We will retain copies of your information for as long as you\nmaintain your account or as necessary in connection with the\npurposes set out in this Statement, unless applicable law\nrequires a longer retention period. In addition, we may retain\nyour information for the duration of any period necessary to\nestablish, exercise or defend any legal rights.\n'
                            'Do Not Track Signals\n'
                            'Our website is not designed to currently respond to “Do Not\nTrack” (“DNT”) signal requests from browsers. This is due to\nthe lack of global standardized interpretation that defines “Do\nNot Track” signals. Once the industry has settled on standards\nrelated to this issue, we may re-evaluate this approach.\n'
                            'Cookies\n'
                            'We want your access to our Services to be as easy, efficient\nand useful as possible. To help us do this, we use cookies and similar technologies to improve your experience, to enhance site security and to show you relevant advertising.\n'
                            'What are cookies?\n'
                            'Cookies are small text files that are automatically placed on\nyour Device when you visit almost any website. They are\nstored by your internet browser and contain basic information\nabout your internet use. Your browser sends these cookies\nback to a website every time you revisit it, so it can recognize\nyour Device and improve your experience by, among other\nthings, providing you with personalized content. We also use\ncookies to remember your login details, so you don’t have to\nre-enter them repeatedly when you use our Services. Other\ncookies help us understand your preferences. The cookies we\nuse fall into three categories.\n'
                            'Essential - These cookies are necessary to help you access\nand move around the app and use all its features. Without\nthese cookies, the app would not work properly and you would not be able to use certain important features. For\nexample, we use a cookie to keep you logged in during your\nvisit, so the site does not require you to log in repeatedly to\naccess different pages. We may also use essential cookies for\nfraud detection and prevention purposes. You cannot turn off\nessential cookies through the Cookie Consent Tool, as such\ncookies are necessary for you to access and use the features\nof the app\n'
                            'Analytics and customization - We use these cookies to help us understand how the app is being used and how we can\nimprove your experience of it. These cookies can provide us\nwith information to help us understand which parts of the\nwebsite interest our visitors and if they experience any errors.\nWe use these cookies to test different designs and features\nfor our sites and we also use them to help us monitor how\nvisitors reach the website. We also use cookies to save your\nsettings and preferences on the website, such as language\npreference and information you\'ve previously entered when\nsearching for travel experiences. Some customization cookies\nare essential if you want to use certain features of the app.\n'
                            'Advertising - Advertising cookies help ensure that the\nadvertisements you see are as relevant to you as possible. For\nexample, some advertising cookies help select ads that are\nbased on your interests. Others help prevent the same ad\nfrom continuously reappearing for you. We also use cookies to\nmake it easy to share content from the website with your\nfriends through your favorite social networks. Social media\nsites, may set cookies that recognize you when you view\ncontent on the website and allow you to share content across\nboth the website and the social media site via the use of\nsharing settings. For further details, please check your social\nmedia site’s terms of use and privacy policy. We also work\nwith third-party advertisers to give you access to travel\ncontent that might be of interest, and may set cookies on our\nServices to provide you with advertising that matches your\ninterests and preferences. These "third-party cookies" collect\ninformation about your browsing behaviour and interaction\nwith ads or the Services more generally. This information also helps us limit the number of times you may see the same ads and improve your online experience.\n'
                            'Cookie Consent Tool\n'
                            'To give you control, we provide you with a Cookie Consent\nTool, which allows you to review first and third party cookies\nplaced through our app and adjust your cookie settings,\nincluding whether or not to accept or decline such cookies.\n'
                            'You can access this Cookie Consent Tool at any time by\nclicking the “Cookie Consent” link at the bottom of every page\nor by modifying your preferences in our cookie banner. In\naddition, you can manage cookies through the settings of your\ninternet browser. You can have the browser notify you when\nyou receive a new cookie, delete individual cookies or delete\nall cookies.\n'
                            'Most advertising networks offer you a way to opt out of\nadvertising cookies. See www.aboutads.info/choices and\nwww.youronlinechoices.com for useful information on how to\ndo this.\n'
                            'If you delete your cookies, your access to some functionality\nand areas of our Services might be degraded or restricted.\n'
                            'Our use of any information we collect through cookies is\nsubject to this Statement, which is linked on our app.\nStatement Changes and Notification\n'
                            'We may update this Statement in the future. If we believe any\nchanges are material, we will let you know by doing one or\nmore of the following: sending you a communication about the\nchanges, placing a notice on the website and/or posting an\nupdated Statement on the app. We will note at the top of this Statement when it was most recently updated. We encourage you to check back from time to time to review the most current version and to periodically review this Statement for the latest information on our privacy practices.\nContact\n'
                            'If you have a data privacy request, such as a request to delete or access your data, please visit our dedicated privacy portal. For general data privacy inquiries or questions concerning our Privacy and Cookies Statement, please contact our privacy team on contact@daytrit.com.\nController of Personal Information\n'
                            'DayTrit Projects Limited is the data controller of the personal\ninformation we collect, however, in accordance with\napplicable data privacy law, we have appointed a\nrepresentative within the United Kingdom.\n'
                            'DayTrit Projects Limited role in this respect is limited solely to\nbeing a contact point for questions on data protection for\ninternational users and data protection supervisory\nauthorities. For the avoidance of doubt, DayTrit Projects\nLimited cannot field other communications or legal process on\nbehalf of DayTrit.\n'
                            'The right to restrict the processing of personal data, if: '
                            'the accuracy of your personal data is contested by you, for the\nperiod in which we have to verify the accuracy of the personal data; or\n'
                            'the processing is unlawful and you oppose the deletion of your personal data and request restriction; or\n'
                            'we no longer need your personal data for the purposes of\nprocessing, but your personal data is required by you for legal\nclaims; or\n'
                            'you have objected to the processing, for the period in which\nwe have to verify overriding legitimate grounds.\n'
                            'The right to data portability. You may request that we send\nthis personal data to a third-party, where feasible. You only\nhave this right if it relates to personal data you have provided\nto us where the processing is based on consent or necessity\nfor the performance of a contract between you and\nus, and the processing is conducted by automated means.\n'
                            'You also have the right to lodge a complaint before your national data protection authority.\n'
                            'You will not have to pay a fee to access your personal data (or to exercise any of the other rights described in this\nStatement). However, we may charge a reasonable fee if your\nrequest is clearly unfounded, repetitive or excessive. We may\nneed to request specific information from you to help us\nconfirm your identity and ensure your right to access your\npersonal data (or to exercise any of your other rights). This is a security measure to ensure that personal data is not disclosed to any person who has no right to receive it. In an effort to speed up our response, we may also contact you to ask you for further information in relation to your request. You can exercise several of your rights through the personal information section of your account. To exercise your other rights you can file a request.'
                            'Information Uses\n'
                            'We will only use your personal data when the law allows us to,, we will use your personal data in one or more of the following circumstances:\n'
                            'Where we need to perform the contract we are about to enter into or have entered into with you\n'
                            'Where it is necessary for our legitimate interests (or those of a third-party) and your interests and fundamental rights do not override those interests\n'
                            'Where we need to comply with a legal or regulatory obligation\n'
                            'With your consent\n'
                            'International Transfers\n'
                            'Your personal data may be stored or transferred to countries outside the EEA for the purposes described in this Statement. When we store or transfer your personal data outside the EEA, we take the following precautions to ensure that your personal data is properly protected.\n'
                            'Whenever we store or transfer your personal data outside the EEA, we will do so in accordance with applicable law and we will ensure a similar degree of protection is afforded to it by implementing appropriate safeguards. Transfers of personal data are made:\n'
                            'to a country recognized by the European Commission as providing an adequate level of protection; or\n'
                            'to a country which does not offer adequate protection but whose transfer has been governed by the standard contractual clauses of the European Commission or by implementing other appropriate cross-border transfer solutions to provide adequate protection.\n'
                            'By using our services, you understand that your personal data may be transferred to our facilities and those third-parties with whom we share it as described in this Statement.\n'
                            'You may request, up to two times each year, that we disclose to you the categories and specific pieces of personal information that we have collected about you, the categories of sources from which your personal information is collected, the business or commercial purpose for collecting your personal information, the categories of personal information that we have disclosed for a business purpose, any categories of personal information about you that we have sold, the categories of third-parties with whom we have shared your personal information, and the business or commercial purpose for selling your personal information, if applicable.\n'
                            'You may request that we delete any personal information that we have collected from or about you. As described in more detail in our Statement, there are some reasons for which we will not be able to fully address your deletion request, such as if we need to complete a transaction for you, to detect and protect against fraudulent and illegal activity, to exercise our rights, or to comply with a legal obligation.\n'
                            'You may request to opt out of our sale of your personal information to third-parties for their direct marketing purposes. This means that, if you opt out, going forward, we will not share your information with such third-parties to use for their purposes unless you later direct us to do so. To effect the opt out, please submit a request in writing to contact@daytrit.com\n'
                            'To take advantage of any of these rights, please contact us at info@daytrit.com. We may need to verify your identity to enable us to process your request. We value your privacy and will not discriminate in response to your exercise of privacy rights. We will respond to your request within 45 days of receipt of your request, after proper verification, unless we need additional time, in which case we will let you know.\n'),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

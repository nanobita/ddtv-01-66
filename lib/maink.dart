import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ddtvthairadio/main.dart';
import 'package:ddtvthairadio/mainhg.dart';
import 'package:ddtvthairadio/mainooo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:new_version_plus/new_version_plus.dart';
// import 'package:new_version/new_version.dart';

import 'contact.dart';
import 'news.dart';

// import 'mainีย.dart';
// import 'update.dart';

void main() {
  runApp(MyApph());
}

class MyApph extends StatelessWidget {
  MyApph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 1;
  @override
  void initState() {
    super.initState();

    // Instantiate NewVersion manager object (Using GCP Console app as example)
    // final newVersion = NewVersionPlus(
    //   // iOSId: 'com.google.Vespa',
    //   androidId: 'com.ddtvthai.ddtv',
    // );

    // const simpleBehavior = true;

    // if (simpleBehavior) {
    //   basicStatusCheck(newVersion);
    // }
  }

  // basicStatusCheck(NewVersionPlus newVersion) {
  //   newVersion.showAlertIfNecessary(
  //     context: context,
  //     // launchModeVersion: LaunchModeVersion.external,
  //   );
  // }

  // advancedStatusCheck(NewVersionPlus newVersion) async {
  //   final status = await newVersion.getVersionStatus();
  //   if (status != null) {
  //     debugPrint(status.releaseNotes);
  //     debugPrint(status.appStoreLink);
  //     debugPrint(status.localVersion);
  //     debugPrint(status.storeVersion);
  //     debugPrint(status.canUpdate.toString());
  //     newVersion.showUpdateDialog(
  //       context: context,
  //       versionStatus: status,
  //       dialogTitle: 'Custom Title',
  //       dialogText: 'Custom Text',
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //     // title: Text('Convex Botom Var'),
        //     ),
        body: [
          WebViewnews(),
          MyAppbj(),
          MyAppb(),
          // MyAppm(),
        ][selectedPage],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.orange,
          style: TabStyle.react,
          items: [
            TabItem(
              icon: Icons.account_circle,
              title: 'ข่าวสาร',
            ),
            TabItem(
              icon: Icons.web,
              title: 'ติดต่อเรา',
            ),
            TabItem(
              icon: Icons.radio,
              title: 'วิทยุออนไลน์',
            ),

            // TabItem(
            //   icon: Icons.web,
            //   title: 'ข่าว',
            // ),
          ],
          initialActiveIndex: 1,
          onTap: (int i) {
            setState(() {
              selectedPage = i;
            });
          },
        ),
      ),
    );
  }
}

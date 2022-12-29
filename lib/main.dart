/*
 * Copyright (c) 2019-2022 Larry Aasen. All rights reserved.
 */

import 'package:ddtvthairadio/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only call clearSavedSettings() during testing to reset internal values.
  await Upgrader.clearSavedSettings();
  // await Upgrader.clearSavedSettings();
  // await Upgrader.clearSavedSettings();

  runApp(MyApp());
}

class MyAppbj extends StatelessWidget {
  const MyAppbj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://line.me/ti/p/UozuMdjvoT';
    const String toLaunchkk = 'https://www.facebook.com/pra.NaSuriya/';
    return MaterialApp(
      title: 'Upgrader Example',
      home: UpgradeAlert(
          child: Scaffold(
        // appBar: AppBar(title: Text('ยินดีต้อนรับ')),
        body: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(30.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spacer(),
                FutureBuilder(
                  // future: _radioPlayer.getMetadataArtwork(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    Image artwork;
                    if (snapshot.hasData) {
                      artwork = snapshot.data;
                    } else {
                      artwork = Image.asset(
                        'assets/58.png',
                        fit: BoxFit.cover,
                      );
                    }
                    return Container(
                      height: 300,
                      width: 300,
                      child: ClipRRect(
                        child: artwork,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );
                  },
                ),
                // SizedBox(
                //   width: 50,
                // )
              ],
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spacer(),
                Text(
                  'ฟังวิทยุพระพุทธศาสนาทั่วประเทศ\n   \n  --- หน้าถัดไป ---​',
                  textAlign: TextAlign.center,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // SizedBox(
                //   width: 100,
                // )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spacer(),
                Text(
                  'เพิ่มลิงค์วิทยุ \n  โทร.092 456 2592',
                  textAlign: TextAlign.center,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // SizedBox(
                //   width: 100,
                // )
              ],
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     ElevatedButton(
            //       onPressed: () => setState(() {
            //         _launched = _launchInBrowser(toLaunch);
            //       }),
            //       child: const Text('LINE'),
            //     ),
            //     const Padding(padding: EdgeInsets.all(10.0)),
            //     ElevatedButton(
            //       onPressed: () => setState(() {
            //         _launched = _launchInBrowser(toLaunchkk);
            //       }),
            //       child: const Text('Facebook'),
            //     ),
            //     FutureBuilder<void>(future: _launched, builder: _launchStatus),
            //   ],
            // ),
          ],
        ),
      )),
    );
  }
}

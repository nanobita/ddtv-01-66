// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs, deprecated_member_use, unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(contact());
}

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    // ignore: deprecated_member_use
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithDomStorage(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableDomStorage: true,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(
        url,
        forceSafariVC: true,
      );
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    const String toLaunch = 'https://line.me/ti/p/UozuMdjvoT';
    const String toLaunchkk = 'https://www.facebook.com/pra.NaSuriya/';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
                'ติดต่อ\n  พัฒนาแอพพลิเคชั่น \n  Android, ios​',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch);
                }),
                child: const Text('LINE'),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunchkk);
                }),
                child: const Text('Facebook'),
              ),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:audio_session/audio_session.dart';
import 'package:ddtvthairadio/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
// import 'package:com.mahayanradio.btc/common.dart';
import 'package:rxdart/rxdart.dart';
// import 'package:upgrader/upgrader.dart';
import 'common.dart';
import 'custom_dialog_box.dart';
import 'maink.dart';

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
  // await Upgrader.clearSavedSettings();
  // await Upgrader.clearSavedSettings();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Only call clearSavedSettings() during testing to reset internal values.
//   await Upgrader.clearSavedSettings(); // REMOVE this for release builds

//   // On Android, the default behavior will be to use the Google Play Store
//   // version of the app.
//   // On iOS, the default behavior will be to use the App Store version of
//   // the app, so update the Bundle Identifier in example/ios/Runner with a
//   // valid identifier already in the App Store.
//   runApp(MyApp());
// }
// class MyAppo extends StatelessWidget {
//   const MyAppo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'KKKKK',
//       home: UpgradeAlert(
//           child: Scaffold(
//         appBar: AppBar(title: Text('UpgraderhhhBBBB Example')),
//         body: Center(child: Text('Chehhcking...')),
//       )),
//     );
//   }
// }

class MyAppb extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppb> {
  static int _nextMediaId = 0;
  late AudioPlayer _player;
  final _playlist = ConcatenatingAudioSource(children: [
    // ClippingAudioSource(
    //   start: Duration(seconds: 60),
    //   end: Duration(seconds: 90),
    //   child: AudioSource.uri(Uri.parse("http://server4.10gbradio.com:8591")),
    //   tag: MediaItem(
    //     id: '${_nextMediaId++}',
    //     album: "Science Friday",
    //     title: "A Salute To Head-Scratching Science (30 seconds)",
    //     artUri: Uri.parse(
    //         "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
    //   ),
    // ),
    AudioSource.uri(
      Uri.parse("http://radio.hostinglotus.com:6004/"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "คลื่นมหายาน",
        title: "1.วัดธรรมปัญญารามบางม่วง จังหวัดนครปฐม",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://ohmi-design.com:8182"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "คลื่นธรรมะชำระใจ",
        title: "2.วัดถ้ำ​แฝด จังหวัดกาญจนบุรี",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://210.1.60.152:8000/stream/2/"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "3.วัดหนองก๋าย จังหวัดเชียงใหม่",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://server4.10gbradio.com:8591"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "4.วัดศรีอุดมวงศ์ จังหวัดเลย",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://ohmi-design.com:8438"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "5.สาธุเรดิโอ จ.สุพรรณบุรี",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://ktthai-r2.pkt.cc:8898/;stream.mp3"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "6.วัดป่าเอาราวัณ จังหวัดเลย",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://watpa.no-ip.org:8007"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "7.วัดป่าจริยธรรม จังหวัดเลย",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://watpa.no-ip.org:8005"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "8.วัดป่าสะพานสอง จังหวัดตาก",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://103.7.56.219:4106"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "9.วัดนายโรง กรุงเทพมหานคร",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://112.121.151.133:8133/live"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "10.ศูนย์ปฎิบัติธรรมนิมิตรใหม่ กรุงเทพฯ",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://watpa.no-ip.org:8011"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "11.วัดวิหารธรรม จังหวัดอุดรธานี",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("https://cdn-th2.login.in.th/shoutcast/5050"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "12.วัดดอยเทพนิมิต จังหวัดเชียงราย",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://radio1.siamlivehost.com:8001/"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "13.วัดปากบ่อสวนหลวง กรุงเทพฯ",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    // *ตัวใหม่***************************************************************

    AudioSource.uri(
      Uri.parse("http://ohmi-design.com:8122"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "14.คลื่นส่งเสริมพระพุทธศาสนา จังหวัดสุพรรณบุรี",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://ohmi-design.com:8182"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "15.คลื่นวัดธรรมรังสี จังหวัดประจวบคีรีขันธ์",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://ohmi-design.com:9066"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "16.คลื่นวัดพิชโสภาราม จังหวัดอุบลราชธานี",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://radio3.siamlivehost.com:4106"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "17.คลื่นวัดนายโรง กรุงเทพมหานคร",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://radio1.siamlivehost.com:8001"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "18.คลื่นวัดปากบ่อ กรุงเทพมหานคร",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://radio.portradiothai.com:6002"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "19.คลื่นวัดเขาดินหนองแสง จังหวัดจันทบุรี",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("https://radio10.plathong.net/7328/;stream.mp3"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "20.มนต์ธรรมะโดย พระเทพปฏิภาณกวี",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://media.login.in.th:5050"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "21.วัดดอยเทพนิมิต จังหวัดเชียงราย",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://radio.vpsthai.net:8050"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "29.วัดป่าไทรงาม จังหวัดกำแพงเพชร",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://radio.dwebsalehost.com:9082"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "30.วิทยุคลื่นไทธรรม",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://sv1.nakhonradio.com:9169"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "31.วิทยุวัดศรีทวี จังหวัดนครศรีธรรมราช",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://lnwradio.hostsevenplus.com:9508"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "32.สถานีวิทยุรักพระพุทธศาสนาวัดทุ่งผึ้ง จ.น่าน",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://radio2.thzhost.com:4102"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "33.สถานีวิทยุวัดป่าแดงมหาวิหาร จ.เชียงใหม่",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    // *ตัวใหม่ 3 ***************************************************************

    AudioSource.uri(
      Uri.parse("https://radio11.plathong.net/8906/;stream.mp3"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "คลื่นมหายาน",
        title: "34.วัดดอกจานรัตนาราม อ.รัตนบุรี จ.สุรินทร์",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://lnwradio.hostsevenplus.com:9544"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "35.สถานีวิทยุพระพุทธศาสนาวัดท่าสว่าง จ.บุรีรัมย์",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://lnwradio.com:9172"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "36.วัดบึงบวรสถิตย์ จ.ชลบุรี",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://ohmi-design.com:8030"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "37.วัดพระพุทธบาทตากผ้า อ.ป่าซาง จ.ลำพูน",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://radio10.plathong.net:7200"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio|104.50 MHz",
        title: "38.วัดบ้านปลาคูณ อ.โพนทราย จ.ร้อยเอ็ด ",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://radio2.thzhost.com:4144"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio|FM 104.50 MHz",
        title: "39.สถานีวิทยุวัดฝายหิน จ.เชียงใหม่ ",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://ohmi-design.com:9254"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "40.สถานีวิทยุวัดพระบาทอุดม อ.ฝาง จ.เชียงใหม่",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://radio12.plathong.net:7014"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "คลื่นสีขาวเพื่อชาวประชา",
        title: "41.วัดปากทางเจริญ อ.ดอยหล่อ จ.เชียงใหม่",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("http://radio4.thzhost.com:4020"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "42.สถานีวิทยุวัดดอนจั่น เชียงใหม่",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),

    AudioSource.uri(
      Uri.parse("http://media.livestreaming.in.th:8810"),
      tag: MediaItem(
        id: '${_nextMediaId++}',
        album: "Buddhist Radio",
        title: "43.วิทยุพระพุทธศาสนา จ.เชียงราย FM 99.50 MHz",
        artUri: Uri.parse(
            "https://play-lh.googleusercontent.com/-2BlZNU2wsPleN3jZic1kjKFoJMrMW66o1tCt8Oc_Pk2-d5Eg984nALoAsDlYzB2pr8=w5120-h2880-rw"),
      ),
    ),
  ]);

  // *ตัวใหม่***************************************************************

  int _addedCount = 0;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await _player.setAudioSource(_playlist);
    } catch (e, stackTrace) {
      // Catch load errors: 404, invalid url ...
      print("Error loading playlist: $e");
      print(stackTrace);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffffAB00),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: StreamBuilder<SequenceState?>(
                  stream: _player.sequenceStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    if (state?.sequence.isEmpty ?? true) return SizedBox();
                    final metadata = state!.currentSource!.tag as MediaItem;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child:
                                    Image.network(metadata.artUri.toString())),
                          ),
                        ),
                        Text(metadata.album!,
                            style: Theme.of(context).textTheme.headline6),
                        Text(metadata.title),
                      ],
                    );
                  },
                ),
              ),
              ControlButtons(_player),
              SizedBox(height: 8.0),
              Row(
                children: [
                  // StreamBuilder<LoopMode>(
                  //   stream: _player.loopModeStream,
                  //   builder: (context, snapshot) {
                  //     final loopMode = snapshot.data ?? LoopMode.off;
                  //     const icons = [
                  //       Icon(Icons.repeat, color: Colors.grey),
                  //       Icon(Icons.repeat, color: Colors.orange),
                  //       Icon(Icons.repeat_one, color: Colors.orange),
                  //     ];
                  //     const cycleModes = [
                  //       LoopMode.off,
                  //       LoopMode.all,
                  //       LoopMode.one,
                  //     ];
                  //     final index = cycleModes.indexOf(loopMode);
                  //     return IconButton(
                  //       icon: icons[index],
                  //       onPressed: () {
                  //         _player.setLoopMode(cycleModes[
                  //             (cycleModes.indexOf(loopMode) + 1) %
                  //                 cycleModes.length]);
                  //       },
                  //     );
                  //   },
                  // ),
                  // Expanded(
                  //   child: Text(
                  //     "วิทยุพระพุทธศาสนา",
                  //     style: Theme.of(context).textTheme.headline6,
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  // StreamBuilder<bool>(
                  //   stream: _player.shuffleModeEnabledStream,
                  //   builder: (context, snapshot) {
                  //     final shuffleModeEnabled = snapshot.data ?? false;
                  //     return IconButton(
                  //       icon: shuffleModeEnabled
                  //           ? Icon(Icons.shuffle, color: Colors.orange)
                  //           : Icon(Icons.shuffle, color: Colors.grey),
                  //       onPressed: () async {
                  //         final enable = !shuffleModeEnabled;
                  //         if (enable) {
                  //           await _player.shuffle();
                  //         }
                  //         await _player.setShuffleModeEnabled(enable);
                  //       },
                  //     );
                  //   },
                  // ),
                ],
              ),
              Container(
                height: 450.0,
                child: StreamBuilder<SequenceState?>(
                  stream: _player.sequenceStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    final sequence = state?.sequence ?? [];
                    return ReorderableListView(
                      onReorder: (int oldIndex, int newIndex) {
                        if (oldIndex < newIndex) newIndex--;
                        _playlist.move(oldIndex, newIndex);
                      },
                      children: [
                        for (var i = 0; i < sequence.length; i++)
                          Dismissible(
                            key: ValueKey(sequence[i]),
                            background: Container(
                              color: Colors.redAccent,
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                            ),
                            onDismissed: (dismissDirection) {
                              _playlist.removeAt(i);
                            },
                            child: Material(
                              color: i == state!.currentIndex
                                  ? Colors.grey.shade300
                                  : null,
                              child: ListTile(
                                title: Text(sequence[i].tag.title as String),
                                onTap: () {
                                  _player.seek(Duration.zero, index: i);
                                },
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     _playlist.add(AudioSource.uri(
        //       Uri.parse("asset:///audio/nature.mp3"),
        //       tag: MediaItem(
        //         id: '${_nextMediaId++}',
        //         album: "Public Domain",
        //         title: "Nature Sounds ${++_addedCount}",
        //         artUri: Uri.parse(
        //             "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
        //       ),
        //     ));
        //   },
        // ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          var devs;
          return CustomDialogBox(
            title: "วิทยุสำหรับผู้ใจบุญ",
            descriptions: "ฟังธรรมะทั่วไทย กับแอพวิทยุพระพุทธศาสนา",
            text: "สาธุ",
            img: Image.asset('assets/devs.jpg'),
          );
        });
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  ControlButtons(this.player);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // IconButton(
        //   icon: Icon(Icons.volume_up),
        //   onPressed: () {
        //     showSliderDialog(
        //       context: context,
        //       title: "Adjust volume",
        //       divisions: 10,
        //       min: 0.0,
        //       max: 1.0,
        //       stream: player.volumeStream,
        //       onChanged: player.setVolume,
        //     );
        //   },
        // ),
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: Icon(Icons.skip_previous),
            onPressed: player.hasPrevious ? player.seekToPrevious : null,
          ),
        ),
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: EdgeInsets.all(8.0),
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return IconButton(
                icon: Icon(Icons.play_arrow),
                iconSize: 50.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: Icon(Icons.pause),
                iconSize: 50.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: Icon(Icons.replay),
                iconSize: 50.0,
                onPressed: () => player.seek(Duration.zero,
                    index: player.effectiveIndices!.first),
              );
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: Icon(Icons.skip_next),
            onPressed: player.hasNext ? player.seekToNext : null,
          ),
        ),
        // StreamBuilder<double>(
        //   stream: player.speedStream,
        //   builder: (context, snapshot) => IconButton(
        //     icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
        //         style: TextStyle(fontWeight: FontWeight.bold)),
        //     onPressed: () {
        //       showSliderDialog(
        //         context: context,
        //         title: "Adjust speed",
        //         divisions: 10,
        //         min: 0.5,
        //         max: 1.5,
        //         stream: player.speedStream,
        //         onChanged: player.setSpeed,
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}

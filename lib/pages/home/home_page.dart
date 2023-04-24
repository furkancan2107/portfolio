import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:webio/responsive.dart';
import 'package:webio/sabitler.dart';

import 'anaekran.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              )),
      drawer: YanMenu(),
      body: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(flex: 2, child: YanMenu()),
            Expanded(
              flex: 7,
              child: AnaEkran(),
            ),
          ],
        ),
      ),
    );
  }
}

class YanMenu extends StatelessWidget {
  const YanMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Hakkinda(),
          Ayrintilar(),
          Divider(),
          Text("Furkan Can @2023")
        ],
      ),
    );
  }
}

class Ayrintilar extends StatelessWidget {
  const Ayrintilar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BilgiText(baslik: "Üniversite", text: "Firat Üniversitesi"),
          BilgiText(baslik: "Bölüm", text: "Yazılım Mühendisiği"),
          BilgiText(baslik: "İlgi Alanları", text: "Unity,Flutter,java"),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Text(
              "Yetenekler",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          YetenekGoster(yetenek: "Unity", oran: 0.6),
          YetenekGoster(yetenek: "Flutter", oran: 0.65),
          YetenekGoster(yetenek: "Java", oran: 0.75),
          YetenekGoster(yetenek: "C#", oran: 0.6),
          YetenekGoster(yetenek: "C", oran: 0.5),
          YetenekGoster(yetenek: "Dart", oran: 0.6),
          Divider(),
          Text(
            "Bana Buradan Ulaşabilirsin ",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Adreslerim(),
        ],
      ),
    ));
  }
}

class Adreslerim extends StatelessWidget {
  const Adreslerim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () async {
              await launchUrlString("https://github.com/furkancan2107");
            },
            icon: Image.asset("assets/github.png")),
        IconButton(
            onPressed: () async {
              await launchUrlString(
                  "https://www.linkedin.com/in/furkan-can-45182b236/");
            },
            icon: Image.asset("assets/link.png")),
        IconButton(
            onPressed: () async {
              await launchUrlString("https://mail.google.com/mail/u/0/#sent");
            },
            icon: Image.asset("assets/gmail.jpeg")),
      ],
    );
  }
}

class YetenekGoster extends StatefulWidget {
  const YetenekGoster({super.key, required this.yetenek, required this.oran});
  final String yetenek;
  final double oran;

  @override
  State<YetenekGoster> createState() => _YetenekGosterState();
}

class _YetenekGosterState extends State<YetenekGoster> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${widget.yetenek}:",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0,
              end: widget.oran,
            ),
            duration: defaultDuration,
            builder: (context, double value, child) {
              return Stack(
                children: [
                  CircularProgressIndicator(
                    value: value,
                    color: Colors.red,
                    backgroundColor: darkColor,
                  ),
                  Center(child: Text("${(value * 100).toInt()}%")),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget topluYetenek() {
  return Column(
    children: [
      // YetenekGoster("Unity", 0.65),
      // yetenekGoster("Flutter", 0.65),
      // yetenekGoster("Java", 0.75),
      // yetenekGoster("C#", 0.6),
      // yetenekGoster("C", 0.5),
      // yetenekGoster("Dart", 0.6),
      // yetenekGoster("FireBase", 0.55),
    ],
  );
}

class BilgiText extends StatefulWidget {
  const BilgiText({
    Key? key,
    required this.baslik,
    required this.text,
  }) : super(key: key);
  final String? baslik, text;

  @override
  State<BilgiText> createState() => _BilgiTextState();
}

class _BilgiTextState extends State<BilgiText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: defaultPadding / 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.baslik!,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            widget.text!,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class Hakkinda extends StatelessWidget {
  const Hakkinda({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Colors.red.withOpacity(0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(
              flex: 2,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/profil.jpeg"),
            ),
            Text(
              "Furkan Can",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              "Yazılım Mühendisliği Öğrencisi",
              style: TextStyle(fontWeight: FontWeight.w100, height: 1.5),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

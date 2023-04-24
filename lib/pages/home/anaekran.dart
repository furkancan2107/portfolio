import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webio/models/Project.dart';
import 'package:webio/pages/home/home_page.dart';
import 'package:webio/responsive.dart';
import 'package:webio/sabitler.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({
    Key? key,
  }) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  String hakkimda =
      "Ben Furkan Yazılım Mühendisliği öğrencisiyim.Son zamanlarda unity ile uğraşıyorum.Onun dışında flutter ile bir çok proje yaptım ve java ile de algoritma yeteneğimi geliştiriyorum(Okul) yaptığım başka projeleride görmek istiyorsaniz github sayfama bakabilirsiniz";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3,
            child: Stack(fit: StackFit.expand, children: [
              // CachedNetworkImage(
              //   fit: BoxFit.cover,
              //   imageUrl: "assets/arka.jpg",
              //   placeholder: (context, url) => CircularProgressIndicator(),
              // ),
              Image.asset(
                "assets/arka.jpg",
                fit: BoxFit.cover,
              ),
              Container(
                color: darkColor.withOpacity(0.7),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("PORTFOLYOM",
                        style: Responsive.isDesktop(context)
                            ? Theme.of(context).textTheme.headline3!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                            : Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                    DefaultTextStyle(
                      style: Responsive.isDesktop(context)
                          ? Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.white60,
                              fontWeight: FontWeight.bold)
                          : Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Colors.white60,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                      child: AnimatedTextKit(
                        animatedTexts: [TyperAnimatedText(hakkimda)],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              children: [
                Text(
                  "Yaptıklarım",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.orange),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: projelerim.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
            itemBuilder: (context, index) {
              List<Project> proje = projelerim;
              var a = proje[index];
              return Portfolyo(
                  title: a.title.toString(),
                  subtitle: a.subtitle.toString(),
                  url: a.url.toString(),
                  image: a.image.toString());
            },
          ),
          Divider(),
          Text("Bana Burdan Ulaşabilirsiniz"),
          Adreslerim()
        ],
      ),
    );
  }
}

class Portfolyo extends StatelessWidget {
  const Portfolyo({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.image,
  }) : super(key: key);
  final String title, subtitle, url, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: Responsive.isDesktop(context) ? 200 : 100,
              width: maxWidth,
              color: Colors.orange,
              // ignore: unnecessary_null_comparison
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )
              //  CachedNetworkImage(
              //   fit: BoxFit.cover,
              //   imageUrl: image,
              //   placeholder: (context, url) => CircularProgressIndicator(),
              // ),
              ),
          Text(title,
              style: Responsive.isDesktop(context)
                  ? Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white)
                  : Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white)),
          DefaultTextStyle(
            style: Responsive.isDesktop(context)
                ? Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: darkColor)
                : Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: darkColor),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  subtitle,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              await launchUrlString(url);
            },
            child: Text("Git",
                style: Responsive.isDesktop(context)
                    ? Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: darkColor, fontSize: 25)
                    : Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: darkColor)),
          )
        ]),
      ),
    );
  }
}

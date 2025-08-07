import 'package:flutter/material.dart';
import 'package:twitter_card/svg_asset.dart';
import 'package:twitter_card/vector_icon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 600, // max allowed width
              child: TwitterEmbedCard(),
            ),
          ),
        ),
      ),
    );
  }
}

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: BoxBorder.all(color: Colors.grey)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Header(),
          const SizedBox(height: 5),
          const TextBody(),
          const SizedBox(height: 20),
          const ImageContainer(),
          const SizedBox(height: 5),
          const FooterRow(),
          SizedBox(
            width: 300,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text(
                "Read 12 replies",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/andrea-avatar.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      'Andrea Bizzotto',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    VectorIcon(
                      asset: SvgAsset.heartBlue,
                      height: 18,
                      width: 10,
                    ),
                    SizedBox(width: 5),
                    VectorIcon(asset: SvgAsset.verified, height: 18, width: 10),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '@biz84',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '·',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const Positioned(
          top: 0,
          right: 0,
          child: VectorIcon(asset: SvgAsset.x, height: 20, width: 10),
        ),
      ],
    );
  }
}

class TextBody extends StatelessWidget {
  const TextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      """Did you know?

When you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.

But there's a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇""",
      style: TextStyle(fontWeight: FontWeight.w500),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('assets/media-query-banner.jpg', fit: BoxFit.cover),
      ),
    );
  }
}

class FooterRow extends StatelessWidget {
  const FooterRow({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSpacing = 5;
    const double wordSpacing = 10;
    return Column(
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "10:21 AM",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 2),
                Transform.translate(
                  offset: const Offset(0, -4), // adjust this value as needed
                  child: const Text(
                    ".",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                const Text(
                  "Jun 20, 2023",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: -100,
                  child: VectorIcon(
                    asset: SvgAsset.info,
                    width: 10,
                    height: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 0.5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(wordSpacing: 2, fontWeight: FontWeight.w700),
                children: [
                  WidgetSpan(
                    child: VectorIcon(
                      asset: SvgAsset.heartRed,
                      height: 20,
                      width: 10,
                    ),

                    alignment: PlaceholderAlignment.middle,
                    baseline: TextBaseline.alphabetic,
                  ),
                  WidgetSpan(child: SizedBox(width: iconSpacing)),
                  TextSpan(
                    text: "997",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  WidgetSpan(child: SizedBox(width: wordSpacing)),
                  WidgetSpan(
                    child: VectorIcon(
                      asset: SvgAsset.comment,
                      height: 20,
                      width: 10,
                    ),
                    alignment: PlaceholderAlignment.middle,
                    baseline: TextBaseline.alphabetic,
                  ),
                  WidgetSpan(child: SizedBox(width: iconSpacing)),

                  TextSpan(
                    text: "Reply",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  WidgetSpan(child: SizedBox(width: wordSpacing)),
                  WidgetSpan(
                    child: VectorIcon(
                      asset: SvgAsset.link,
                      height: 20,
                      width: 10,
                    ),
                    alignment: PlaceholderAlignment.middle,
                    baseline: TextBaseline.alphabetic,
                  ),
                  WidgetSpan(child: SizedBox(width: iconSpacing)),
                  TextSpan(
                    text: "Copy Link",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:example/components/theme_switcher.dart';
import 'package:flutter/material.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({Key? key}) : super(key: key);

  String typeInfo(TextStyle? style) {
    if (style == null) return "null";
    return "${style.color},Size:${style.fontSize},${style.fontWeight}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Typography"),
        actions: const [ThemeSwitcher()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Head1",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(typeInfo(Theme.of(context).textTheme.headline1)),
              const Divider(),
              Text(
                "Head2",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(typeInfo(Theme.of(context).textTheme.headline2)),
              const Divider(),
              Text(
                "Head3",
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(typeInfo(Theme.of(context).textTheme.headline3)),
              const Divider(),
              Text(
                "Head4",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(typeInfo(Theme.of(context).textTheme.headline4)),
              const Divider(),
              Text(
                "Head5",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(typeInfo(Theme.of(context).textTheme.headline5)),
              const Divider(),
              Text(
                "Head6",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(typeInfo(Theme.of(context).textTheme.headline6)),
              const Divider(),
              Text(
                "Body1",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(typeInfo(Theme.of(context).textTheme.bodyText1)),
              const Divider(),
              Text(
                "Body2",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(typeInfo(Theme.of(context).textTheme.bodyText2)),
              const Divider(),
              Text(
                "Button",
                style: Theme.of(context).textTheme.button,
              ),
              Text(typeInfo(Theme.of(context).textTheme.button)),
              const Divider(),
              Text(
                "Overline",
                style: Theme.of(context).textTheme.overline,
              ),
              Text(typeInfo(Theme.of(context).textTheme.overline)),
              const Divider(),
              Text(
                "Caption",
                style: Theme.of(context).textTheme.caption,
              ),
              Text(typeInfo(Theme.of(context).textTheme.caption)),
              const Divider(),
              Text(
                "SubTitle1",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(typeInfo(Theme.of(context).textTheme.subtitle1)),
              const Divider(),
              Text(
                "SubTitle2",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(typeInfo(Theme.of(context).textTheme.subtitle2)),
            ],
          ),
        ),
      ),
    );
  }
}

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
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(typeInfo(Theme.of(context).textTheme.displayLarge)),
              const Divider(),
              Text(
                "Head2",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(typeInfo(Theme.of(context).textTheme.displayMedium)),
              const Divider(),
              Text(
                "Head3",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(typeInfo(Theme.of(context).textTheme.displaySmall)),
              const Divider(),
              Text(
                "Head4",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(typeInfo(Theme.of(context).textTheme.headlineMedium)),
              const Divider(),
              Text(
                "Head5",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(typeInfo(Theme.of(context).textTheme.headlineSmall)),
              const Divider(),
              Text(
                "Head6",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(typeInfo(Theme.of(context).textTheme.titleLarge)),
              const Divider(),
              Text(
                "Body1",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(typeInfo(Theme.of(context).textTheme.bodyLarge)),
              const Divider(),
              Text(
                "Body2",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(typeInfo(Theme.of(context).textTheme.bodyMedium)),
              const Divider(),
              Text(
                "Button",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(typeInfo(Theme.of(context).textTheme.labelLarge)),
              const Divider(),
              Text(
                "Overline",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(typeInfo(Theme.of(context).textTheme.labelSmall)),
              const Divider(),
              Text(
                "Caption",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(typeInfo(Theme.of(context).textTheme.bodySmall)),
              const Divider(),
              Text(
                "SubTitle1",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(typeInfo(Theme.of(context).textTheme.titleMedium)),
              const Divider(),
              Text(
                "SubTitle2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(typeInfo(Theme.of(context).textTheme.titleSmall)),
            ],
          ),
        ),
      ),
    );
  }
}

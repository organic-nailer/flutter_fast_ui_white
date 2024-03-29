import 'package:example/components/theme_switcher.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
        actions: const [ThemeSwitcher()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "OVERLINE",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Headline 5",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Greyhound divisively hello coldly wonderfully...",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.all(16),
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                child: Image.asset(
                                  "assets/panda.jpg",
                                  fit: BoxFit.cover,
                                ))),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {}, child: const Text("BUTTON")),
                          const SizedBox(
                            width: 16,
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text("BUTTON")),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

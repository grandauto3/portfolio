import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/data/portfolio_data.dart';
import '../components/home_page_entry.dart';
import '../components/center_element.dart';

typedef OnEntryClickedCallback = void Function(int id, String dataPath);

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.onEntryClicked,
  }) : super(key: key);

  final OnEntryClickedCallback onEntryClicked;

  @override
  Widget build(BuildContext context) {
    return CenterElement(
      children: [
        const Text('Portfolio'),
        HomepageEntry(
          title: 'Unity Level Editor',
          onPressed: () {
            onEntryClicked(
              0,
              'md/unity_level_editor.md',
            );
          },
        ),
        HomepageEntry(
          title: 'GodArena',
          onPressed: () {
            onEntryClicked(
              1,
              'md/test.md',
            );
          },
        ),
        HomepageEntry(
          title: 'Tents and Trees (WIP)',
          onPressed: () {
            onEntryClicked(
              2,
              'md/test.md',
            );
          },
        ),
        HomepageEntry(
          title: 'Rehago',
          onPressed: () {
            onEntryClicked(
              3,
              'md/test.md',
            );
          },
        ),
        HomepageEntry(
          title: 'Portfolio source',
          onPressed: () {
            onEntryClicked(
              4,
              'md/test.md',
            );
          },
        ),
        HomepageEntry(
          title: 'Test',
          onPressed: () {
            Beamer.of(context, root: true).beamToNamed('/test');
          },
        ),
      ],
    );
  }
}

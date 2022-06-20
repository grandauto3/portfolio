import 'package:flutter/material.dart';
import 'package:portfolio/core/portfolio_data.dart';
import 'package:portfolio/pages/markdown_page.dart';
import 'package:portfolio/pages/portfolio_page.dart';
import 'homepage.dart';
import 'package:beamer/beamer.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  BeamerDelegate _createBeamerDelegate() {
    return BeamerDelegate(
      setBrowserTabTitle: false,
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/': (ctx, state, data) => MyHomePage(
                onEntryClicked: (id, portData) {
                  Beamer.of(ctx).beamToNamed('p/$id', data: portData);
                },
              ),
          '/p/:pageId': (ctx, state, data) {
            return PortfolioPage(
              data: data as Future<PortfolioData>,
            );
          },
          '/test': (ctx, state, data) {
            return const MarkdownPage();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio',
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      routeInformationParser: BeamerParser(),
      routerDelegate: _createBeamerDelegate(),
    );
  }
}

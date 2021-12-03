import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Scrollable Layout',
      home: ScrollableSpaceBetweenLayout(),
    );
  }
}

class ScrollableSpaceBetweenLayout extends StatelessWidget {
  const ScrollableSpaceBetweenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.black12, // the background / sides
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      color: Colors.indigo,
                      height: 200,
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text('Header: Fixed Height'))),
                  Container(
                    color: Colors.orange,
                    constraints: BoxConstraints(
                      maxWidth: 960,
                      minHeight: max(viewportConstraints.maxHeight - 400, 0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                    'ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                              ],
                            ),
                            Container(
                                child: const Text('spacer'),
                                height: 1,
                                color: Colors.red)
                          ],
                        )),
                  ),
                  Container(
                      color: Colors.indigo,
                      height: 200,
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text('Footer: Fixed Height'))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScrollableIntrinsicMQH4Layout extends StatelessWidget {
  const ScrollableIntrinsicMQH4Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ContentContainer(
                      child: Container(
                          color: Colors.indigo,
                          height: 200,
                          child: const Text('Header: Fixed Height')),
                    ),
                    Expanded(
                      child: ContentContainer(
                        child: Container(
                            height: MediaQuery.of(context).size.height - 400,
                            color: Colors.white,
                            child: Column(
                              children: const [
                                Text(
                                    'height: MediaQuery.of(context).size.height - 400, ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                                Text('Content'),
                              ],
                            )),
                      ),
                    ),
                    ContentContainer(
                      child: Container(
                          color: Colors.indigo,
                          height: 200,
                          child: const Text('Footer: Fixed Height')),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScrollableSliverLayout extends StatelessWidget {
  const ScrollableSliverLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ContentContainer(
                        child: Container(
                            color: Colors.indigo,
                            height: 200,
                            child: const Text('Header: Fixed Height')),
                      ),
                      Expanded(
                        child: ContentContainer(
                          child: Container(
                              color: Colors.white,
                              child: Column(
                                children: const [
                                  Text(
                                      'ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent'),
                                  Text('1 Content'),
                                  Text('2 Content'),
                                  Text('3 Content'),
                                  Text('5 Content'),
                                  Text('5 Content'),
                                  Text('6 Content'),
                                ],
                              )),
                        ),
                      ),
                      ContentContainer(
                        child: Container(
                            color: Colors.indigo,
                            height: 200,
                            child: const Text('Footer: Fixed Height')),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}

class ScrollableIntrinsicLayout extends StatelessWidget {
  const ScrollableIntrinsicLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  // full page width
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        color: Colors.indigo,
                        height: 200,
                        child: const Text('Header: Fixed Height')),
                    ContentContainer(
                      child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                  'ContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContentContent'),
                              Text('Content'),
                              Text('Content'),
                              Text('Content'),
                              Text('Content'),
                              Text('Content'),
                              Text('Content'),
                            ],
                          )),
                    ),
                    Container(
                        color: Colors.indigo,
                        height: 200,
                        child: const Text('Footer: Fixed Height')),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContentContainer extends StatelessWidget {
  final Widget child;

  const ContentContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange, // Content Side Padding
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 960,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: child);
  }
}

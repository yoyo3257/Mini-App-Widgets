import 'package:flutter/material.dart';
import 'package:widget_explor/topics/accessibility_widgets.dart';
import 'package:widget_explor/topics/animation_and_motion_widgets.dart';
import 'package:widget_explor/topics/async.dart';
import 'package:widget_explor/topics/inputWidgets.dart';
import 'package:widget_explor/topics/interactionModel.dart';
import 'package:widget_explor/topics/layout.dart';
import 'package:widget_explor/topics/panting.dart';
import 'package:widget_explor/topics/scrolling.dart';
import 'package:widget_explor/topics/text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Categories',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  final Map<String, Widget Function()> categoryWidgetMap = const {
    'Accessibility widgets': AccessibilityWidgets.new,
    'Animation and motion widgets': AnimationAndMotionWidgets.new,
    'Async widgets': AsyncWidgets.new,
    'Input widgets and RichText': InputWidgetsAndRichText.new,
    'Interaction model widgets': InteractionModelWidgets.new,
    'Layout widgets': LayoutWidgets.new,
    'Painting and effect widgets': PaintingAndEffectWidgets.new,
    'Scrolling widgets': ScrollingWidgets.new,
    'Text widgets': TextWidgets.new,
  };

  @override
  Widget build(BuildContext context) {
    final categories =
        categoryWidgetMap.keys.toList(); // Get category names from the map

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Widget Categories',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder:
            (_, __) => const Divider(height: 1, indent: 16, endIndent: 16),
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            title: Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              if (categoryWidgetMap.containsKey(category)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => DetailPage(
                          title: category,
                          // Pass the function (builder) that creates the correct widget
                          categoryWidgetBuilder: categoryWidgetMap[category]!,
                        ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  // This is the function that will be called in the build method to display the correct widget.
  final Widget Function() categoryWidgetBuilder;

  const DetailPage({
    super.key,
    required this.title,
    required this.categoryWidgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            // Call the passed function to build the correct category widget
            child: categoryWidgetBuilder(),
          ),
        ),
      ),
    );
  }
}

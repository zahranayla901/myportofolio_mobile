import 'package:flutter_test/flutter_test.dart';

import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('Home page shows info cards and action buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('NPM'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Class'), findsOneWidget);
    expect(find.text('Load Project'), findsOneWidget);
    expect(find.text('Add Project'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('Pressing a button shows a SnackBar with its name', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Logout'));
    await tester.pump();

    expect(find.text('Kamu telah menekan tombol Logout!'), findsOneWidget);
  });
}
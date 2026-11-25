import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('Home page shows profile cards and menu buttons', (tester) async {
    await tester.pumpWidget(MyApp(apiClient: ApiClient()));

    expect(find.text('NPM'), findsOneWidget);
    expect(find.text('Load Project'), findsOneWidget);
    expect(find.text('Add Project'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });
}

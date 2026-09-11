import 'package:flutter_test/flutter_test.dart';
import 'package:shoply/app/app.dart';

void main() {
  testWidgets('renders the Shoply app shell', (tester) async {
    await tester.pumpWidget(const ShoplyApp());

    expect(find.text('Shoply'), findsOneWidget);
  });
}

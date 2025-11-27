// OrionHealth Widget Tests
// Basic smoke tests for the app structure

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orionhealth_health/core/theme/cyber_theme.dart';
import 'package:orionhealth_health/features/dashboard/home_dashboard_page.dart';

void main() {
  testWidgets('HomeDashboardPage renders without crashing', (WidgetTester tester) async {
    // Build the dashboard page
    await tester.pumpWidget(
      MaterialApp(
        theme: CyberTheme.darkTheme,
        home: const HomeDashboardPage(),
      ),
    );

    // Verify that key elements are present
    expect(find.text('Resumen Médico'), findsOneWidget);
    expect(find.text('Métricas de Salud'), findsOneWidget);
    expect(find.text('Acciones Rápidas'), findsOneWidget);
    expect(find.text('Actividad Reciente'), findsOneWidget);
  });

  testWidgets('CyberTheme has correct primary colors', (WidgetTester tester) async {
    final theme = CyberTheme.darkTheme;
    
    // Verify cyberpunk color scheme
    expect(theme.primaryColor.value, 0xFF00FF85); // Primary green
    expect(theme.colorScheme.secondary.value, 0xFF00E0FF); // Secondary cyan
    expect(theme.scaffoldBackgroundColor.value, 0xFF0A0A0A); // Dark background
  });

  testWidgets('Profile header displays user info', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: CyberTheme.darkTheme,
        home: const HomeDashboardPage(),
      ),
    );

    // Verify profile section exists
    expect(find.text('Alex Reyes'), findsOneWidget);
    expect(find.text('Edad: 34'), findsOneWidget);
    expect(find.text('ID: ORION-734'), findsOneWidget);
  });

  testWidgets('Health metrics grid displays all 6 metrics', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: CyberTheme.darkTheme,
        home: const HomeDashboardPage(),
      ),
    );

    // Verify all health metrics are displayed
    expect(find.text('A+'), findsOneWidget); // Blood type
    expect(find.text('75 kg'), findsOneWidget); // Weight
    expect(find.text('182 cm'), findsOneWidget); // Height
    expect(find.text('72'), findsOneWidget); // Pulse
    expect(find.text('36.5°C'), findsOneWidget); // Temperature
    expect(find.text('120/80'), findsOneWidget); // Blood pressure
  });

  testWidgets('Critical alert card is visible', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: CyberTheme.darkTheme,
        home: const HomeDashboardPage(),
      ),
    );

    // Verify critical alert
    expect(find.text('ALERTA CRÍTICA'), findsOneWidget);
    expect(find.text('Alergia: Penicilina'), findsOneWidget);
  });

  testWidgets('Quick actions are present', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: CyberTheme.darkTheme,
        home: const HomeDashboardPage(),
      ),
    );

    // Verify quick action cards
    expect(find.text('AI Assistant'), findsWidgets);
    expect(find.text('Salud'), findsOneWidget);
    expect(find.text('Estadísticas'), findsOneWidget);
    expect(find.text('Medicamentos'), findsOneWidget);
  });

  testWidgets('FAB is present for AI Assistant', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: CyberTheme.darkTheme,
        home: const HomeDashboardPage(),
      ),
    );

    // Verify floating action button
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}



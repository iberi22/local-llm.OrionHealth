import 'package:flutter/material.dart';
import 'package:orionhealth_health/core/theme/cyber_theme.dart';
import 'package:orionhealth_health/core/widgets/glassmorphic_card.dart';
import 'package:orionhealth_health/features/local_agent/presentation/chat_page.dart';
import 'package:orionhealth_health/features/local_agent/infrastructure/llm_service.dart';
import 'package:orionhealth_health/core/di/injection.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.local_hospital, color: CyberTheme.secondary),
        title: const Text('Resumen Médico'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            _ProfileHeader(),
            const SizedBox(height: 24),
            // Critical Alert Card
            _CriticalAlertCard(),
            const SizedBox(height: 24),
            // Health Metrics Grid
            Text(
              'Métricas de Salud',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: CyberTheme.textDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _HealthMetricsGrid(),
            const SizedBox(height: 24),
            // Quick Actions
            Text(
              'Acciones Rápidas',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: CyberTheme.textDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _QuickActionsSection(context),
            const SizedBox(height: 24),
            // Recent Activity
            _RecentActivitySection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(llmService: getIt<LlmService>()),
            ),
          );
        },
        icon: const Icon(Icons.chat),
        label: const Text('AI Assistant'),
        backgroundColor: CyberTheme.secondary,
        foregroundColor: Colors.black,
      ),
    );
  }

  Widget _QuickActionsSection(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _QuickActionCard(
          icon: Icons.chat_bubble_outline,
          label: 'AI Assistant',
          color: CyberTheme.secondary,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(llmService: getIt<LlmService>()),
              ),
            );
          },
        ),
        _QuickActionCard(
          icon: Icons.favorite_border,
          label: 'Salud',
          color: Colors.red[400]!,
          onTap: () {},
        ),
        _QuickActionCard(
          icon: Icons.insights,
          label: 'Estadísticas',
          color: CyberTheme.primary,
          onTap: () {},
        ),
        _QuickActionCard(
          icon: Icons.medical_services_outlined,
          label: 'Medicamentos',
          color: Colors.purple[400]!,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: CyberTheme.secondary, width: 2),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuAIpUPoUs4Oykl6RpdGHalhqjetooQ-sZ9LobLpgbAVOnhYpaq8N5vqWkwgyY-cwthjBPnowELtGGRPqp12k_sBKhk9r7bW6YJUQtkoABO21_fgw5CmQOHkZHg4bwR4J3Ib9VVx_cMtcEqRsl2k7jkw26FOnsrjgs9XHtK8O9g-VGixxrv0pXd_frqH_xsPyWS6rXzsNUlO_BSRmHdplSNegvbJxMUdDddekMquxJ3gn2_oK2Z4ToEq_mHl-FAK5E-ejgnRZzRJt7_M",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Alex Reyes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Edad: 34',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    'ID: ORION-734',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CriticalAlertCard extends StatelessWidget {
  const _CriticalAlertCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CyberTheme.primary.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: CyberTheme.primary.withOpacity(0.15),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning, color: CyberTheme.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                'ALERTA CRÍTICA',
                style: TextStyle(
                  color: CyberTheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Alergia: Penicilina',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Reacción anafiláctica severa. Evitar todos los derivados.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthMetricsGrid extends StatelessWidget {
  const _HealthMetricsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.9,
      children: const [
        _MetricCard(
          icon: Icons.bloodtype,
          value: 'A+',
          label: 'Tipo de Sangre',
        ),
        _MetricCard(
          icon: Icons.monitor_weight_outlined,
          value: '75 kg',
          label: 'Peso',
        ),
        _MetricCard(icon: Icons.height, value: '182 cm', label: 'Altura'),
        _MetricCard(icon: Icons.favorite, value: '72', label: 'Pulso'),
        _MetricCard(
          icon: Icons.thermostat,
          value: '36.5°C',
          label: 'Temperatura',
        ),
        _MetricCard(icon: Icons.water_drop, value: '120/80', label: 'Presión'),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _MetricCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: CyberTheme.secondary, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentActivitySection extends StatelessWidget {
  const _RecentActivitySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Actividad Reciente',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: CyberTheme.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const _ActivityItem(
          icon: Icons.event_available,
          title: 'Última Consulta',
          subtitle: 'Dr. Evelyn Reed',
          date: '15/08/2023',
        ),
        const _ActivityItem(
          icon: Icons.calendar_month,
          title: 'Próxima Cita',
          subtitle: 'Cardiología',
          date: '20/12/2023',
        ),
        const _ActivityItem(
          icon: Icons.medication,
          title: 'Medicación Actual',
          subtitle: 'Omeprazol 20mg',
          date: 'Diario',
        ),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String date;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: CyberTheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: CyberTheme.secondary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: (MediaQuery.of(context).size.width - 48) / 2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

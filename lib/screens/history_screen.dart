import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/event.dart';
import '../widgets/event_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.shield_outlined, size: 22),
        ),
        title: const Text('SAFETY'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'History',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 24),

            // Stats cards
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.borderGrey),
              ),
              child: Column(
                children: [
                  _buildStatCard(
                    label: 'EVENTS',
                    value: '124',
                    icon: Icons.bar_chart_rounded,
                    iconColor: AppTheme.textSecondary,
                    isLast: false,
                  ),
                  const Divider(height: 1, color: AppTheme.borderGrey),
                  _buildStatCard(
                    label: 'IMPACTS',
                    value: '08',
                    icon: Icons.warning_amber_rounded,
                    iconColor: AppTheme.accentBlue,
                    isLast: false,
                  ),
                  const Divider(height: 1, color: AppTheme.borderGrey),
                  _buildStatCard(
                    label: 'STATUS',
                    value: 'ACTIVE',
                    isStatus: true,
                    icon: Icons.check_circle_outline,
                    iconColor: AppTheme.textSecondary,
                    isLast: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Divider(color: AppTheme.borderGrey),
            const SizedBox(height: 8),

            // Recent events
            ...sampleEvents.map((e) => EventTile(event: e)),

            const SizedBox(height: 24),
            const Center(
              child: Text(
                'END OF RECENT ACTIVITY',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  color: AppTheme.textTertiary,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String label,
    required String value,
    required IconData icon,
    required Color iconColor,
    bool isStatus = false,
    required bool isLast,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isStatus ? 22 : 40,
                    fontWeight: FontWeight.w800,
                    letterSpacing: isStatus ? 2.0 : -1.0,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Icon(icon, color: iconColor, size: 22),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/pulsing_button.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({super.key});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  bool _isActive = true;

  void _toggleArm() {
    setState(() => _isActive = !_isActive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.shield_outlined, size: 22),
        ),
        title: const Text('SAFETY MONITOR'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Status indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isActive ? AppTheme.accentBlue : AppTheme.textTertiary,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _isActive ? 'SYSTEM ACTIVE' : 'SYSTEM DISARMED',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.8,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _isActive
                  ? 'Listening for emergency events\nand movement anomalies'
                  : 'System is off.\nTap to activate monitoring.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 48),

            // Big pulsing button
            PulsingActiveButton(isActive: _isActive, onTap: _toggleArm),

            const SizedBox(height: 20),
            Text(
              _isActive ? 'TAP TO DISARM' : 'TAP TO ACTIVATE',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.0,
                color: AppTheme.textSecondary,
              ),
            ),

            const SizedBox(height: 40),
            const Divider(color: AppTheme.borderGrey),
            const SizedBox(height: 20),

            // System status rows
            _buildStatusRow('DetectionService', 'NOMINAL',
                valueStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  color: AppTheme.textSecondary,
                )),
            _buildStatusRow('GPS Location', 'High Precision'),
            _buildStatusRow('Accelerometer', 'Calibrated'),
            _buildStatusRow('Network Sync', '0.4ms Latency'),

            const SizedBox(height: 24),

            // Instance ID card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.borderGrey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'INSTANCE ID',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: AppTheme.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'db-INST-ACC-0023',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: AppTheme.textPrimary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(
    String label,
    String value, {
    TextStyle? valueStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: AppTheme.textSecondary,
            ),
          ),
          Text(
            value,
            style: valueStyle ??
                const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
          ),
        ],
      ),
    );
  }
}

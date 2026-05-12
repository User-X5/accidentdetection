import 'package:flutter/material.dart';
import '../models/event.dart';
import '../theme.dart';

class EventTile extends StatelessWidget {
  final AccidentEvent event;

  const EventTile({super.key, required this.event});

  Widget _buildIcon() {
    switch (event.type) {
      case EventType.impact:
        return const Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Icon(Icons.wifi, color: AppTheme.textPrimary, size: 22),
            Positioned(
              bottom: 0,
              child: Icon(Icons.location_on_outlined,
                  color: AppTheme.accentBlue, size: 14),
            ),
          ],
        );
      case EventType.suddenStop:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.textPrimary, width: 2),
          ),
          child: const Center(
            child: Icon(Icons.stop, color: AppTheme.textPrimary, size: 12),
          ),
        );
      case EventType.signalLoss:
        return const Icon(Icons.wifi_off, color: AppTheme.textPrimary, size: 24);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: _buildIcon(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.typeLabel,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.3,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      event.formattedDate,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              event.id,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'LOCATE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  color: AppTheme.textPrimary,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Divider(color: AppTheme.borderGrey, thickness: 1),
      ],
    );
  }
}

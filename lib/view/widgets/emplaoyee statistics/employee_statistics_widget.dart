import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EmployeeStatisticsWidget extends StatelessWidget {
  final int statisticalNumber;
  final String widgetTitle;
  final String imageAssetPath;
  final double changedPercentage;
  const EmployeeStatisticsWidget({
    super.key,
    required this.statisticalNumber,
    required this.widgetTitle,
    required this.imageAssetPath,
    required this.changedPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double parentWidth = size.width * 0.95;
    final double parentHeight = size.height * 0.6;
    return Container(
      width: (size.width >= 990) ? parentWidth * 0.22 : size.width * 0.8,
      height: (size.width >= 990) ? parentHeight * 0.5 : size.height * 0.3,
      padding: const EdgeInsets.all(26),
      child: SingleChildScrollView(
        physics:
            (size.width < 990) ? const NeverScrollableScrollPhysics() : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFF8F8F8),
              radius: size.width * 0.02,
              child: Image(
                image: AssetImage(imageAssetPath),
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    '$statisticalNumber ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    minFontSize: 24,
                    maxFontSize: 32,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: (size.width >= 990)
                      ? size.width * 0.06
                      : size.width * 0.2,
                  height: 30,
                  decoration: BoxDecoration(
                    color: (changedPercentage >= 0)
                        ? const Color(0xFFE7F7EF)
                        : const Color(0xFFFFEDEC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Image(
                          image: AssetImage(
                            (changedPercentage >= 0)
                                ? 'assets/icons/trending-up.png'
                                : 'assets/icons/trending-down.png',
                          ),
                          color: (changedPercentage >= 0)
                              ? const Color(0xFF27A376)
                              : const Color(0xFFE03137),
                          width: (size.width >= 990)
                              ? size.width * 0.009
                              : size.width * 0.1,
                          height: (size.width >= 990)
                              ? size.width * 0.009
                              : size.width * 0.1,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          '${(changedPercentage >= 0) ? '+' : ''}$changedPercentage%',
                          style: TextStyle(
                            color: (changedPercentage >= 0)
                                ? const Color(0xFF27A376)
                                : const Color(0xFFE03137),
                          ),
                          maxFontSize: 12,
                          minFontSize: 9,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            AutoSizeText(
              widgetTitle,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxFontSize: 14,
              minFontSize: 7,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

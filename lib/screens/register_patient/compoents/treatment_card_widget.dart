import 'package:flutter/material.dart';

import '../../../utils/color/custom_color.dart';
import '../../../utils/widgets/custom_icon_btn_widget.dart';
import '../../../utils/widgets/custom_text_widget.dart';

class TreatmentCardWidget extends StatelessWidget {
  final String treatmentName;
  final int maleCount;
  final int femaleCount;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TreatmentCardWidget({
    super.key,
    required this.treatmentName,
    required this.maleCount,
    required this.femaleCount,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          // Index number
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: blackColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomTextWidget(
                text: "1",
                color: whiteColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Treatment details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: treatmentName,
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextWidget(
                            text: "Male",
                            color: blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(width: 8),
                          CustomTextWidget(
                            text: maleCount.toString(),
                            color: blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextWidget(
                            text: "Female",
                            color: blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(width: 8),
                          CustomTextWidget(
                            text: femaleCount.toString(),
                            color: blackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: appIconSecondaryColor,
                  shape: BoxShape.circle,
                ),
                child: CustomIconButtnWidget(
                  icon: Icon(Icons.close, color: whiteColor, size: 12),
                  onPressed: onDelete,
                ),
              ),

              CustomIconButtnWidget(
                icon: Icon(
                  Icons.edit_outlined,
                  color: loginButnColor,
                  size: 20,
                ),
                onPressed: onEdit,
              ),
              const SizedBox(width: 4),
            ],
          ),
        ],
      ),
    );
  }
}

import "package:afrosync/model/enums/license_terms.dart";
import "package:flutter/material.dart";

import "../../core/color.dart";
import "../../core/responsive.dart";

class NegotiationBottomSheet extends StatefulWidget {
  final List<BaseTerm> terms;

  const NegotiationBottomSheet(this.terms, {super.key});

  /// Show the negotiation bottom sheet
  static void show(BuildContext context, List<BaseTerm> terms) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => NegotiationBottomSheet(terms),
    );
  }

  @override
  State<NegotiationBottomSheet> createState() => _NegotiationBottomSheetState();
}

class _NegotiationBottomSheetState extends State<NegotiationBottomSheet> {
  late Map<String, String?> selectedOptions;

  @override
  void initState() {
    super.initState();
    // Initialize with first option of each term pre-selected
    selectedOptions = {};
    for (final term in widget.terms) {
      if (term.terms.isNotEmpty) {
        selectedOptions[term.categoryName] = term.terms.first.name;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.85,
      snap: true,
      snapSizes: [0.55, 0.75, 0.85],
      expand: false,
      builder: (context, controller) {
        return Container(
          decoration: BoxDecoration(
            color: ModernColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ModernColors.textSecondary,
                ),
                margin: EdgeInsets.only(top: 12, bottom: 12),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Negotiate Terms",
                        style: TextStyle(
                          fontSize: 24,
                          color: ModernColors.text,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Generate radio button groups for each term
                      ...widget.terms.map((term) => _buildTermSection(term)),

                      // SizedBox(height: 12),

                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: ModernColors.text),
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: ModernColors.text),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                // TODO: Handle save logic
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: ModernColors.text,
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: Text(
                                "Send Offer",
                                style: TextStyle(color: ModernColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTermSection(BaseTerm term) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            term.categoryName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ModernColors.text,
            ),
          ),
          SizedBox(height: 4),

          Text(
            term.definition.split(".")[0],
            style: TextStyle(
              fontSize: 15,
              color: ModernColors.text,
              height: 1.25,
            ),
          ),
          SizedBox(height: 12),

          // Radio button options
          ...term.terms.map(
            (option) => _buildRadioOption(term.categoryName, option),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String termCategory, BaseTermInstances option) {
    final isSelected = selectedOptions[termCategory] == option.name;

    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedOptions[termCategory] = option.name;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            // Radio button
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ModernColors.activeBlue
                      : ModernColors.textSecondary,
                  width: 2,
                ),
                color: isSelected
                    ? ModernColors.activeBlue
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 12, color: ModernColors.white)
                  : null,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Text(
                  option.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? ModernColors.activeBlue
                        : ModernColors.text,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

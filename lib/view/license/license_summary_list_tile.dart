import 'package:afrosync/model/enums/license_terms.dart';
import 'package:flutter/material.dart';

import '../../core/color.dart';

class LicenseSummaryListTile<T extends BaseTerm> extends StatelessWidget {
  final T term;

  const LicenseSummaryListTile(this.term, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCategoryDetails(context, term);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              term.categoryName,
              style: const TextStyle(
                fontSize: 16,
                color: ModernColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              term.terms[0].name,
              style: TextStyle(fontSize: 16, color: ModernColors.text),

              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}

void showCategoryDetails<T extends BaseTerm>(BuildContext context, T term) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => DetailsBottomSheet<T>(term),
  );
}

class DetailsBottomSheet<T extends BaseTerm> extends StatelessWidget {
  final T term;

  const DetailsBottomSheet(this.term, {super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.85,
      snap: true,
      snapSizes: [0.55, 0.75, 0.85],
      expand: false,
      builder: (context, scrollController) => SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              height: 4,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ModernColors.textSecondary,
              ),
              margin: EdgeInsetsGeometry.only(top: 20),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text(
                      term.categoryName,
                      style: TextStyle(
                        fontSize: 24,
                        color: ModernColors.text,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.only(left: 4),
                      child: Text(
                        term.definition,
                        style: TextStyle(
                          fontSize: 15,
                          color: ModernColors.text,
                          height: 1.25,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ...term.terms.map((term) => TermItemDetailsWidget(term)),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermItemDetailsWidget extends StatelessWidget {
  final BaseTermInstances instances;

  const TermItemDetailsWidget(this.instances, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ${instances.name}",
          style: TextStyle(
            fontSize: 20,
            color: ModernColors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(left: 8, top: 4),
          child: Text(
            instances.description,
            style: TextStyle(
              fontSize: 15,
              color: ModernColors.textSecondary,
              height: 1.25,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

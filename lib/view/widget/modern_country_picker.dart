import 'package:flutter/material.dart';
import 'package:syncc/model/enums/country.dart';

import '../../core/color.dart';

class ModernCountryPicker extends StatefulWidget {
  final String title;
  final Function(Country country) onChanged;

  const ModernCountryPicker({
    super.key,
    this.title = "Country",
    required this.onChanged,
  });

  @override
  State<ModernCountryPicker> createState() => _ModernCountryPickerState();
}

class _ModernCountryPickerState extends State<ModernCountryPicker> {
  late final TextEditingController searchController;
  late final ScrollController scrollController;
  final LayerLink layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  late ValueNotifier<List<Country>> countries;

  late FocusNode focusNode;

  @override
  void initState() {
    searchController = TextEditingController();
    focusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });

    countries = ValueNotifier(Country.values);
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void filterList() {
    final query = searchController.value.text;
    setState(() {
      if (query.isEmpty) {
        countries.value = Country.values;
        return;
      }

      countries.value = Country.search(query);
    });
    widget.onChanged(Country.nigeria);
  }

  void _showOverlay(constraints) {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => CompositedTransformFollower(
        link: layerLink, // 🔹 same link as target
        showWhenUnlinked: true,
        offset: const Offset(0, 60), // position below TextField
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 250,
            maxWidth: constraints.maxWidth,
          ),
          child: Material(
            // important to show InkWell hover colors
            elevation: 4,
            color: ModernColors.background,
            borderRadius: BorderRadius.circular(8),
            child: Scrollbar(
              thumbVisibility: true,
              controller: scrollController,
              thickness: 1,
              child: ListView.separated(
                physics: ClampingScrollPhysics(),
                controller: scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final country = countries.value[index];
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {
                        print("object");
                        searchController.text = country.name;
                        widget.onChanged(country);
                      },
                      child: Container(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        color: Colors.transparent,

                        child: Text(
                          country.name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(thickness: 0.6, height: 1),
                itemCount: countries.value.length,
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _hideOverlay() async {
    await Future.delayed(Duration(milliseconds: 200));
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: ModernColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 0.5,
              ),
            ),

            CompositedTransformTarget(
              link: layerLink,
              child: Focus(
                focusNode: focusNode,
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    _showOverlay(constraints);
                  } else {
                    _hideOverlay();
                  }
                },
                child: TextField(
                  controller: searchController,
                  onChanged: (keyword) => filterList(),
                ),
              ),
            ),

            SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

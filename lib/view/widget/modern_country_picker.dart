import 'package:flutter/material.dart';
import 'package:afrosync/model/enums/country.dart';

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
  late ValueNotifier<List<Country>> countries;
  late final ScrollController _scrollController;
  Country? selectedCountry;

  @override
  void initState() {
    searchController = TextEditingController();
    countries = ValueNotifier(Country.values);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterList() {
    final query = searchController.value.text;
    countries.value = Country.search(query);
    setState(() {});
  }

  void _onCountrySelected(Country country) {
    setState(() {
      selectedCountry = country;
      searchController.text = country.name;
    });
    widget.onChanged(country);
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
                color: ModernColors.text,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 0.5,
              ),
            ),
            SizedBox(height: 12),

            ValueListenableBuilder<List<Country>>(
              valueListenable: countries,
              builder: (context, countryList, child) {
                return MenuAnchor(
                  builder: (context, controller, child) {
                    return TextField(
                      controller: searchController,
                      onChanged: (keyword) => filterList(),
                      onTap: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          controller.isOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ),
                    );
                  },
                  alignmentOffset: Offset(0, 12),
                  menuChildren: [
                    SizedBox(
                      height: 200,
                      width: constraints.maxWidth,
                      child: Scrollbar(
                        controller: _scrollController,

                        child: ListView.separated(
                          shrinkWrap: true,
                          controller: _scrollController,
                          itemCount: countryList.length,
                          separatorBuilder: (context, index) => Divider(
                            height: 1,
                            thickness: 0.5,
                            color: Colors.grey[300],
                          ),
                          itemBuilder: (context, index) {
                            final country = countryList[index];
                            return MenuItemButton(
                              onPressed: () => _onCountrySelected(country),
                              child: Text(
                                country.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ModernColors.text,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:syncc/core/color.dart';
import 'package:syncc/core/responsive.dart';
import 'package:syncc/view/home_widget.dart';
import 'package:syncc/view/widget/audio_player_widget.dart';

class ModernNavigation extends StatefulWidget {
  final TabView? currentTab;

  const ModernNavigation({super.key, required this.currentTab});

  @override
  State<ModernNavigation> createState() => _ModernNavigationState();
}

class _ModernNavigationState extends State<ModernNavigation>
    with AutomaticKeepAliveClientMixin {
  late TabView _currentTab;
  late int _currentIndex;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _currentTab = widget.currentTab ?? TabView.catalog;
    _currentIndex = TabView.values.indexOf(_currentTab);
    super.initState();
  }

  void selectTab(TabView tab) {
    final newIndex = TabView.values.indexOf(tab);
    setState(() {
      _currentTab = tab;
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    bool isNotMobile = !Responsive.isMobile(context);
    return isNotMobile
        ? Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: ModernColors.textSecondary,
                      width: 0.3,
                    ),
                  ),
                ),
                padding: EdgeInsets.only(left: 8, top: 52, bottom: 8, right: 8),
                child: Column(
                  spacing: 24,
                  children: TabView.values.map((tab) {
                    final isSelected = _currentTab == tab;
                    return ModernNavigationTab(
                      tab,
                      onPressed: () => selectTab(tab),
                      isSelected: isSelected,
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: IndexedStack(
                        index: _currentIndex,
                        children: TabView.values
                            .map((tab) => tab.screen)
                            .toList(),
                      ),
                    ),
                    AnimatedSize(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      child: AudioPlayerWidget(),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: _currentIndex,
                  children: TabView.values.map((tab) => tab.screen).toList(),
                ),
              ),
              Column(
                children: [
                  AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: AudioPlayerWidget(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: ModernColors.textSecondary,
                          width: 0.3,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      right: 0,
                    ),
                    child: Row(
                      children: TabView.values.map((tab) {
                        final isSelected = _currentTab == tab;
                        return Expanded(
                          child: ModernNavigationTab(
                            tab,
                            onPressed: () => selectTab(tab),
                            isSelected: isSelected,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}

class ModernNavigationTab extends StatelessWidget {
  final VoidCallback? onPressed;
  final TabView tab;
  final bool isSelected;

  const ModernNavigationTab(
    this.tab, {
    super.key,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected
                ? ModernColors.primary.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: ModernColors.primary.withValues(
                alpha: isSelected ? 0.3 : 0,
              ),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                tab.icon,
                color: isSelected
                    ? ModernColors.primary
                    : ModernColors.textSecondary,
                size: 20,
              ),
              SizedBox(width: 12),
              Text(
                tab.name,
                style: TextStyle(
                  color: isSelected ? ModernColors.primary : ModernColors.text,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

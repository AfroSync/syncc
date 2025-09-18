import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/color.dart';
import '../../core/responsive.dart';
import '../../core/routes.dart';
import '../../model/track_model.dart';

class TrackDetailsButtons extends StatelessWidget {
  final TrackModel track;

  const TrackDetailsButtons(this.track, {super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 450, minWidth: 100),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: isMobile
                        ? EdgeInsetsGeometry.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          )
                        : null,
                    side: BorderSide(color: ModernColors.text),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Icon(
                        CupertinoIcons.play_fill,
                        color: ModernColors.text,
                        size: 24,
                      ),
                      Text(
                        "Play",

                        style: TextStyle(
                          fontSize: 16,
                          color: ModernColors.text,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},

                  style: OutlinedButton.styleFrom(
                    padding: isMobile
                        ? EdgeInsetsGeometry.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          )
                        : null,
                    side: BorderSide(color: ModernColors.text),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,

                    children: [
                      Icon(
                        CupertinoIcons.heart_fill,
                        color: ModernColors.text,
                        size: 24,
                      ),
                      Text(
                        "Favorite",
                        style: TextStyle(
                          fontSize: 16,
                          color: ModernColors.text,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              context.push(ModernRoutes.licenseContract(track.id.toString()));
            },
            style: TextButton.styleFrom(
              padding: isMobile
                  ? EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16)
                  : null,
              backgroundColor: ModernColors.text,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(
                  CupertinoIcons.download_circle_fill,
                  color: ModernColors.white,
                  size: 24,
                ),
                Text(
                  "License",

                  style: TextStyle(fontSize: 16, color: ModernColors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

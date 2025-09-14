import 'package:flutter/material.dart';
import 'package:syncc/core/assets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class SplashBackground extends StatefulWidget {
  const SplashBackground({super.key});

  @override
  State<SplashBackground> createState() => _SplashBackgroundState();
}

class _SplashBackgroundState extends State<SplashBackground> {
  final videoController = VideoPlayerController.asset(Assets.hero);
  final audioController = AudioPlayer();

  @override
  void initState() {
    super.initState();
    videoController.initialize().then((_) {
      videoController.play();
      setState(() {});
    });

    videoController.setLooping(true);

    audioController.setReleaseMode(ReleaseMode.loop);

    audioController.play(AssetSource(Assets.backgroundMusic));
  }

  @override
  void dispose() {
    audioController.dispose();
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final videoSize = videoController.value.size;
        final widgetRatio = constraints.maxWidth / constraints.maxHeight;
        final videoRatio = videoSize.width / videoSize.height;

        final scale = videoRatio > widgetRatio
            ? videoRatio / widgetRatio
            : widgetRatio / videoRatio;

        return Transform.scale(
          scale: scale,
          child: Center(
            child: AspectRatio(
              aspectRatio: videoController.value.aspectRatio,
              child: videoController.value.isInitialized
                  ? VideoPlayer(videoController)
                  : Image.asset(Assets.heroPlaceholder, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}

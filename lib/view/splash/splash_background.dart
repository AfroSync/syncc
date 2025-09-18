import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:afrosync/core/assets.dart';
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
  bool _firstFrameDone = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _firstFrameDone = true;
      });
      videoController.initialize().then((_) {
        videoController
          ..setVolume(0)
          ..play();
        setState(() {});
      });

      videoController.setLooping(true);

      audioController
        ..setVolume(0)
        ..setReleaseMode(ReleaseMode.loop);

      audioController.play(AssetSource(Assets.backgroundMusic));
    });
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

        final double scale = videoRatio > widgetRatio
            ? videoRatio / widgetRatio
            : widgetRatio / videoRatio;
        final child = Material(
          color: Colors.black87,
          child: Center(
            child: AspectRatio(
              aspectRatio: videoController.value.aspectRatio,
              child: videoController.value.isPlaying
                  ? VideoPlayer(videoController)
                  : Image.asset(Assets.heroPlaceholder, fit: BoxFit.cover),
            ),
          ),
        );

        // Only scale after first frame
        return _firstFrameDone
            ? Transform.scale(
                scale: scale.isFinite && scale > 0 ? scale : 1,
                child: child,
              )
            : child;
      },
    );
  }
}

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
    appId: "307f2b94b07a48fcbca265d106b02d14",
    channelName: "argon",
    tempToken:
        "007eJxTYLideV2hq/jN1w9nf3zfuEr09b43ldfM5x+7MbGh/soe+b8vFBiMDczTjJIsTZIMzBNNLNKSk5ITjcxMUwwNzJIMjFIMTYzVs5MbAhkZ2DMuMDEyQCCIz8qQWJSen8fAAABGeyTK",
  ));

  @override
  void initState() {
    initAgora();
    super.initState();
  }

  Future<void> initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Video Call"),
          ),
          body: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: client,
                enabledButtons: [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

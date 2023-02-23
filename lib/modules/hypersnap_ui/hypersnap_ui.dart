import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hypersnapsdk_flutter/hypersnapsdk_flutter.dart';

class HyperSnapUI extends StatefulWidget {
  const HyperSnapUI({Key? key}) : super(key: key);

  @override
  State<HyperSnapUI> createState() => _HyperSnapUIState();
}

class _HyperSnapUIState extends State<HyperSnapUI> {
  bool isUserSessionStarted = false;
  String faceImageUri = "";
  String docImageUri = "";

  @override
  void initState() {
    initHyperSnapSDK();
    super.initState();
  }

  initHyperSnapSDK() async {
    String appId = "5bb7eb0ec75b7453"; //your app id
    String appKey = "c76484b87c0c78f6"; //your app key

    var init = await HyperSnapSDK.initialize(appId, appKey, Region.india);
    log(init);
    await HyperSnapSDK.setHyperSnapSDKConfig(
      hyperSnapSDKConfig: HyperSnapSDKConfig(
        shouldEnableSSLPinning: true,
        timeoutConfig: HVTimeoutConfig(connectTimeout: 100, readTimeout: 100, writeTimeout: 100),
      ),
    );
  }

  changeUserSessionStatus() async {
    if (!isUserSessionStarted) {
      await HyperSnapSDK.endUserSession();
      bool isStarted = await HyperSnapSDK.startUserSession('abc');
      if (isStarted) {
        isUserSessionStarted = isStarted;
      }
      log("user session started : $isUserSessionStarted");
    } else {
      await HyperSnapSDK.endUserSession();
      isUserSessionStarted = false;
    }
    setState(() {});
  }

  startDocCapture() async {
    await HVDocsCapture.start(
        hvDocConfig: HVDocConfig(),
        onComplete: (hvResponse, hvError) {
          printResult(hvResponse, hvError);
          setState(() {
            docImageUri = hvResponse?.imageUri ?? "";
          });
        });
  }

  startFaceCapture() async {
    await HVFaceCapture.start(
        hvFaceConfig: HVFaceConfig(),
        onComplete: (hvResponse, hvError) {
          printResult(hvResponse, hvError);
          setState(() {
            faceImageUri = hvResponse?.imageUri ?? "";
          });
        });
  }

  faceMatchCall() async {
    await HVNetworkHelper.makeFaceMatchCall(
        endpoint: "",
        //face match endpoint
        faceUri: faceImageUri,
        documentUri: docImageUri,
        faceMatchMode: FaceMatchMode.faceId,
        parameters: {},
        headers: {},
        onComplete: (hvResponse, hvError) {
          printResult(hvResponse, hvError);
        });
  }

  ocrCall() async {
    await HVNetworkHelper.makeOCRCall(
        endpoint: "",
        //OCR endpoint
        documentUri: docImageUri,
        parameters: {},
        headers: {},
        onComplete: (hvResponse, hvError) {
          printResult(hvResponse, hvError);
        });
  }

  barcodeScanCapture() async {
    await HVBarcodeScanCapture.start(
        hvBarcodeConfig: HVBarcodeConfig(),
        onComplete: (hvResponse, hvError) {
          printResult(hvResponse, hvError);
        });
  }

  printResult(HVResponse? hvResponse, HVError? hvError) {
    if (hvResponse != null) {
      if (hvResponse.imageUri != null) log("image uri : ${hvResponse.imageUri!}");
      if (hvResponse.videoUri != null) log("video uri : ${hvResponse.videoUri!}");
      if (hvResponse.fullImageUri != null) log("full image uri : ${hvResponse.fullImageUri!}");
      if (hvResponse.retakeMessage != null) log("retake Message : ${hvResponse.retakeMessage!}");
      if (hvResponse.action != null) log("action : ${hvResponse.action!}");
      if (hvResponse.apiResult != null) log("api result : ${hvResponse.apiResult!.toString()}");
      if (hvResponse.apiHeaders != null) log("api headers : ${hvResponse.apiHeaders!.toString()}");
      if (hvResponse.qr != null) log("qr : ${hvResponse.qr!}");
    }
    if (hvError != null) {
      log("error code : ${hvError.errorCode}");
      log("error message : ${hvError.errorMessage}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HyperSnap"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async => await changeUserSessionStatus(), child: Text(isUserSessionStarted ? "end session" : "start session")),
            ElevatedButton(onPressed: () async => await startDocCapture(), child: const Text("start doc capture")),
            ElevatedButton(onPressed: () async => await startFaceCapture(), child: const Text("start face capture")),
            ElevatedButton(onPressed: () async => await faceMatchCall(), child: const Text("start face match ")),
            ElevatedButton(onPressed: () async => await ocrCall(), child: const Text("start ocr call ")),
            ElevatedButton(onPressed: () async => await barcodeScanCapture(), child: const Text("start qr scan ")),
          ],
        ),
      ),
    );
  }
}

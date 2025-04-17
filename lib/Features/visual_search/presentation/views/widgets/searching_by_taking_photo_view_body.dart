import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';

class SearchingByTakingPhotoViewBody extends StatefulWidget {
  const SearchingByTakingPhotoViewBody({super.key});

  @override
  State<SearchingByTakingPhotoViewBody> createState() =>
      _SearchingByTakingPhotoViewBodyState();
}

class _SearchingByTakingPhotoViewBodyState
    extends State<SearchingByTakingPhotoViewBody> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  File? file;
  bool isCropped = false;

  @override
  void initState() {
    super.initState();
    setupCameras();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _initializeCameraController();
        await _initializeCameraOnDevice();
      }
    } catch (e) {
      debugPrint("Error setting up cameras: $e");
    }
  }

  void _initializeCameraController() {
    cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );
  }

  Future<void> _initializeCameraOnDevice() async {
    try {
      await cameraController!.initialize();
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      debugPrint("Error initializing camera on device: $e");
    }
  }

  Future<void> takePhoto() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      debugPrint("Camera is not initialized");
      return;
    }

    try {
      final XFile capturedFile = await cameraController!.takePicture();
      if (capturedFile.path.isNotEmpty) {
        file = File(capturedFile.path);
        final croppedFile = await cropImage(file!.path);
        if (croppedFile != null) {
          file = File(croppedFile.path);
          isCropped = true;
        }
      }
    } catch (e) {
      debugPrint("Error taking photo: $e");
    }
  }

  Future<CroppedFile?> cropImage(String sourcePath) async {
    try {
      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: sourcePath,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(

            toolbarTitle: 'Crop the item',
            toolbarColor: Colors.transparent,
            toolbarWidgetColor: Colors.black,
            hideBottomControls: true,
          ),
          IOSUiSettings(
            title: 'Crop the item',
            aspectRatioLockEnabled: false,
          ),
        ],
      );
      return croppedFile;
    } catch (e) {
      debugPrint("Error cropping image: $e");
      return null;
    }
  }

  void findResults() {
    context.push(FindingSimilarResultsScreen.route);
  }

  @override
  void dispose() {
    cameraController?.dispose();
    cameraController = null;
    file = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        cameraController == null || !cameraController!.value.isInitialized
            ? const Center(child: CircularProgressIndicator())
            : file != null
                ? Expanded(child: Image.file(file!, fit: BoxFit.cover))
                : Expanded(child: CameraPreview(cameraController!)),
        SizedBox(
          height: 106,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: IconButton(
                  onPressed: () {
                    if (isCropped) {
                      findResults();
                    } else {
                      takePhoto();
                    }
                  },
                  icon: Icon(
                    isCropped ? Icons.search : Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FindingSimilarResultsScreen extends StatelessWidget {
  const FindingSimilarResultsScreen({super.key});
  static const String route = "/finding-similar-results-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search, size: 100, color: Colors.red),
            const SizedBox(height: 20),
            const Text(
              'Finding similar results...',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

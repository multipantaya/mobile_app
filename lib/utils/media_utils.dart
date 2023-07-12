import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/utils/strings.dart';
import 'package:presentation/presentation.dart';

class MediaUtils {

  // getImageFromCamera(BuildContext context,
  //     {required void Function(Photo) onGetImage}) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     File file = File.fromUri(Uri(path: image.path));
  //     Photo photo = Photo(
  //       url: file.path,
  //       file: file,
  //       title: image.path.split('/').last,
  //       //created: DateTime.now().toIso8601String(),
  //       id: DateTime.now().toIso8601String(),
  //     );
  //     onGetImage(photo);
  //   }
  // }

  // /* get image from gallery obtain only one image from function */
  // getImageFromGallery(BuildContext context,
  //     {required void Function(Photo) onGetImage}) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     File file = File.fromUri(Uri(path: image.path));
  //     Photo photo = Photo(url: file.path, id: DateTime.now().toIso8601String());
  //     onGetImage(photo);
  //   }
  // }

  // /* get images from gallery obtain multiple images and return a List<Photo> in onGetImages */
  // getImagesFromGallery(BuildContext context,
  //     {required void Function(List<Photo>) onGetImages}) async {
  //   final ImagePicker picker = ImagePicker();
  //   // ignore: unnecessary_nullable_for_final_variable_declarations
  //   final List<XFile?>? images = await picker.pickMultiImage();
  //   if (images != null) {
  //     List<Photo> photos = [];
  //     for (var image in images) {
  //       File file = File.fromUri(Uri(path: image!.path));
  //       photos.add(Photo(
  //         url: file.path,
  //         id: DateTime.now().toIso8601String(),
  //         title: image.path.split('/').last,
  //         //created: DateTime.now().toIso8601String(),
  //       ));
  //     }
  //     onGetImages(photos);
  //   }
  // }
  // /* functions to get video media */

  // /* get video from camera obtain only one video from function */
  // Future<void> getVideoFromCamera(BuildContext context,
  //     {required void Function(Video) onGetVideo}) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? videoFile = await picker.pickVideo(source: ImageSource.camera);
  //   if (videoFile != null) {
  //     File file = File.fromUri(Uri(path: videoFile.path));
  //     Video video = Video(
  //       url: file.path,
  //       id: DateTime.now().toIso8601String(),
  //       file: file,
  //     );
  //     onGetVideo(video);
  //   }
  // }

  // /* get video from gallery obtein only one video from function */
  // getVideoFromGallery(BuildContext context,
  //     {required void Function(Video) onGetVideo}) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? videoFile =
  //       await picker.pickVideo(source: ImageSource.gallery);
  //   if (videoFile != null) {
  //     File file = File.fromUri(Uri(path: videoFile.path));
  //     Video video = Video(url: file.path, id: DateTime.now().toIso8601String());
  //     onGetVideo(video);
  //   }
  // }

  // /* get audio */
  // Future getAudioFromDevice(BuildContext context,
  //     {required void Function(List<PlatformFile>) onGetAudio,
  //     bool allowMultiple = false}) async {
  //   FilePickerResult? result = await FilePicker.platform
  //       .pickFiles(type: FileType.audio, allowMultiple: allowMultiple);
  //   if (result != null) {
  //     onGetAudio(result.files);
  //   }
  // }

  // /*Functions to get files */

  // /* get documents */
  // getDocuments(BuildContext context,
  //     {required void Function(List<PlatformFile>) onGetFiles,
  //     bool allowMultiple = false}) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowMultiple: allowMultiple,
  //     allowedExtensions: ['xls', 'pdf', 'doc', 'ppt'],
  //   );
  //   if (result != null) {
  //     var documents = result.files;
  //     /*List<PrivateDocumentER> documents = [];
  //     for (PlatformFile file in result.files) {
  //       documents.add(PrivateDocumentER(
  //           id: DateTime.now().toIso8601String(),
  //           url: file.path ?? "",
  //           bytes: file.bytes,
  //           title: file.name,
  //           size: file.size.toString()));*/
  //     onGetFiles(documents);
  //   }
  // }

  // /* other functions */
  // /* get files */
  // getImagesOrVideos(BuildContext context,
  //     {required void Function(List<dynamic>) onGetImagesOrVideos,
  //     int? maxFiles,
  //     bool allowMultiple = true}) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowMultiple: allowMultiple,
  //     allowedExtensions: ['jpeg', 'jpg', 'png', 'mov', 'mpeg4', 'mp4'],
  //   );
  //   if (result != null) {
  //     List<dynamic> files = [];

  //     for (PlatformFile file in result.files) {
  //       if (maxFiles != null && maxFiles <= files.length) {
  //         onGetImagesOrVideos(files);
  //         return;
  //       }
  //       if (file.extension == 'jpeg' ||
  //           file.extension == 'jpg' ||
  //           file.extension == 'png') {
  //         files.add(Photo(
  //             id: DateTime.now().toIso8601String(), url: file.path ?? ""));
  //       } else {
  //         files.add(Video(
  //             id: DateTime.now().toIso8601String(), url: file.path ?? ""));
  //       }
  //     }
  //     onGetImagesOrVideos(files);
  //   }
  // }

  // ImageProvider getImageProvider(String? image,
  //     {bool useDefaultAsset = false,
  //     bool useFileImage = true,
  //     File? file,
  //     String assetDefault = "assets/icon.png"}) {
  //   return ((image != "" && image != null) && !useDefaultAsset
  //       ? StringsUtils().isValidUrl(image)
  //           ? NetworkImage(image)
  //           : (useFileImage
  //               ? FileImage(file ?? File(image))
  //               : AssetImage(assetDefault))
  //       : AssetImage(assetDefault)) as ImageProvider;
  // }

  Widget getImageWidget(String? image,
      {bool useDefaultAsset = false,
      bool useFileImage = true,
      double? height,
      double? width,
      BoxFit? fit,
      Color? color,
      FilterQuality filterQuality = FilterQuality.medium,
      Widget Function(BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress)?
          loadingBuilder,
      String assetDefault = "assets/icon.png"}) {
    final Widget defaultImage = Image.asset(assetDefault,
        height: height, width: width, fit: fit, filterQuality: filterQuality);

    return (image != "" && image != null) && !useDefaultAsset
        ? StringsUtils().isValidUrl(image)
            ? CachedNetworkImage(
                imageUrl: image,
                height: height,
                width: width,
                fit: fit,
                color: color,
                filterQuality: filterQuality,
                placeholder: (context, url) =>
                    LoadingIndicator(color: AppTheme.colors.white),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : (useFileImage
                ? Image.file(
                    File(image),
                    height: height,
                    width: width,
                    fit: fit,
                    filterQuality: filterQuality,
                  )
                : Image.asset(image,
                    height: height,
                    width: width,
                    fit: fit,
                    color: color,
                    filterQuality: filterQuality))
        : defaultImage;
  }

  // // Profile photo/avatar
  // static ImageProvider getImage(String? picture) {
  //   if (picture == null) {
  //     return const AssetImage('assets/images/avatarDefault.png');
  //   }

  //   if (picture.startsWith('http')) {
  //     return NetworkImage(picture);
  //   }
  //   return FileImage(File(picture));
  // }

  /*static setAvatarImage(ImageSource source, EditProfileCubit cubit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      File file = File.fromUri(Uri(path: image.path));
      //cubit.updateAvatar(file);
    }
  }*/

  /*static setBannerImage(ImageSource source, EditProfileCubit cubit) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      File file = File.fromUri(Uri(path: image.path));
      //cubit.updateBanner(file);
    }
  }*/
}

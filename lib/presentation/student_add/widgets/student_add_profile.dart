import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/application/student_add/profile_image_provider.dart';

class StudentAddProfile extends StatelessWidget {
  const StudentAddProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async =>
          await Provider.of<ProfileImageProvider>(context, listen: false)
              .pickImage(),
      child: Consumer<ProfileImageProvider>(
        builder: (context, value, _) {
          final image = value.image;
          return Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(189, 117, 117, 117)),
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(100),
              image: (image != null)
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: kIsWeb
                          ? MemoryImage(base64Decode(image))
                          : FileImage(
                              File(image),
                            ),
                    )
                  : null,
            ),
            child: image == null
                ? const Center(
                    child: Text('No image selected'),
                  )
                : null,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../alertdialog_adaptive.dart';
import '../../text_field_adaptive.dart';

class CameraPage extends StatelessWidget {

  QRViewController controller;
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;

    double fabSize = 90;
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return FutureBuilder(
      future: requestPermission(Permission.camera),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text("Something went wrong."));
        }else if(snapshot.hasData) {
          if(snapshot.data == true) {
            return QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea)
            );
          }else {
            return Center(child: Text("Please allow the Camera permission to scan QR Code."));
          }
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

    //Main list content
    // return Container(
    //   alignment: Alignment.bottomCenter,
    //   color: Colors.black,
    //   padding: EdgeInsets.only(bottom: 32),
    //   // Create a floating action button (FAB), with a circle inside of it
    //   // To size a FAB, nest it in a Container, wrapped in a SizedBox
    //   child: Container(
    //     width: fabSize,
    //     height: fabSize,
    //     child: SizedBox(
    //       child: FloatingActionButton(
    //         onPressed: () {},
    //         //Create circle inside our FAB
    //         child: Container(
    //           margin: EdgeInsets.all(8),
    //           decoration: BoxDecoration(
    //             color: Colors.white30,
    //             shape: BoxShape.circle,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      AlertDialogAdaptive(
        title: "Referral Code",
        content: TextFieldAdaptive(
          placeHolder: "Enter code",
        ),
        buttons: [
          {
            "text": "Done",
            "action": () async {
              Navigator.pop(context);
            }
          },
        ],
      ).show(context);
    });
  }

}

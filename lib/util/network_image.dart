import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

// ignore: must_be_immutable
class CashNetworkImage extends StatelessWidget {
  CashNetworkImage(this.url, {super.key});
  String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
       
      borderRadius: BorderRadius.circular(15),
      child: FittedBox(
        child: CachedNetworkImage(
          placeholder: (context, url) {
            return Container(
              color: Colors.grey,
              child: Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
          imageUrl: url,
          errorWidget: (context, url, error) {
            return Container(
              child: Center(
                child: Text("خطایی رخ داد است"),
              ),
            );
          },
        ),
      ),
    );
  }
}

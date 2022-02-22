part of 'pages.dart';

class WebViewPage extends StatefulWidget {
  // const WebViewPage({ Key? key }) : super(key: key);

  final DetailPage detailPage;

  const WebViewPage({this.detailPage});
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Location | " + widget.detailPage.name,
            style: whiteTextStyle,
          ),
          backgroundColor: kBlueColor,
        ),
        body: Stack(
          children: [
            Container(
              child: WebView(
                key: _key,
                initialUrl: widget.detailPage.gmaps,
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
            isLoading
                ? Center(
                    child: SpinKitCircle(size: 100, color: kBlueColor),
                  )
                : Stack(),
          ],
        ));
  }
}

// class WebViewPage extends StatelessWidget {
//   // const WebViewPage({ Key? key }) : super(key: key);
//   final DetailPage detailPage;

//   const WebViewPage({this.detailPage});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Book Ticket"),
//       ),
//       body: WebView(
//         initialUrl: ,
//         javascriptMode: JavascriptMode.unrestricted,
//       )
//     );
//   }
// }
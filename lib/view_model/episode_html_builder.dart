class EpisodeHtmlBuilder {
  static String build(String episodeHtml,
      {bool vertically = true, bool isSerif = true}) {
    // final borderOrLeft = vertically ? 'left' : 'border';
    // final topOrRight = vertically ? 'right' : 'top';
    const sansSerif = "'メイリオ', 'Meiryo', sans-serif";
    const serif = "'Noto Serif JP', serif";
    final font = isSerif ? serif : sansSerif;
    return '''
<html lang="ja">

<head>
  <link href="template.css" rel="stylesheet" type="text/css">
  <meta charset="utf-8">
  <title>title</title>
  <style>
    @font-face {
      font-family: $font;
    }
    
    body {
      writing-mode: vertical-rl;
      text-orientation: upright;
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    @page {
      size: A4;
      margin: 0;
    }
    
    #novel {
      font-size: 13mm;
    }
    
    .novel_subtitle {
      font-size: 1.5em;
      text-align: center;
      margin: 0 1em;
    }
    
    p {
      line-height: 1.8em;
      color: black;
      font-family: "Noto", serif;
      margin: 0;
      padding: 0;
    }
    
    #novel_p {
      margin: 0;
      padding: 0;
      border-left: 3px double;
      padding-left: 15px;
      border-right: 3px double;
      padding-right: 15px;
    }
    
    #novel_a {
      margin: 0;
      padding: 0;
      border-right: 3px double;
      padding-right: 15px;
    }
  </style>
</head>

<body>
  <div id="novel">
    $episodeHtml
  </div>
</body>

</html>
''';
//     return '''
// <html>
//     <head>
//         <meta charset="UTF-8">
//         <meta name="viewport" content="width=device-width, initial-scale=1">
//         <style>
//             body {
//                 background: black;
//             }
//             #novel_color {
//                 color: #FFFFFF;
//                 font-size: 16px;
//                 padding: 15px;
//                 font-family: "メイリオ", "Meiryo", "Lucida Grande", "sans-serif";
//                 ${vertically ? 'writing-mode: vertical-rl;' : ''}
//                 overflow-y: scroll;
//
//             }
//             .novel_title, .novel_subtitle {
//                 font-size: 170%;
//                 line-height: 150%;
//             }
//             #novel_p {
//                 border-$borderOrLeft: 3px double #FFFFFF;
//                 padding-$borderOrLeft: 15px;
//                 border-$topOrRight: 3px double #FFFFFF;
//                 padding-$topOrRight: 15px;
//             }
//             #novel_p, #novel_honbun, #novel_a {
//                 line-height: 28.8px;
//                 font-size: 16px;
//             }
//             #novel_a {
//                 border-$topOrRight: 3px double #FFFFFF;
//                 padding-$topOrRight: 15px;
//             }
//         </style>
//         <script type="text/javascript">
//             function scrolled() {
//                 var novelColor = document.getElementById('novel_color')[0];
//                 document.documentElement.scrollLeft = document.documentElement.scrollWidth - document.documentElement.clientWidth
//             }
//         </script>
//     </head>
//     <body onLoad="scrolled()">
//         $episodeHtml
//     </body>
// </html>
// ''';
  }
}

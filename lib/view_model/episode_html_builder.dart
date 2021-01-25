class EpisodeHtmlBuilder {
  static String build(String episodeHtml,
      {bool vertically = true, bool isSerif = true}) {
    // final borderOrLeft = vertically ? 'left' : 'border';
    // final topOrRight = vertically ? 'right' : 'top';
    const sansSerif = "'Noto Serif JP', serif";
    const serif = "'メイリオ', 'Meiryo', sans-serif";
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
    
    html {
      margin: 0;
    }
    
    body {
      margin: 0;
    }
    
    #novel {
      writing-mode: vertical-rl;
      text-orientation: upright;
      
      inline-size: 100vh;
      block-size: 100vw;
      /* text-combine-upright: digits 2; */
  
      display: flex;
      flex-direction: column;
      flex-wrap: wrap;
      font-size: 2vh;
      color: black;
    }
    
    .novel_subtitle {
      font-size: 1.5em;
      text-align: center;
    }
    
    #novel_p {
        border-left: 3px double;
        padding-left: 15px;
        border-right: 3px double;
        padding-right: 15px;
    }
    
    #novel_a {
        border-right: 3px double;
        padding-right: 15px;
    }
    
    p {
      display: block;
      margin: 0;
      inline-size: 95vh;
      padding-inline: 2.5vh;
      padding-block: 1em;
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

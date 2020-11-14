class EpisodeHtmlBuilder {
  static String build(String episodeHtml, bool vertically) {
    final borderOrLeft = vertically ? 'left' : 'border';
    final topOrRight = vertically ? 'right' : 'top';
    return '''
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                background: black;
            }
            #novel_color {
                color: #FFFFFF;
                font-size: 16px;
                padding: 15px;
                font-family: "メイリオ", "Meiryo", "Lucida Grande", "sans-serif";
                ${vertically ? 'writing-mode: vertical-rl;' : ''}
                overflow-y: scroll;
                
            }
            .novel_title, .novel_subtitle {
                font-size: 170%;
                line-height: 150%;
            }
            #novel_p {
                border-$borderOrLeft: 3px double #FFFFFF;
                padding-$borderOrLeft: 15px;
                border-$topOrRight: 3px double #FFFFFF;
                padding-$topOrRight: 15px;
            }
            #novel_p, #novel_honbun, #novel_a {
                line-height: 28.8px;
                font-size: 16px;
            }
            #novel_a {
                border-$topOrRight: 3px double #FFFFFF;
                padding-$topOrRight: 15px;
            }
        </style>
        <script type="text/javascript">
            function scrolled() {
                var novelColor = document.getElementById('novel_color')[0];
                document.documentElement.scrollLeft = document.documentElement.scrollWidth - document.documentElement.clientWidth
            }
        </script>
    </head>
    <body onLoad="scrolled()">
        $episodeHtml
    </body>
</html>
''';
  }
}

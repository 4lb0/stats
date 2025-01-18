//
// You can use this object to create your own templates
//
// @see https://bialet.dev

class Template {

  static layout(title, content, meta) { <!doctype html>
    <html>
      <head>
        <title>{{ title }}</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/css/styles.css" />
        {{ meta.map { |m| '<meta name="%( m['key'] )" content="%( m['value'] )">' } }}
      </head>
      <body>
        {{ content }}
        <script src="/js/app.js"></script>
      </body>
    </html> }

  static layout(title, content) { layout(title, content, {}) }
}

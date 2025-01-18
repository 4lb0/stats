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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/blouse.css@2.0.8/dist/balloon.css" />
        {{ meta.map { |m| '<meta name="%( m['key'] )" content="%( m['value'] )">' } }}
      </head>
      <body>
        {{ content }}
      </body>
    </html> }

  static url(url) { <!doctype html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta http-equiv="refresh" content="2; url={{ url }}">
      </head>
      <body style="text-align: center; font: 16pt system-ui">
        <p>
          ¡Muchas gracias!
          estas siendo redireccionado a
          <a href="{{ url }}">{{ url }}</a>
        </p>
      </body>
    </html> }

  static home(stats) {
    var TITLE = "Stats"
    var html = <main>
      <h1 class="text-center">{{ TITLE }}</h1>
      <table>
        <thead>
          <tr>
            <th>URL</th>
            <th>Clicks</th>
          </tr>
        </thead>
        <tbody>
          {{ stats.map { |stats| <tr>
              <td><a href="{{ stats['key'] }}">{{ stats['key'] }}</a></td>
              <td>{{ stats['counter'] }}</td>
            </tr> } }}
        </tbody>
    </main>
    return layout(TITLE, html)
  }


  static layout(title, content) { layout(title, content, {}) }
}

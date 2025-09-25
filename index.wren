import "_app/template" for Template
import "_app/domain" for Stats

if (Request.isPost) {
  if (Request.post("email") != "") {
    return Response.out(<p>Gracias bot</p>)
  }
  var url = Request.post("url")
  Stats.increase(url)
  return Response.out(Template.url(url))
}

Response.out(Template.home(Stats.all()))

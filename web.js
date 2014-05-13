// Create a HTTP server on port 8080

var http = require("http")
    url = require("url"),
    path = require("path"),
    fs = require("fs"),
    util = require("util");

var port = 8080;

http.createServer(function (request, response) {
  var uri = url.parse(request.url).pathname,
      filename = path.join(process.cwd(), uri);

  util.log(util.format("%s %s", request.method, uri));

  fs.exists(filename, function(exists) {
    if (!exists) {
      response.writeHead(404, { "Content-Type": "text/plain" });
      response.write("404 Not Found\n");
      response.end();
      return;
    }

    if (fs.statSync(filename).isDirectory()) {
      filename += "/index.html";
    }

    fs.readFile(filename, "binary", function(err, file) {
      if (err) {
        response.writeHead(500, { "Content-Type": "text/plain" });
        response.write(err + "\n");
        response.end();
        return;
      }

      response.writeHead(200);
      response.write(file, "binary");
      response.end();
    });
  });
}).listen(port);

// console info message
console.log("Server running at http://localhost:" + port + "\nCtrl+C to shutdown\n");

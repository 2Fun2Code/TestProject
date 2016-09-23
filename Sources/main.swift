import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// Create HTTP server.
let server = HTTPServer()

// Register your own routes and handlers
var routes = Routes()

func wildcardHandler(request: HTTPRequest, _ response: HTTPResponse){
    response.appendBody(string: "Error 400")
    response.completed()
}

routes.add(method: .get, uri: "/", handler: {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
    response.completed()
    }
)

routes.add(method: .get, uri: "**", handler: wildcardHandler)

//let personJsonString = "{\"name\": \"Henrik\", \"birthDate\":\"20160912\"}"
//let person = Person(JSONString: personJsonString)
//print(person!.toJSONString(prettyPrint: true)!)




// Add the routes to the server.
server.addRoutes(routes)

// Set a listen port of 8181
server.serverPort = 8181

do {
    // Launch the HTTP server.
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}

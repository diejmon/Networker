@testable import Networker
import XCTest

class PluginTests: XCTestCase {
  func testInjectHeaderPlugin() {
    let headerName = "API_VERSION"
    let headerValue = "1.0"

    let dispatcher = MockDispatcher(finalRequestHandler: { urlRequest in
      XCTAssertEqual(urlRequest.value(forHTTPHeaderField: headerName), headerValue)
    })

    dispatcher.add(InjectHeaderPlugin(headerField: headerName, value: headerValue))

    dispatcher.dispatch(Request<String, EmptyDecoder>(baseUrl: .anyUrl,
                                                      path: "/api",
                                                      urlParams: nil,
                                                      httpMethod: .get,
                                                      body: nil,
                                                      headers: nil,
                                                      timeout: 60,
                                                      cachePolicy: .useProtocolCachePolicy),
                        completionQueue: .global()) { _ in
    }
  }
}
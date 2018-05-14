//
//  YamlTests.swift
//  Templates UnitTests
//
//  Created by David Jennes on 14/05/2018.
//  Copyright © 2018 AliSoftware. All rights reserved.
//

import StencilSwiftKit
import XCTest

class YamlTests: XCTestCase {
  enum Contexts {
    static let all = ["empty", "all"]
  }

  // generate variations to test customname generation
  let variations: VariationGenerator = { name, context in
    guard name == "all" else { return [(context: context, suffix: "")] }

    return [
      (context: context,
       suffix: ""),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["enumName=CustomYAML"]),
       suffix: "-customname"),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["publicAccess"]),
       suffix: "-publicAccess")
    ]
  }

  func testInlineSwift3() {
    test(template: "inline-swift3",
         contextNames: Contexts.all,
         directory: .yaml,
         contextVariations: variations)
  }

  func testInlineSwift4() {
    test(template: "inline-swift4",
         contextNames: Contexts.all,
         directory: .yaml,
         contextVariations: variations)
  }
}

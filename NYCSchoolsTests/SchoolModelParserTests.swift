//
//  SchoolModelParserTests.swift
//  NYCSchoolsTests
//
//  Created by MANOJ VEMRA on 8/11/22.
//

import Foundation
@testable import NYCSchools
import XCTest

class SchoolModelParserTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSchoolModelParser() {
        let expectation = XCTestExpectation(description: "SchoolModelParser should succeed")
        let bundle = Bundle(for: type(of: NYCSchoolsTests().self))
        let fileUrl = bundle.path(forResource: "schoolsList", ofType: "json") ?? ""
        let fileData = (try? Data(contentsOf: URL(fileURLWithPath: fileUrl))) ?? Data()
        let schoolModels = try? JSONDecoder().decode([SchoolModel]?.self,
                                                     from: fileData)
        if let dbn = schoolModels?.first?.dbn,
           !dbn.isEmpty {
            print("Success")
            expectation.fulfill()
        } else {
            XCTFail("Failure")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
    }
}

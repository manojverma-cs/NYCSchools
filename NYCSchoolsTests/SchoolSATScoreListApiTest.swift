//
//  SchoolSATScoreListApiTest.swift
//  NYCSchoolsTests
//
//  Created by MANOJ VERMA on 8/11/22.
//

import Foundation
@testable import NYCSchools
import XCTest

class SchoolSATScoreListApiTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSchoolSATScoreListApi() {
        let expectation = XCTestExpectation(description: "SchoolSATScoreListApi should succeed")
        let sessionManager = SessionManager.shared
        sessionManager.getSchoolsList { schools in
            if schools.isEmpty {
                XCTFail("Failure")
                expectation.fulfill()
            } else {
                sessionManager.getSchoolSATScoreList(for: schools) { schools in
                    if schools.isEmpty {
                        XCTFail("Failure")
                        expectation.fulfill()
                    } else {
                        print("Success")
                        expectation.fulfill()
                    }
                } _: { _ in
                    XCTFail("Failure")
                    expectation.fulfill()
                }
            }
        } _: { _ in
            XCTFail("Failure")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
    }
}

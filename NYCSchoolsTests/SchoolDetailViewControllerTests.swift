//
//  SchoolDetailViewControllerTests.swift
//  NYCSchoolsUITests
//
//  Created by MANOJ VERMA on 8/11/22.
//

import Foundation
@testable import NYCSchools
import XCTest

class SchoolDetailViewControllerTests: XCTestCase {

    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: SessionManager.self))

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSchoolDetailViewControllerInit() {
        let expectation = XCTestExpectation(description: "testSchoolDetailViewControllerInit should succeed")
        let sessionManager = SessionManager.shared
        sessionManager.getSchoolsList { schools in
            if schools.isEmpty {
                XCTFail("Failure")
                expectation.fulfill()
            } else {
                DispatchQueue.main.async {
                    if let viewController = self.storyboard
                        .instantiateViewController(withIdentifier: "SchoolDetailViewController")
                        as? SchoolDetailViewController {
                        viewController.view.backgroundColor = .white
                        viewController.dataSource = schools.first
                        if let text = viewController.numOfSatTestTakersLabel.text,
                           !text.isEmpty {
                            print("Success")
                            expectation.fulfill()
                        } else {
                            XCTFail("Failure")
                            expectation.fulfill()
                        }
                    } else {
                        XCTFail("Failure")
                        expectation.fulfill()
                    }
                }
            }
        } _: { _ in
            XCTFail("Failure")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
    }
}

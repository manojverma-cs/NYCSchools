//
//  SchoolListViewControllerTests.swift
//  NYCSchoolsUITests
//
//  Created by MANOJ VERMA on 8/11/22.
//

import Foundation
@testable import NYCSchools
import XCTest

class SchoolListViewControllerTests: XCTestCase {

    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: SessionManager.self))

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSchoolListViewControllerInit() {
        let expectation = XCTestExpectation(description: "testSchoolListViewControllerInit should succeed")
        if let viewController = self.storyboard
            .instantiateViewController(withIdentifier: "SchoolListViewController")
            as? SchoolListViewController {
            viewController.view.backgroundColor = .white
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                if viewController.tableView.numberOfRows(inSection: 0) > 0 {
                    print("Success")
                    expectation.fulfill()
                } else {
                    XCTFail("Failure")
                    expectation.fulfill()
                }
            }
        } else {
            XCTFail("Failure")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
    }

    func testSchoolListViewControllerSearch() {
        let expectation = XCTestExpectation(description: "testSchoolListViewControllerSearch should succeed")
        if let viewController = self.storyboard
            .instantiateViewController(withIdentifier: "SchoolListViewController")
            as? SchoolListViewController {
            viewController.view.backgroundColor = .white
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                if viewController.tableView.numberOfRows(inSection: 0) > 0 {
                    viewController.searchBar(viewController.searchBar,
                                             textDidChange: viewController.dataSource.first?.schoolName ?? "")
                    if viewController.tableView.numberOfRows(inSection: 0) > 0 {
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
        } else {
            XCTFail("Failure")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 20.0)
    }
}

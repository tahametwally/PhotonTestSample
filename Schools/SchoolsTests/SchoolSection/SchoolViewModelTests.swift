//
//  SchoolsTests.swift
//  SchoolsTests
//
//  Created by Taha Metwally on 16/2/2024.
//
// Unitet Test
//Integration Test
import XCTest
@testable import Schools
import Foundation
import Combine

final class SchoolViewModelTests: XCTestCase {
    var cancellabel = Set<AnyCancellable>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func getSchoolLists()  {
       var schoolModel =  SchoolViewModel()
        let expect = expectation(description: "results")
        schoolModel.$list.dropFirst().sink{
            XCTAssertTrue($0.isEmpty)
            expect.fulfill()
        }.store(in: &cancellabel)
        wait(for: [expect],timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  WeatherServiceTests.swift
//  WeatherServiceTests
//
//  Created by Tarek El Ghoul on 27/07/2022.
//

import XCTest
@testable import WeatherService

class WeatherServiceTests: XCTestCase {
    
    override func setUp() {
        WeatherService.initialize(withAppId: "c242ebb29379467369e6903ca9d5d832")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_currentWeather_forGeoCoordinate() {
        var result: WeatherData?
        var caughtError: Error?
        let ex = expectation(description: "We should have weather data of location that we have passed")

        WeatherService.instance.currentWeather(coord: (latitude: 10.58212, longitude: 38.0579958)) { weatherData, error in
    
            result = weatherData
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

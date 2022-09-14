//
//  PulgarTests.swift
//  PulgarTests
//
//  Created by iOS Developer on 9/14/22.
//

import XCTest
import Combine
@testable import Pulgar

class MockCreateDiary: SiteDiaryUseCase {
    func save(siteDiary: SiteDiary) -> AnyPublisher<SiteDiary, Error> {
        return Just(SiteDiary.init(photos: [], comments: "", date: "", area: "", category: "", tag: "", event: ""))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

class PulgarTests: XCTestCase {

    var viewModel: CreateDiaryViewModel!
    var mockCreateDiary: MockCreateDiary!
    private var cancellableSet: Set<AnyCancellable> = []
   
    override func setUp() async throws {
        mockCreateDiary = MockCreateDiary()
        viewModel = .init(createSiteDiaryUseCase: mockCreateDiary)
    }
    
    func testSaveData() {
        let expectation = self.expectation(description: "Call Success Dialog with Proper message")
        viewModel.$message.dropFirst().sink { _ in }
        receiveValue: { value in
            XCTAssertEqual(value, Constants.alertSaved)
            expectation.fulfill()
        }.store(in: &cancellableSet)

        viewModel.createSiteDiary()
               
        wait(for: [expectation], timeout: 10)
    }
}

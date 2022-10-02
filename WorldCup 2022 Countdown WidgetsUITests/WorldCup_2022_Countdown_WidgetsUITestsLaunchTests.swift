//
//  WorldCup_2022_Countdown_WidgetsUITestsLaunchTests.swift
//  WorldCup 2022 Countdown WidgetsUITests
//
//  Created by Pankaj Gaikar on 02/10/22.
//

import XCTest

final class WorldCup_2022_Countdown_WidgetsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

//
// Copyright 2018 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest

class StringAdditionsTest: SignalBaseTest {
    func test_truncated_ASCII() {
        let originalString = "Hello World"

        var truncatedString = originalString.truncated(toByteCount: 8)
        XCTAssertEqual("Hello Wo", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 0)
        XCTAssertEqual("", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 11)
        XCTAssertEqual("Hello World", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 12)
        XCTAssertEqual("Hello World", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 100)
        XCTAssertEqual("Hello World", truncatedString)
    }

    func test_truncated_MultiByte() {
        let originalString = "π¨π¦π¨π¦π¨π¦π¨π¦"

        var truncatedString = originalString.truncated(toByteCount: 0)
        XCTAssertEqual("", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 1)
        XCTAssertEqual("", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 7)
        XCTAssertEqual("", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 8)
        XCTAssertEqual("π¨π¦", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 9)
        XCTAssertEqual("π¨π¦", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 15)
        XCTAssertEqual("π¨π¦", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 16)
        XCTAssertEqual("π¨π¦π¨π¦", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 17)
        XCTAssertEqual("π¨π¦π¨π¦", truncatedString)
    }

    func test_truncated_Mixed() {
        let originalString = "Ohπ¨π¦Canadaπ¨π¦"

        var truncatedString = originalString.truncated(toByteCount: 0)
        XCTAssertEqual("", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 1)
        XCTAssertEqual("O", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 7)
        XCTAssertEqual("Oh", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 9)
        XCTAssertEqual("Oh", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 10)
        XCTAssertEqual("Ohπ¨π¦", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 11)
        XCTAssertEqual("Ohπ¨π¦C", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 23)
        XCTAssertEqual("Ohπ¨π¦Canada", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 24)
        XCTAssertEqual("Ohπ¨π¦Canadaπ¨π¦", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 25)
        XCTAssertEqual("Ohπ¨π¦Canadaπ¨π¦", truncatedString)

        truncatedString = originalString.truncated(toByteCount: 100)
        XCTAssertEqual("Ohπ¨π¦Canadaπ¨π¦", truncatedString)
    }
}

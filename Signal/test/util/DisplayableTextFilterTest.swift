//
// Copyright 2017 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
@testable import Signal
@testable import SignalMessaging

class DisplayableTextTest: SignalBaseTest {
    func testDisplayableText() {
        // show plain text
        let boringText = "boring text"
        XCTAssertEqual(boringText, boringText.filterStringForDisplay())

        // show high byte emojis
        let emojiText = "πΉπΉπΌπΉπΉπΌπΉπΉaπ©πΏββ€οΈβπβπ©π»b"
        XCTAssertEqual(emojiText, emojiText.filterStringForDisplay())

        // show normal diacritic usage
        let diacriticalText = "PΕΓ­liΕ‘ ΕΎluΕ₯ouΔkΓ½ kΕ―Ε ΓΊpΔl ΔΓ‘belskΓ© Γ³dy."
        XCTAssertEqual(diacriticalText, diacriticalText.filterStringForDisplay())

        // filter excessive diacritics
        XCTAssertEqual("οΏ½abοΏ½οΏ½π©πΏββ€οΈβπβπ©π»cοΏ½", "xΜΈΜΝΜΜΜΏΝΜΜΜ½ΝΝΝΜΏΜΝΜΜΜ’ΝΝΜΜ§Μ³ΜΜ°abxΜΈΜΝΜΜΜΏΝΜΜΜ½ΝΝΝΜΏΜΝΜΜΜ’ΝΝΜΜ§Μ³ΜΜ°xΜΈΜΝΜΜΜΏΝΜΜΜ½ΝΝΝΜΏΜΝΜΜΜ’ΝΝΜΜ§Μ³ΜΜ°π©πΏββ€οΈβπβπ©π»cxΜΈΜΝΜΜΜΏΝΜΜΜ½ΝΝΝΜΏΜΝΜΜΜ’ΝΝΜΜ§Μ³ΜΜ°".filterStringForDisplay() )
    }

    func testGlyphCount() {
        // Plain text
        XCTAssertEqual("boring text".glyphCount, 11)

        // Emojis
        XCTAssertEqual("πΉπΉπΌπΉπΉπΌπΉπΉ".glyphCount, 5)
        XCTAssertEqual("πΉπΉ".glyphCount, 1)
        XCTAssertEqual("πΉπΉ ".glyphCount, 2)
        XCTAssertEqual("ππ½ππΎππΏ".glyphCount, 3)
        XCTAssertEqual("π".glyphCount, 1)
        XCTAssertEqual("π©π½".glyphCount, 1)
        XCTAssertEqual("πΎπππππππ".glyphCount, 8)
        XCTAssertEqual("π΅πππ".glyphCount, 4)
        XCTAssertEqual("β€οΈππππππππππππππ".glyphCount, 15)
        XCTAssertEqual("βπΏπͺπΏππΏππΏππΏππΏ".glyphCount, 6)
        XCTAssertEqual("πΎπππππππ§".glyphCount, 8)
        XCTAssertEqual("0οΈβ£1οΈβ£2οΈβ£3οΈβ£4οΈβ£5οΈβ£6οΈβ£7οΈβ£8οΈβ£9οΈβ£π".glyphCount, 11)
        XCTAssertEqual("πΊπΈπ·πΊπ¦π«π¦π²".glyphCount, 4)
        XCTAssertEqual("πΊπΈπ·πΊπΈ π¦π«π¦π²πΈ".glyphCount, 7)
        XCTAssertEqual("πΊπΈπ·πΊπΈπ¦π«π¦π²".glyphCount, 5)
        XCTAssertEqual("πΊπΈπ·πΊπΈπ¦".glyphCount, 3)
        XCTAssertEqual("οΌοΌοΌ".glyphCount, 3)

        // Normal diacritic usage
        XCTAssertEqual("PΕΓ­liΕ‘ ΕΎluΕ₯ouΔkΓ½ kΕ―Ε ΓΊpΔl ΔΓ‘belskΓ© Γ³dy.".glyphCount, 39)

        // Excessive diacritics

        XCTAssertEqual("H?Μ§ΝΝ ΜΈAΝ’ΝVΜΜIΜ΄ΜΈNΝΜΝG?ΝΜ΅ΝΝ’ Μ§Μ§ΝTΜΝΜΆΝ‘RΜ¨ΜΈΝΜ΅Μ’OΜ‘Μ·UΝ‘?BΝ’ΜΆΜΝLΝ’ΜΈΝΜΈΝEΝΜΈ ΜΝΜΈΝRΝEΝ ΝΝAΝΜΈDΜΝΜ§ΝIΝΜ΅?ΝΝNΜ‘Μ·Μ’Ν GΝΝ Μ΄ ΝΝTΝΜ’Ν‘ΝEΝΝXΜ?Μ’ΝTΝ Μ’?ΜΝΝΜ’Ν’".glyphCount, 28)

        XCTAssertEqual("LΜ·ΝΜ³ΝΜ²GΜ§Μ΅ΝΝΜ?Μ―Μ€Μ©ΜΝΜ¬ΜΝΜΉΜΜΉΝΝΜ?Μ¦Μ°Μ£OΝΜΆΜ΄Ν‘Μ?Μ»Μ?Μ!Μ΄Μ·ΜΝΝ".glyphCount, 4)
    }

    func testContainsOnlyEmoji() {
        // Plain text
        XCTAssertFalse("boring text".containsOnlyEmoji)

        // Emojis
        XCTAssertTrue("πΉπΉπΌπΉπΉπΌπΉπΉ".containsOnlyEmoji)
        XCTAssertTrue("πΉπΉ".containsOnlyEmoji)
        XCTAssertFalse("πΉπΉ ".containsOnlyEmoji)
        XCTAssertTrue("ππ½ππΎππΏ".containsOnlyEmoji)
        XCTAssertTrue("π".containsOnlyEmoji)
        XCTAssertTrue("π©π½".containsOnlyEmoji)
        XCTAssertTrue("πΎπππππππ".containsOnlyEmoji)
        XCTAssertTrue("π΅πππ".containsOnlyEmoji)
        XCTAssertTrue("β€οΈππππππππππππππ".containsOnlyEmoji)
        XCTAssertTrue("βπΏπͺπΏππΏππΏππΏππΏ".containsOnlyEmoji)
        XCTAssertTrue("πΎπππππππ§".containsOnlyEmoji)
        XCTAssertFalse("0οΈβ£1οΈβ£2οΈβ£3οΈβ£4οΈβ£5οΈβ£6οΈβ£7οΈβ£8οΈβ£9οΈβ£π".containsOnlyEmoji)
        XCTAssertTrue("πΊπΈπ·πΊπ¦π«π¦π²".containsOnlyEmoji)
        XCTAssertFalse("πΊπΈπ·πΊπΈ π¦π«π¦π²πΈ".containsOnlyEmoji)
        XCTAssertTrue("πΊπΈπ·πΊπΈπ¦π«π¦π²".containsOnlyEmoji)
        XCTAssertTrue("πΊπΈπ·πΊπΈπ¦".containsOnlyEmoji)
        // Unicode standard doesn't consider these to be Emoji.
        XCTAssertFalse("οΌοΌοΌ".containsOnlyEmoji)

        // Normal diacritic usage
        XCTAssertFalse("PΕΓ­liΕ‘ ΕΎluΕ₯ouΔkΓ½ kΕ―Ε ΓΊpΔl ΔΓ‘belskΓ© Γ³dy.".containsOnlyEmoji)

        // Excessive diacritics
        XCTAssertFalse("H?Μ§ΝΝ ΜΈAΝ’ΝVΜΜIΜ΄ΜΈNΝΜΝG?ΝΜ΅ΝΝ’ Μ§Μ§ΝTΜΝΜΆΝ‘RΜ¨ΜΈΝΜ΅Μ’OΜ‘Μ·UΝ‘?BΝ’ΜΆΜΝLΝ’ΜΈΝΜΈΝEΝΜΈ ΜΝΜΈΝRΝEΝ ΝΝAΝΜΈDΜΝΜ§ΝIΝΜ΅?ΝΝNΜ‘Μ·Μ’Ν GΝΝ Μ΄ ΝΝTΝΜ’Ν‘ΝEΝΝXΜ?Μ’ΝTΝ Μ’?ΜΝΝΜ’Ν’".containsOnlyEmoji)
        XCTAssertFalse("LΜ·ΝΜ³ΝΜ²GΜ§Μ΅ΝΝΜ?Μ―Μ€Μ©ΜΝΜ¬ΜΝΜΉΜΜΉΝΝΜ?Μ¦Μ°Μ£OΝΜΆΜ΄Ν‘Μ?Μ»Μ?Μ!Μ΄Μ·ΜΝΝ".containsOnlyEmoji)
    }

    func testJumbomojiCount() {
        let testCases: [(String, UInt)] = [
            ("", 0),
            ("ππ½", 1),
            ("β€οΈππππ", 5),
            ("β€οΈππππβ€οΈ", 0),
            ("β€οΈππππβ€οΈπ", 0),
            ("β€οΈA", 0),
            ("Aπ", 0),
            ("β€οΈAπ", 0),
            ("AπB", 0),
            ("β€οΈ π", 0),
            ("β€οΈ ", 0),
            ("Signal", 0),
            ("Signal Messenger", 0),
            ("Noise", 0)
        ]
        for (textValue, expectedCount) in testCases {
            let displayableText: DisplayableText = .displayableTextForTests(textValue)
            XCTAssertEqual(displayableText.jumbomojiCount, expectedCount, "textValue: \(textValue)")
        }
    }

    func test_shouldAllowLinkification() {
        func assertLinkifies(_ text: String, file: StaticString = #file, line: UInt = #line) {
            let displayableText = DisplayableText.displayableTextForTests(text)
            XCTAssert(displayableText.shouldAllowLinkification, "was not linkifiable text: \(text)", file: file, line: line)
        }

        func assertNotLinkifies(_ text: String, file: StaticString = #file, line: UInt = #line) {
            let displayableText = DisplayableText.displayableTextForTests(text)
            XCTAssertFalse(displayableText.shouldAllowLinkification, "was linkifiable text: \(text)", file: file, line: line)
        }

        // some basic happy paths
        assertLinkifies("foo google.com")
        assertLinkifies("google.com/foo")
        assertLinkifies("blah google.com/foo")
        assertLinkifies("foo http://google.com")
        assertLinkifies("foo https://google.com")

        // cyrillic host with ascii tld
        assertNotLinkifies("foo http://asΔΈ.com")
        assertNotLinkifies("http://asΔΈ.com")
        assertNotLinkifies("asΔΈ.com")
        assertLinkifies("Https://ask.com")
        assertLinkifies("HTTP://ask.com")
        assertLinkifies("HttPs://ask.com")

        // Mixed latin and cyrillic text, but it's not a link
        // (nothing to linkify, but there's nothing illegal here)
        assertLinkifies("asΔΈ")

        // Cyrillic host with cyrillic TLD
        assertLinkifies("http://ΠΊΡ.ΡΡ")
        assertLinkifies("https://ΠΊΡ.ΡΡ")
        assertLinkifies("ΠΊΡ.ΡΡ")
        assertLinkifies("https://ΠΊΡ.ΡΡ/foo")
        assertLinkifies("https://ΠΊΡ.ΡΡ/ΠΊΡ")
        assertLinkifies("https://ΠΊΡ.ΡΡ/ΠΊΡfoo")

        // ascii text outside of the link, with cyrillic host + cyrillic domain
        assertLinkifies("some text: ΠΊΡ.ΡΡ")

        // Mixed ascii/cyrillic text outside of the link, with cyrillic host + cyrillic domain
        assertLinkifies("asΔΈ ΠΊΡ.ΡΡ")

        assertLinkifies("google.com")
        assertLinkifies("foo.google.com")
        assertLinkifies("https://foo.google.com")
        assertLinkifies("https://foo.google.com/some/path.html")

        assertNotLinkifies("asΔΈ.com")
        assertNotLinkifies("https://ΠΊΡ.cΡm")
        assertNotLinkifies("https://google.cΡm")
        assertNotLinkifies("Https://google.cΡm")

        assertLinkifies("ΠΊΡ.ΡΡ")
        assertLinkifies("ΠΊΡ.ΡΡ/some/path")
        assertLinkifies("https://ΠΊΡ.ΡΡ/some/path")
        assertNotLinkifies("http://foo.ΠΊΡ.ΡΡ")

        // Forbidden bidi characters anywhere in the string
        assertNotLinkifies("hello \u{202C} https://google.com")
        assertNotLinkifies("hello \u{202D} https://google.com")
        assertNotLinkifies("hello \u{202E} https://google.com")
        assertNotLinkifies("hello https://google.com \u{202C} goodbye")
        assertNotLinkifies("hello https://google.com \u{202D} goodbye")
        assertNotLinkifies("hello https://google.com \u{202E} goodbye")

        // Forbidden box drawing characters anywhere in the string
        assertNotLinkifies("hello β https://google.com")
        assertNotLinkifies("hello β https://google.com")
        assertNotLinkifies("hello β· https://google.com")
        assertNotLinkifies("hello https://google.com β goodbye")
        assertNotLinkifies("hello https://google.com β goodbye")
        assertNotLinkifies("hello https://google.com β· goodbye")
    }
}

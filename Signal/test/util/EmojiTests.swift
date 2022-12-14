//
// Copyright 2021 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
@testable import Signal
@testable import SignalServiceKit

class EmojiTests: SignalBaseTest {
    func testSimpleEmojiCases() {
        XCTAssertFalse("".isSingleEmojiUsingEmojiWithSkinTones)
        XCTAssertTrue("๐".isSingleEmojiUsingEmojiWithSkinTones)
        XCTAssertFalse("๐๐".isSingleEmojiUsingEmojiWithSkinTones)
        XCTAssertFalse("a".isSingleEmojiUsingEmojiWithSkinTones)
        XCTAssertFalse(" ๐".isSingleEmojiUsingEmojiWithSkinTones)
        XCTAssertFalse("๐ ".isSingleEmojiUsingEmojiWithSkinTones)
        XCTAssertTrue("๐จโ๐ฉโ๐งโ๐ฆ".isSingleEmojiUsingEmojiWithSkinTones)
        XCTAssertTrue("๐จ๐ฟโ๐คโ๐จ๐ป".isSingleEmojiUsingEmojiWithSkinTones)

        XCTAssertFalse("".isSingleEmoji)
        XCTAssertTrue("๐".isSingleEmoji)
        XCTAssertFalse("๐๐".isSingleEmoji)
        XCTAssertFalse("a".isSingleEmoji)
        XCTAssertFalse(" ๐".isSingleEmoji)
        XCTAssertFalse("๐ ".isSingleEmoji)
        XCTAssertTrue("๐จโ๐ฉโ๐งโ๐ฆ".isSingleEmoji)
        XCTAssertTrue("๐จ๐ฟโ๐คโ๐จ๐ป".isSingleEmoji)
    }

    func testEmojiCounts() {
        XCTAssertEqual("".glyphCount, 0)
        XCTAssertEqual("๐".glyphCount, 1)
        XCTAssertEqual("๐๐".glyphCount, 2)
        XCTAssertEqual("a".glyphCount, 1)
        XCTAssertEqual(" ๐".glyphCount, 2)
        XCTAssertEqual("๐ ".glyphCount, 2)
        XCTAssertEqual("๐จโ๐ฉโ๐งโ๐ฆ".glyphCount, 1)
        // CoreText considers this two glyphs,
        // but glyphCount now uses String.count.
        XCTAssertEqual("๐จ๐ฟโ๐คโ๐จ๐ป".glyphCount, 1)

        XCTAssertEqual("".count, 0)
        XCTAssertEqual("๐".count, 1)
        XCTAssertEqual("๐๐".count, 2)
        XCTAssertEqual("a".count, 1)
        XCTAssertEqual(" ๐".count, 2)
        XCTAssertEqual("๐ ".count, 2)
        XCTAssertEqual("๐จโ๐ฉโ๐งโ๐ฆ".count, 1)
        XCTAssertEqual("๐จ๐ฟโ๐คโ๐จ๐ป".count, 1)
    }

    func testFancyEmojiCases() {
        do {
            // Valid emoji with skin tones.
            let fancyEmoji = EmojiWithSkinTones(baseEmoji: .manWithGuaPiMao, skinTones: [.mediumDark]).rawValue
            XCTAssertTrue(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Invalid emoji with skin tones.
            let fancyEmoji = EmojiWithSkinTones(baseEmoji: .blueberries, skinTones: [.mediumDark]).rawValue
            XCTAssertTrue(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Black Diamond Suit Emoji
            let fancyEmoji = "\u{2666}" // โฆ
            // EmojiWithSkinTones doesn't recognize this as an emoji...
            XCTAssertFalse(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            // But isSingleEmoji does...
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Black Diamond Suit Emoji
            // Adding 'Variation Selector-16':
            let fancyEmoji = "\u{2666}\u{FE0F}" // โฆ๏ธ
            XCTAssertTrue(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Thumbs up sign:
            let fancyEmoji = "\u{1F44D}" // ๐
            XCTAssertTrue(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Thumbs up sign:
            // Adding 'Emoji Modifier Fitzpatrick Type-4':
            let fancyEmoji = "\u{1F44D}\u{1F3FD}" // ๐๐ฝ
            XCTAssertTrue(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Man, Woman, Girl, Boy
            let fancyEmoji = "\u{1F468}\u{1F469}\u{1F467}\u{1F466}" // ๐จ๐ฉ๐ง๐ฆ
            XCTAssertFalse(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertFalse(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 4)
        }

        do {
            // Man, Woman, Girl, Boy
            // Adding 'Zero Width Joiner' between each
            let fancyEmoji = "\u{1F468}\u{200D}\u{1F469}\u{200D}\u{1F467}\u{200D}\u{1F466}" // ๐จโ๐ฉโ๐งโ๐ฆ
            XCTAssertTrue(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // This emoji has two skin tones.
            // CoreText considers this two glyphs.
            let fancyEmoji = "๐จ๐ฟโ๐คโ๐จ๐ป"
            XCTAssertTrue(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            let fancyEmoji = "๐ณ"
            // EmojiWithSkinTones doesn't recognize this as an emoji...
            XCTAssertFalse(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            // But isSingleEmoji does...
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            let fancyEmoji = "๐๏ธ"
            // EmojiWithSkinTones doesn't recognize this as an emoji...
            XCTAssertFalse(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            // But isSingleEmoji does...
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Not an emoji.
            let fancyEmoji = "a"
            XCTAssertFalse(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertFalse(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Empty string.
            let fancyEmoji = ""
            XCTAssertFalse(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertFalse(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 0)
        }

        do {
            // Not an emoji; just a isolated modifier.
            // 'Emoji Modifier Fitzpatrick Type-4':
            let fancyEmoji = "\u{1F3FD}"
            // But this is considered an emoji by all measures.
            XCTAssertTrue(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }

        do {
            // Not an emoji; just a isolated modifier.
            // 'Variation Selector-16':
            let fancyEmoji = "\u{FE0F}"
            // EmojiWithSkinTones doesn't recognize this as an emoji...
            XCTAssertFalse(fancyEmoji.isSingleEmojiUsingEmojiWithSkinTones)
            // But isSingleEmoji does...
            XCTAssertTrue(fancyEmoji.isSingleEmoji)
            XCTAssertEqual(fancyEmoji.count, 1)
        }
    }

    func testMoreEmojiCases() {
        let moreEmojis = [
            "๐",
            "๐ฉ๐ฝ",
            "๐จโ๐ฆฐ",
            "๐จ๐ฟโ๐ฆฐ",
            "๐จโ๐ฆฑ",
            "๐จ๐ฟโ๐ฆฑ",
            "๐ฆน๐ฟโโ๏ธ",
            "๐พ",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐ต",
            "๐",
            "๐",
            "๐",
            "โค๏ธ",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "โ๐ฟ",
            "๐ช๐ฟ",
            "๐๐ฟ",
            "๐๐ฟ",
            "๐๐ฟ",
            "๐๐ฟ",
            "๐จโ๐ฉโ๐ฆ",
            "๐จโ๐ฉโ๐งโ๐ฆ",
            "๐จโ๐จโ๐ฆ",
            "๐ฉโ๐ฉโ๐ง",
            "๐จโ๐ฆ",
            "๐จโ๐งโ๐ฆ",
            "๐ฉโ๐ฆ",
            "๐ฉโ๐งโ๐ฆ",
            "๐พ",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐",
            "๐ง",
            "0๏ธโฃ",
            "1๏ธโฃ",
            "2๏ธโฃ",
            "3๏ธโฃ",
            "4๏ธโฃ",
            "5๏ธโฃ",
            "6๏ธโฃ",
            "7๏ธโฃ",
            "8๏ธโฃ",
            "9๏ธโฃ",
            "๐",
            "๐ฆ๐ซ",
            "๐ฆ๐ฒ",
            "๐บ๐ธ",
            "๐ท๐บ",
            "๐ธ๐ฆ",
            "๐ธ๐ฆ",
            "๐จ๐ฆ"
        ]
        for emoji in moreEmojis {
            if !emoji.isSingleEmojiUsingEmojiWithSkinTones {
                Logger.warn("!isSingleEmojiUsingEmojiWithSkinTones: '\(emoji)'")
            }
            XCTAssertTrue(emoji.isSingleEmojiUsingEmojiWithSkinTones)

            if !emoji.isSingleEmoji {
                Logger.warn("!isSingleEmoji: '\(emoji)'")
            }
            XCTAssertTrue(emoji.isSingleEmoji)

            if emoji.count != 1 {
                Logger.warn("'\(emoji)': \(emoji.count) != 1")
            }
            XCTAssertEqual(emoji.count, 1)
        }
    }
}

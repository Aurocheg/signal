//
// Copyright 2019 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
import Foundation
import SignalCoreKit
@testable import SignalServiceKit

class StickerManagerTest: SSKBaseTestSwift {

    func testFirstEmoji() {
        XCTAssertNil(StickerManager.firstEmoji(inEmojiString: nil))
        XCTAssertEqual("π¨π¦", StickerManager.firstEmoji(inEmojiString: "π¨π¦"))
        XCTAssertEqual("π¨π¦", StickerManager.firstEmoji(inEmojiString: "π¨π¦π¨π¦"))
        XCTAssertEqual("πΉπΉ", StickerManager.firstEmoji(inEmojiString: "πΉπΉπΌπΉπΉπΌπΉπΉ"))
        XCTAssertEqual("πΌ", StickerManager.firstEmoji(inEmojiString: "πΌπΉπΉπΌπΉπΉ"))
        XCTAssertEqual("ππ½", StickerManager.firstEmoji(inEmojiString: "ππ½ππΎ"))
        XCTAssertEqual("ππΎ", StickerManager.firstEmoji(inEmojiString: "ππΎππ½"))
        XCTAssertEqual("πΎ", StickerManager.firstEmoji(inEmojiString: "πΎπππππππ"))
        XCTAssertEqual("πΎ", StickerManager.firstEmoji(inEmojiString: "πΎπππππππ"))
    }

    func testAllEmoji() {
        XCTAssertEqual([], StickerManager.allEmoji(inEmojiString: nil))
        XCTAssertEqual(["π¨π¦"], StickerManager.allEmoji(inEmojiString: "π¨π¦"))
        XCTAssertEqual(["π¨π¦", "π¨π¦"], StickerManager.allEmoji(inEmojiString: "π¨π¦π¨π¦"))
        XCTAssertEqual(["πΉπΉ", "πΌ", "πΉπΉ", "πΌ", "πΉπΉ"], StickerManager.allEmoji(inEmojiString: "πΉπΉπΌπΉπΉπΌπΉπΉ"))
        XCTAssertEqual(["πΌ", "πΉπΉ", "πΌ", "πΉπΉ"], StickerManager.allEmoji(inEmojiString: "πΌπΉπΉπΌπΉπΉ"))
        XCTAssertEqual(["ππ½", "ππΎ"], StickerManager.allEmoji(inEmojiString: "ππ½ππΎ"))
        XCTAssertEqual(["ππΎ", "ππ½"], StickerManager.allEmoji(inEmojiString: "ππΎππ½"))
        XCTAssertEqual(["πΎ", "π", "π", "π", "π", "π", "π", "π"], StickerManager.allEmoji(inEmojiString: "πΎπππππππ"))

        XCTAssertEqual(["π¨π¦"], StickerManager.allEmoji(inEmojiString: "aπ¨π¦a"))
        XCTAssertEqual(["π¨π¦", "πΉπΉ"], StickerManager.allEmoji(inEmojiString: "aπ¨π¦bπΉπΉc"))
    }

    func testSuggestedStickers_uncached() {
        // The "StickerManager.suggestedStickers" instance method does caching;
        // the class method does not.

        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "Hey Bob, what's up?").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "π¨π¦").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "π¨π¦πΉπΉ").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "This is a flag: π¨π¦").count)

        let stickerInfo = StickerInfo.defaultValue
        let stickerData = Randomness.generateRandomBytes(1)
        let temporaryFile = OWSFileSystem.temporaryFileUrl()
        try! stickerData.write(to: temporaryFile)

        let success = StickerManager.installSticker(stickerInfo: stickerInfo,
                                                    stickerUrl: temporaryFile,
                                                    contentType: OWSMimeTypeImageWebp,
                                                    emojiString: "πΌπ¨π¦")
        XCTAssertTrue(success)

        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "Hey Bob, what's up?").count)
        // The sticker should only be suggested if user enters a single emoji
        // (and nothing else) that is associated with the sticker.
        XCTAssertEqual(1, StickerManager.suggestedStickers(forTextInput: "π¨π¦").count)
        XCTAssertEqual(1, StickerManager.suggestedStickers(forTextInput: "πΌ").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "πΉπΉ").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "aπ¨π¦").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "π¨π¦a").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "π¨π¦πΉπΉ").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "πΌπ¨π¦").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "This is a flag: π¨π¦").count)

        databaseStorage.write { (transaction) in
            // Don't bother calling completion.
            StickerManager.uninstallSticker(stickerInfo: stickerInfo,
                                            transaction: transaction)
        }

        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "Hey Bob, what's up?").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "π¨π¦").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "π¨π¦πΉπΉ").count)
        XCTAssertEqual(0, StickerManager.suggestedStickers(forTextInput: "This is a flag: π¨π¦").count)
    }

    func testSuggestedStickers_cached() {
        // The "StickerManager.suggestedStickers" instance method does caching;
        // the class method does not.
        let stickerManager = StickerManager.shared

        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "Hey Bob, what's up?").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "π¨π¦").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "π¨π¦πΉπΉ").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "This is a flag: π¨π¦").count)

        let stickerInfo = StickerInfo.defaultValue
        let stickerData = Randomness.generateRandomBytes(1)
        let temporaryFile = OWSFileSystem.temporaryFileUrl()
        try! stickerData.write(to: temporaryFile)

        let success = StickerManager.installSticker(stickerInfo: stickerInfo,
                                                    stickerUrl: temporaryFile,
                                                    contentType: OWSMimeTypeImageWebp,
                                                    emojiString: "πΌπ¨π¦")
        XCTAssertTrue(success)

        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "Hey Bob, what's up?").count)
        // The sticker should only be suggested if user enters a single emoji
        // (and nothing else) that is associated with the sticker.
        XCTAssertEqual(1, stickerManager.suggestedStickers(forTextInput: "π¨π¦").count)
        XCTAssertEqual(1, stickerManager.suggestedStickers(forTextInput: "πΌ").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "πΉπΉ").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "aπ¨π¦").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "π¨π¦a").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "π¨π¦πΉπΉ").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "πΌπ¨π¦").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "This is a flag: π¨π¦").count)

        databaseStorage.write { (transaction) in
            // Don't bother calling completion.
            StickerManager.uninstallSticker(stickerInfo: stickerInfo,
                                            transaction: transaction)
        }

        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "Hey Bob, what's up?").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "π¨π¦").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "π¨π¦πΉπΉ").count)
        XCTAssertEqual(0, stickerManager.suggestedStickers(forTextInput: "This is a flag: π¨π¦").count)
    }

    func testInfos() {
        let packId = Randomness.generateRandomBytes(16)
        let packKey = Randomness.generateRandomBytes(Int32(StickerManager.packKeyLength))
        let stickerId: UInt32 = 0

        XCTAssertEqual(StickerPackInfo(packId: packId, packKey: packKey),
                       StickerPackInfo(packId: packId, packKey: packKey))
        XCTAssertTrue(StickerPackInfo(packId: packId, packKey: packKey) == StickerPackInfo(packId: packId, packKey: packKey))

        XCTAssertEqual(StickerInfo(packId: packId, packKey: packKey, stickerId: stickerId),
                       StickerInfo(packId: packId, packKey: packKey, stickerId: stickerId))
        XCTAssertTrue(StickerInfo(packId: packId, packKey: packKey, stickerId: stickerId) == StickerInfo(packId: packId, packKey: packKey, stickerId: stickerId))
    }

    func testDecryption() {
        // From the Zozo the French Bulldog sticker pack
        let packKey = Data([
            0x17, 0xe9, 0x71, 0xc1, 0x34, 0x03, 0x56, 0x22,
            0x78, 0x1d, 0x2e, 0xe2, 0x49, 0xe6, 0x47, 0x3b,
            0x77, 0x45, 0x83, 0x75, 0x0b, 0x68, 0xc1, 0x1b,
            0xb8, 0x2b, 0x75, 0x09, 0xc6, 0x8b, 0x6d, 0xfd
        ])

        let bundle = Bundle(for: StickerManagerTest.self)
        let encryptedStickerURL = bundle.url(forResource: "sample-sticker", withExtension: "encrypted")!

        let decryptedStickerURL = bundle.url(forResource: "sample-sticker", withExtension: "webp")!
        let decryptedStickerData = try! Data(contentsOf: decryptedStickerURL)

        let outputUrl = try! StickerManager.decrypt(at: encryptedStickerURL, packKey: packKey)
        let outputData = try! Data(contentsOf: outputUrl)
        XCTAssertEqual(outputData, decryptedStickerData)
    }
}

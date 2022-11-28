//
// Copyright 2022 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import GRDB
import SignalCoreKit

// NOTE: This file is generated by /Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - Typed Convenience Methods

@objc
public extension OWSIncomingContactSyncJobRecord {
    // NOTE: This method will fail if the object has unexpected type.
    class func anyFetchIncomingContactSyncJobRecord(
        uniqueId: String,
        transaction: SDSAnyReadTransaction
    ) -> OWSIncomingContactSyncJobRecord? {
        assert(!uniqueId.isEmpty)

        guard let object = anyFetch(uniqueId: uniqueId,
                                    transaction: transaction) else {
                                        return nil
        }
        guard let instance = object as? OWSIncomingContactSyncJobRecord else {
            owsFailDebug("Object has unexpected type: \(type(of: object))")
            return nil
        }
        return instance
    }

    // NOTE: This method will fail if the object has unexpected type.
    func anyUpdateIncomingContactSyncJobRecord(transaction: SDSAnyWriteTransaction, block: (OWSIncomingContactSyncJobRecord) -> Void) {
        anyUpdate(transaction: transaction) { (object) in
            guard let instance = object as? OWSIncomingContactSyncJobRecord else {
                owsFailDebug("Object has unexpected type: \(type(of: object))")
                return
            }
            block(instance)
        }
    }
}

// MARK: - SDSSerializer

// The SDSSerializer protocol specifies how to insert and update the
// row that corresponds to this model.
class OWSIncomingContactSyncJobRecordSerializer: SDSSerializer {

    private let model: OWSIncomingContactSyncJobRecord
    public required init(model: OWSIncomingContactSyncJobRecord) {
        self.model = model
    }

    // MARK: - Record

    func asRecord() throws -> SDSRecord {
        let id: Int64? = model.sortId > 0 ? Int64(model.sortId) : model.grdbId?.int64Value

        let recordType: SDSRecordType = .incomingContactSyncJobRecord
        let uniqueId: String = model.uniqueId

        // Properties
        let failureCount: UInt = model.failureCount
        let label: String = model.label
        let status: SSKJobRecordStatus = model.status
        let attachmentIdMap: Data? = nil
        let contactThreadId: String? = nil
        let envelopeData: Data? = nil
        let invisibleMessage: Data? = nil
        let messageId: String? = nil
        let removeMessageAfterSending: Bool? = nil
        let threadId: String? = nil
        let attachmentId: String? = model.attachmentId
        let isMediaMessage: Bool? = nil
        let serverDeliveryTimestamp: UInt64? = nil
        let exclusiveProcessIdentifier: String? = model.exclusiveProcessIdentifier
        let isHighPriority: Bool? = nil
        let receiptCredentailRequest: Data? = nil
        let receiptCredentailRequestContext: Data? = nil
        let priorSubscriptionLevel: UInt? = nil
        let subscriberID: Data? = nil
        let targetSubscriptionLevel: UInt? = nil
        let boostPaymentIntentID: String? = nil
        let isBoost: Bool? = nil
        let receiptCredentialPresentation: Data? = nil
        let amount: Data? = nil
        let currencyCode: String? = nil
        let unsavedMessagesToSend: Data? = nil
        let messageText: String? = nil
        let paymentIntentClientSecret: String? = nil
        let paymentMethodId: String? = nil
        let replacementAdminUuid: String? = nil
        let waitForMessageProcessing: Bool? = nil
        let isCompleteContactSync: Bool? = model.isCompleteContactSync

        return JobRecordRecord(delegate: model, id: id, recordType: recordType, uniqueId: uniqueId, failureCount: failureCount, label: label, status: status, attachmentIdMap: attachmentIdMap, contactThreadId: contactThreadId, envelopeData: envelopeData, invisibleMessage: invisibleMessage, messageId: messageId, removeMessageAfterSending: removeMessageAfterSending, threadId: threadId, attachmentId: attachmentId, isMediaMessage: isMediaMessage, serverDeliveryTimestamp: serverDeliveryTimestamp, exclusiveProcessIdentifier: exclusiveProcessIdentifier, isHighPriority: isHighPriority, receiptCredentailRequest: receiptCredentailRequest, receiptCredentailRequestContext: receiptCredentailRequestContext, priorSubscriptionLevel: priorSubscriptionLevel, subscriberID: subscriberID, targetSubscriptionLevel: targetSubscriptionLevel, boostPaymentIntentID: boostPaymentIntentID, isBoost: isBoost, receiptCredentialPresentation: receiptCredentialPresentation, amount: amount, currencyCode: currencyCode, unsavedMessagesToSend: unsavedMessagesToSend, messageText: messageText, paymentIntentClientSecret: paymentIntentClientSecret, paymentMethodId: paymentMethodId, replacementAdminUuid: replacementAdminUuid, waitForMessageProcessing: waitForMessageProcessing, isCompleteContactSync: isCompleteContactSync)
    }
}

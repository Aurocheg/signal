//
// Copyright 2014 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

#import "OWSAnalyticsEvents.h"

NS_ASSUME_NONNULL_BEGIN

@implementation OWSAnalyticsEvents

// The code between these markers is code-generated by:
// SignalServiceKit/Utilities/extract_analytics_event_names.py
#pragma mark - Code Generation Marker

+ (NSString *)accountsErrorRegisterPushTokensFailed
{
    return @"accounts_error_register_push_tokens_failed";
}

+ (NSString *)accountsErrorUnregisterAccountRequestFailed
{
    return @"accounts_error_unregister_account_request_failed";
}

+ (NSString *)accountsErrorVerificationCodeRequestFailed
{
    return @"accounts_error_verification_code_request_failed";
}

+ (NSString *)accountsErrorVerifyAccountRequestFailed
{
    return @"accounts_error_verify_account_request_failed";
}

+ (NSString *)appDelegateErrorFailedToRegisterForRemoteNotifications
{
    return @"app_delegate_error_failed_to_register_for_remote_notifications";
}

+ (NSString *)appLaunch
{
    return @"app_launch";
}

+ (NSString *)appLaunchComplete
{
    return @"app_launch_complete";
}

+ (NSString *)callServiceCallAlreadySet
{
    return @"call_service_call_already_set";
}

+ (NSString *)callServiceCallIdMismatch
{
    return @"call_service_call_id_mismatch";
}

+ (NSString *)callServiceCallMismatch
{
    return @"call_service_call_mismatch";
}

+ (NSString *)callServiceCallMissing
{
    return @"call_service_call_missing";
}

+ (NSString *)callServiceCallUnexpectedlyIdle
{
    return @"call_service_call_unexpectedly_idle";
}

+ (NSString *)callServiceCallViewCouldNotPresent
{
    return @"call_service_call_view_could_not_present";
}

+ (NSString *)callServiceCouldNotCreatePeerConnectionClientPromise
{
    return @"call_service_could_not_create_peer_connection_client_promise";
}

+ (NSString *)callServiceCouldNotCreateReadyToSendIceUpdatesPromise
{
    return @"call_service_could_not_create_ready_to_send_ice_updates_promise";
}

+ (NSString *)callServiceErrorHandleLocalAddedIceCandidate
{
    return @"call_service_error_handle_local_added_ice_candidate";
}

+ (NSString *)callServiceErrorHandleLocalHungupCall
{
    return @"call_service_error_handle_local_hungup_call";
}

+ (NSString *)callServiceErrorHandleReceivedErrorExternal
{
    return @"call_service_error_handle_received_error_external";
}

+ (NSString *)callServiceErrorHandleReceivedErrorInternal
{
    return @"call_service_error_handle_received_error_internal";
}

+ (NSString *)callServiceErrorHandleRemoteAddedIceCandidate
{
    return @"call_service_error_handle_remote_added_ice_candidate";
}

+ (NSString *)callServiceErrorIncomingConnectionFailedExternal
{
    return @"call_service_error_incoming_connection_failed_external";
}

+ (NSString *)callServiceErrorIncomingConnectionFailedInternal
{
    return @"call_service_error_incoming_connection_failed_internal";
}

+ (NSString *)callServiceErrorOutgoingConnectionFailedExternal
{
    return @"call_service_error_outgoing_connection_failed_external";
}

+ (NSString *)callServiceErrorOutgoingConnectionFailedInternal
{
    return @"call_service_error_outgoing_connection_failed_internal";
}

+ (NSString *)callServiceErrorTimeoutWhileConnectingIncoming
{
    return @"call_service_error_timeout_while_connecting_incoming";
}

+ (NSString *)callServiceErrorTimeoutWhileConnectingOutgoing
{
    return @"call_service_error_timeout_while_connecting_outgoing";
}

+ (NSString *)callServiceMissingFulfillReadyToSendIceUpdatesPromise
{
    return @"call_service_missing_fulfill_ready_to_send_ice_updates_promise";
}

+ (NSString *)callServicePeerConnectionAlreadySet
{
    return @"call_service_peer_connection_already_set";
}

+ (NSString *)callServicePeerConnectionMissing
{
    return @"call_service_peer_connection_missing";
}

+ (NSString *)callServiceCallDataMissing
{
    return @"call_service_call_data_missing";
}

+ (NSString *)contactsErrorContactsIntersectionFailed
{
    return @"contacts_error_contacts_intersection_failed";
}

+ (NSString *)errorAttachmentRequestFailed
{
    return @"error_attachment_request_failed";
}

+ (NSString *)errorCouldNotPresentViewDueToCall
{
    return @"error_could_not_present_view_due_to_call";
}

+ (NSString *)errorEnableVideoCallingRequestFailed
{
    return @"error_enable_video_calling_request_failed";
}

+ (NSString *)errorGetDevicesFailed
{
    return @"error_get_devices_failed";
}

+ (NSString *)errorPrekeysAvailablePrekeysRequestFailed
{
    return @"error_prekeys_available_prekeys_request_failed";
}

+ (NSString *)errorPrekeysCurrentSignedPrekeyRequestFailed
{
    return @"error_prekeys_current_signed_prekey_request_failed";
}

+ (NSString *)errorPrekeysUpdateFailedJustSigned
{
    return @"error_prekeys_update_failed_just_signed";
}

+ (NSString *)errorPrekeysUpdateFailedSignedAndOnetime
{
    return @"error_prekeys_update_failed_signed_and_onetime";
}

+ (NSString *)errorProvisioningCodeRequestFailed
{
    return @"error_provisioning_code_request_failed";
}

+ (NSString *)errorProvisioningRequestFailed
{
    return @"error_provisioning_request_failed";
}

+ (NSString *)errorUnlinkDeviceFailed
{
    return @"error_unlink_device_failed";
}

+ (NSString *)errorUpdateAttributesRequestFailed
{
    return @"error_update_attributes_request_failed";
}

+ (NSString *)messageSenderErrorMissingNewPreKeyBundle
{
    return @"messageSenderErrorMissingNewPreKeyBundle";
}

+ (NSString *)messageManagerErrorCallMessageNoActionablePayload
{
    return @"message_manager_error_call_message_no_actionable_payload";
}

+ (NSString *)messageManagerErrorCorruptMessage
{
    return @"message_manager_error_corrupt_message";
}

+ (NSString *)messageManagerErrorCouldNotHandlePrekeyBundle
{
    return @"message_manager_error_could_not_handle_prekey_bundle";
}

+ (NSString *)messageManagerErrorCouldNotHandleUnidentifiedSenderMessage
{
    return @"message_manager_error_could_not_handle_unidentified_sender_message";
}

+ (NSString *)messageManagerErrorCouldNotHandleSecureMessage
{
    return @"message_manager_error_could_not_handle_secure_message";
}

+ (NSString *)messageManagerErrorEnvelopeNoActionablePayload
{
    return @"message_manager_error_envelope_no_actionable_payload";
}

+ (NSString *)messageManagerErrorEnvelopeTypeKeyExchange
{
    return @"message_manager_error_envelope_type_key_exchange";
}

+ (NSString *)messageManagerErrorEnvelopeTypeOther
{
    return @"message_manager_error_envelope_type_other";
}

+ (NSString *)messageManagerErrorEnvelopeTypeUnknown
{
    return @"message_manager_error_envelope_type_unknown";
}

+ (NSString *)messageManagerErrorInvalidKey
{
    return @"message_manager_error_invalid_key";
}

+ (NSString *)messageManagerErrorInvalidKeyId
{
    return @"message_manager_error_invalid_key_id";
}

+ (NSString *)messageManagerErrorInvalidMessageVersion
{
    return @"message_manager_error_invalid_message_version";
}

+ (NSString *)messageManagerErrorInvalidProtocolMessage
{
    return @"message_manager_error_invalid_protocol_message";
}

+ (NSString *)messageManagerErrorMessageEnvelopeHasNoContent
{
    return @"message_manager_error_message_envelope_has_no_content";
}

+ (NSString *)messageManagerErrorNoSession
{
    return @"message_manager_error_no_session";
}

+ (NSString *)messageManagerErrorOversizeMessage
{
    return @"message_manager_error_oversize_message";
}

+ (NSString *)messageManagerErrorSyncMessageFromUnknownSource
{
    return @"message_manager_error_sync_message_from_unknown_source";
}

+ (NSString *)messageManagerErrorUntrustedIdentityKeyException
{
    return @"message_manager_error_untrusted_identity_key_exception";
}

+ (NSString *)messageReceiverErrorLargeMessage
{
    return @"message_receiver_error_large_message";
}

+ (NSString *)messageReceiverErrorOversizeMessage
{
    return @"message_receiver_error_oversize_message";
}

+ (NSString *)messageSendErrorFailedDueToPrekeyUpdateFailures
{
    return @"message_send_error_failed_due_to_prekey_update_failures";
}

+ (NSString *)messageSendErrorFailedDueToUntrustedKey
{
    return @"message_send_error_failed_due_to_untrusted_key";
}

+ (NSString *)messageSenderErrorCouldNotFindContacts1
{
    return @"message_sender_error_could_not_find_contacts_1";
}

+ (NSString *)messageSenderErrorCouldNotFindContacts2
{
    return @"message_sender_error_could_not_find_contacts_2";
}

+ (NSString *)messageSenderErrorCouldNotFindContacts3
{
    return @"message_sender_error_could_not_find_contacts_3";
}

+ (NSString *)messageSenderErrorCouldNotLoadAttachment
{
    return @"message_sender_error_could_not_load_attachment";
}

+ (NSString *)messageSenderErrorCouldNotParseMismatchedDevicesJson
{
    return @"message_sender_error_could_not_parse_mismatched_devices_json";
}

+ (NSString *)messageSenderErrorCouldNotWriteAttachment
{
    return @"message_sender_error_could_not_write_attachment";
}

+ (NSString *)messageSenderErrorGenericSendFailure
{
    return @"message_sender_error_generic_send_failure";
}

+ (NSString *)messageSenderErrorInvalidIdentityKeyLength
{
    return @"message_sender_error_invalid_identity_key_length";
}

+ (NSString *)messageSenderErrorInvalidIdentityKeyType
{
    return @"message_sender_error_invalid_identity_key_type";
}

+ (NSString *)messageSenderErrorNoMissingOrExtraDevices
{
    return @"message_sender_error_no_missing_or_extra_devices";
}

+ (NSString *)messageSenderErrorRecipientPrekeyRequestFailed
{
    return @"message_sender_error_recipient_prekey_request_failed";
}

+ (NSString *)messageSenderErrorSendOperationDidNotComplete
{
    return @"message_sender_error_send_operation_did_not_complete";
}

+ (NSString *)messageSenderErrorUnexpectedKeyBundle
{
    return @"message_sender_error_unexpected_key_bundle";
}

+ (NSString *)peerConnectionClientErrorSendDataChannelMessageFailed
{
    return @"peer_connection_client_error_send_data_channel_message_failed";
}

+ (NSString *)prekeysDeletedOldAcceptedSignedPrekey
{
    return @"prekeys_deleted_old_accepted_signed_prekey";
}

+ (NSString *)prekeysDeletedOldSignedPrekey
{
    return @"prekeys_deleted_old_signed_prekey";
}

+ (NSString *)prekeysDeletedOldUnacceptedSignedPrekey
{
    return @"prekeys_deleted_old_unaccepted_signed_prekey";
}

+ (NSString *)profileManagerErrorAvatarUploadFormInvalidAcl
{
    return @"profile_manager_error_avatar_upload_form_invalid_acl";
}

+ (NSString *)profileManagerErrorAvatarUploadFormInvalidAlgorithm
{
    return @"profile_manager_error_avatar_upload_form_invalid_algorithm";
}

+ (NSString *)profileManagerErrorAvatarUploadFormInvalidCredential
{
    return @"profile_manager_error_avatar_upload_form_invalid_credential";
}

+ (NSString *)profileManagerErrorAvatarUploadFormInvalidDate
{
    return @"profile_manager_error_avatar_upload_form_invalid_date";
}

+ (NSString *)profileManagerErrorAvatarUploadFormInvalidKey
{
    return @"profile_manager_error_avatar_upload_form_invalid_key";
}

+ (NSString *)profileManagerErrorAvatarUploadFormInvalidPolicy
{
    return @"profile_manager_error_avatar_upload_form_invalid_policy";
}

+ (NSString *)profileManagerErrorAvatarUploadFormInvalidResponse
{
    return @"profile_manager_error_avatar_upload_form_invalid_response";
}

+ (NSString *)profileManagerErrorAvatarUploadFormInvalidSignature
{
    return @"profile_manager_error_avatar_upload_form_invalid_signature";
}

+ (NSString *)registrationBegan
{
    return @"registration_began";
}

+ (NSString *)registrationRegisteredPhoneNumber
{
    return @"registration_registered_phone_number";
}

+ (NSString *)registrationRegisteringCode
{
    return @"registration_registering_code";
}

+ (NSString *)registrationRegisteringRequestedNewCodeBySms
{
    return @"registration_registering_requested_new_code_by_sms";
}

+ (NSString *)registrationRegisteringRequestedNewCodeByVoice
{
    return @"registration_registering_requested_new_code_by_voice";
}

+ (NSString *)registrationRegisteringSubmittedCode
{
    return @"registration_registering_submitted_code";
}

+ (NSString *)registrationRegistrationFailed
{
    return @"registration_registration_failed";
}

+ (NSString *)registrationVerificationBack
{
    return @"registration_verification_back";
}

+ (NSString *)storageErrorCouldNotDecodeClass
{
    return @"storage_error_could_not_decode_class";
}

+ (NSString *)storageErrorCouldNotLoadDatabase
{
    return @"storage_error_could_not_load_database";
}

+ (NSString *)storageErrorCouldNotLoadDatabaseSecondAttempt
{
    return @"storage_error_could_not_load_database_second_attempt";
}

+ (NSString *)storageErrorCouldNotStoreKeychainValue
{
    return @"storage_error_could_not_store_keychain_value";
}

+ (NSString *)storageErrorDeserialization
{
    return @"storage_error_deserialization";
}

+ (NSString *)storageErrorFileProtection
{
    return @"storage_error_file_protection";
}

#pragma mark - Code Generation Marker

@end

NS_ASSUME_NONNULL_END

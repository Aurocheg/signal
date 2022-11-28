// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: consensus_common.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) 2018-2022 The MobileCoin Foundation

// Consensus service data types used by both client-facing and peer-facing APIs.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

//// Result of ProposeTx call that cannot be represented by a built-in GRPC error code.
public enum ConsensusCommon_ProposeTxResult: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case ok // = 0
  case inputsProofsLengthMismatch // = 10
  case noInputs // = 11
  case tooManyInputs // = 12
  case insufficientInputSignatures // = 13
  case invalidInputSignature // = 14
  case invalidTransactionSignature // = 15
  case invalidRangeProof // = 16
  case insufficientRingSize // = 17
  case tombstoneBlockExceeded // = 18
  case tombstoneBlockTooFar // = 19
  case noOutputs // = 20
  case tooManyOutputs // = 21
  case excessiveRingSize // = 22
  case duplicateRingElements // = 23
  case unsortedRingElements // = 24
  case unequalRingSizes // = 25
  case unsortedKeyImages // = 26
  case containsSpentKeyImage // = 27
  case duplicateKeyImages // = 28
  case duplicateOutputPublicKey // = 29
  case containsExistingOutputPublicKey // = 30
  case missingTxOutMembershipProof // = 31
  case invalidTxOutMembershipProof // = 32
  case invalidRistrettoPublicKey // = 33
  case invalidLedgerContext // = 34
  case ledger // = 35
  case membershipProofValidationError // = 36
  case txFeeError // = 37
  case keyError // = 38
  case unsortedInputs // = 39
  case missingMemo // = 40
  case memosNotAllowed // = 41
  case tokenNotYetConfigured // = 42
  case missingMaskedTokenID // = 43
  case maskedTokenIDNotAllowed // = 44
  case unsortedOutputs // = 45
  case UNRECOGNIZED(Int)

  public init() {
    self = .ok
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .ok
    case 10: self = .inputsProofsLengthMismatch
    case 11: self = .noInputs
    case 12: self = .tooManyInputs
    case 13: self = .insufficientInputSignatures
    case 14: self = .invalidInputSignature
    case 15: self = .invalidTransactionSignature
    case 16: self = .invalidRangeProof
    case 17: self = .insufficientRingSize
    case 18: self = .tombstoneBlockExceeded
    case 19: self = .tombstoneBlockTooFar
    case 20: self = .noOutputs
    case 21: self = .tooManyOutputs
    case 22: self = .excessiveRingSize
    case 23: self = .duplicateRingElements
    case 24: self = .unsortedRingElements
    case 25: self = .unequalRingSizes
    case 26: self = .unsortedKeyImages
    case 27: self = .containsSpentKeyImage
    case 28: self = .duplicateKeyImages
    case 29: self = .duplicateOutputPublicKey
    case 30: self = .containsExistingOutputPublicKey
    case 31: self = .missingTxOutMembershipProof
    case 32: self = .invalidTxOutMembershipProof
    case 33: self = .invalidRistrettoPublicKey
    case 34: self = .invalidLedgerContext
    case 35: self = .ledger
    case 36: self = .membershipProofValidationError
    case 37: self = .txFeeError
    case 38: self = .keyError
    case 39: self = .unsortedInputs
    case 40: self = .missingMemo
    case 41: self = .memosNotAllowed
    case 42: self = .tokenNotYetConfigured
    case 43: self = .missingMaskedTokenID
    case 44: self = .maskedTokenIDNotAllowed
    case 45: self = .unsortedOutputs
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .ok: return 0
    case .inputsProofsLengthMismatch: return 10
    case .noInputs: return 11
    case .tooManyInputs: return 12
    case .insufficientInputSignatures: return 13
    case .invalidInputSignature: return 14
    case .invalidTransactionSignature: return 15
    case .invalidRangeProof: return 16
    case .insufficientRingSize: return 17
    case .tombstoneBlockExceeded: return 18
    case .tombstoneBlockTooFar: return 19
    case .noOutputs: return 20
    case .tooManyOutputs: return 21
    case .excessiveRingSize: return 22
    case .duplicateRingElements: return 23
    case .unsortedRingElements: return 24
    case .unequalRingSizes: return 25
    case .unsortedKeyImages: return 26
    case .containsSpentKeyImage: return 27
    case .duplicateKeyImages: return 28
    case .duplicateOutputPublicKey: return 29
    case .containsExistingOutputPublicKey: return 30
    case .missingTxOutMembershipProof: return 31
    case .invalidTxOutMembershipProof: return 32
    case .invalidRistrettoPublicKey: return 33
    case .invalidLedgerContext: return 34
    case .ledger: return 35
    case .membershipProofValidationError: return 36
    case .txFeeError: return 37
    case .keyError: return 38
    case .unsortedInputs: return 39
    case .missingMemo: return 40
    case .memosNotAllowed: return 41
    case .tokenNotYetConfigured: return 42
    case .missingMaskedTokenID: return 43
    case .maskedTokenIDNotAllowed: return 44
    case .unsortedOutputs: return 45
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension ConsensusCommon_ProposeTxResult: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [ConsensusCommon_ProposeTxResult] = [
    .ok,
    .inputsProofsLengthMismatch,
    .noInputs,
    .tooManyInputs,
    .insufficientInputSignatures,
    .invalidInputSignature,
    .invalidTransactionSignature,
    .invalidRangeProof,
    .insufficientRingSize,
    .tombstoneBlockExceeded,
    .tombstoneBlockTooFar,
    .noOutputs,
    .tooManyOutputs,
    .excessiveRingSize,
    .duplicateRingElements,
    .unsortedRingElements,
    .unequalRingSizes,
    .unsortedKeyImages,
    .containsSpentKeyImage,
    .duplicateKeyImages,
    .duplicateOutputPublicKey,
    .containsExistingOutputPublicKey,
    .missingTxOutMembershipProof,
    .invalidTxOutMembershipProof,
    .invalidRistrettoPublicKey,
    .invalidLedgerContext,
    .ledger,
    .membershipProofValidationError,
    .txFeeError,
    .keyError,
    .unsortedInputs,
    .missingMemo,
    .memosNotAllowed,
    .tokenNotYetConfigured,
    .missingMaskedTokenID,
    .maskedTokenIDNotAllowed,
    .unsortedOutputs,
  ]
}

#endif  // swift(>=4.2)

/// Response to a `GetLastBlockInfo` call.
public struct ConsensusCommon_LastBlockInfoResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Block index
  public var index: UInt64 = 0

  /// Current MOB minimum fee (kept for backwards compatibility)
  public var mobMinimumFee: UInt64 = 0

  /// A map of token id -> minimum fee
  public var minimumFees: Dictionary<UInt64,UInt64> = [:]

  /// Current network_block version, appropriate for new transactions.
  ///
  /// Note that if the server was just reconfigured, this may be HIGHER than
  /// the highest block version in the ledger, so for clients this is a better
  /// source of truth than the local ledger, if the client might possibly be
  /// creating the first transaction after a reconfigure / redeploy.
  public var networkBlockVersion: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Requests a range [offset, offset+limit) of Blocks.
public struct ConsensusCommon_BlocksRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Index of first block.
  public var offset: UInt64 = 0

  /// Maximum number of blocks.
  public var limit: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Response to a `BlocksRequest`.
public struct ConsensusCommon_BlocksResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var blocks: [Blockchain_Block] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

//// Response from TxPropose RPC call.
public struct ConsensusCommon_ProposeTxResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  //// Result.
  public var result: ConsensusCommon_ProposeTxResult = .ok

  //// The number of blocks in the ledger at the time the request was received.
  public var blockCount: UInt64 = 0

  //// The block version which is in effect right now
  public var blockVersion: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension ConsensusCommon_ProposeTxResult: @unchecked Sendable {}
extension ConsensusCommon_LastBlockInfoResponse: @unchecked Sendable {}
extension ConsensusCommon_BlocksRequest: @unchecked Sendable {}
extension ConsensusCommon_BlocksResponse: @unchecked Sendable {}
extension ConsensusCommon_ProposeTxResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "consensus_common"

extension ConsensusCommon_ProposeTxResult: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "Ok"),
    10: .same(proto: "InputsProofsLengthMismatch"),
    11: .same(proto: "NoInputs"),
    12: .same(proto: "TooManyInputs"),
    13: .same(proto: "InsufficientInputSignatures"),
    14: .same(proto: "InvalidInputSignature"),
    15: .same(proto: "InvalidTransactionSignature"),
    16: .same(proto: "InvalidRangeProof"),
    17: .same(proto: "InsufficientRingSize"),
    18: .same(proto: "TombstoneBlockExceeded"),
    19: .same(proto: "TombstoneBlockTooFar"),
    20: .same(proto: "NoOutputs"),
    21: .same(proto: "TooManyOutputs"),
    22: .same(proto: "ExcessiveRingSize"),
    23: .same(proto: "DuplicateRingElements"),
    24: .same(proto: "UnsortedRingElements"),
    25: .same(proto: "UnequalRingSizes"),
    26: .same(proto: "UnsortedKeyImages"),
    27: .same(proto: "ContainsSpentKeyImage"),
    28: .same(proto: "DuplicateKeyImages"),
    29: .same(proto: "DuplicateOutputPublicKey"),
    30: .same(proto: "ContainsExistingOutputPublicKey"),
    31: .same(proto: "MissingTxOutMembershipProof"),
    32: .same(proto: "InvalidTxOutMembershipProof"),
    33: .same(proto: "InvalidRistrettoPublicKey"),
    34: .same(proto: "InvalidLedgerContext"),
    35: .same(proto: "Ledger"),
    36: .same(proto: "MembershipProofValidationError"),
    37: .same(proto: "TxFeeError"),
    38: .same(proto: "KeyError"),
    39: .same(proto: "UnsortedInputs"),
    40: .same(proto: "MissingMemo"),
    41: .same(proto: "MemosNotAllowed"),
    42: .same(proto: "TokenNotYetConfigured"),
    43: .same(proto: "MissingMaskedTokenId"),
    44: .same(proto: "MaskedTokenIdNotAllowed"),
    45: .same(proto: "UnsortedOutputs"),
  ]
}

extension ConsensusCommon_LastBlockInfoResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".LastBlockInfoResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "index"),
    2: .standard(proto: "mob_minimum_fee"),
    3: .standard(proto: "minimum_fees"),
    4: .standard(proto: "network_block_version"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.index) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.mobMinimumFee) }()
      case 3: try { try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufUInt64,SwiftProtobuf.ProtobufUInt64>.self, value: &self.minimumFees) }()
      case 4: try { try decoder.decodeSingularUInt32Field(value: &self.networkBlockVersion) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.index != 0 {
      try visitor.visitSingularUInt64Field(value: self.index, fieldNumber: 1)
    }
    if self.mobMinimumFee != 0 {
      try visitor.visitSingularUInt64Field(value: self.mobMinimumFee, fieldNumber: 2)
    }
    if !self.minimumFees.isEmpty {
      try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufUInt64,SwiftProtobuf.ProtobufUInt64>.self, value: self.minimumFees, fieldNumber: 3)
    }
    if self.networkBlockVersion != 0 {
      try visitor.visitSingularUInt32Field(value: self.networkBlockVersion, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ConsensusCommon_LastBlockInfoResponse, rhs: ConsensusCommon_LastBlockInfoResponse) -> Bool {
    if lhs.index != rhs.index {return false}
    if lhs.mobMinimumFee != rhs.mobMinimumFee {return false}
    if lhs.minimumFees != rhs.minimumFees {return false}
    if lhs.networkBlockVersion != rhs.networkBlockVersion {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ConsensusCommon_BlocksRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BlocksRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "offset"),
    2: .same(proto: "limit"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.offset) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.limit) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.offset != 0 {
      try visitor.visitSingularUInt64Field(value: self.offset, fieldNumber: 1)
    }
    if self.limit != 0 {
      try visitor.visitSingularUInt32Field(value: self.limit, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ConsensusCommon_BlocksRequest, rhs: ConsensusCommon_BlocksRequest) -> Bool {
    if lhs.offset != rhs.offset {return false}
    if lhs.limit != rhs.limit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ConsensusCommon_BlocksResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BlocksResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "blocks"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.blocks) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.blocks.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.blocks, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ConsensusCommon_BlocksResponse, rhs: ConsensusCommon_BlocksResponse) -> Bool {
    if lhs.blocks != rhs.blocks {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ConsensusCommon_ProposeTxResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ProposeTxResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "result"),
    2: .standard(proto: "block_count"),
    3: .standard(proto: "block_version"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.result) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.blockCount) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.blockVersion) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.result != .ok {
      try visitor.visitSingularEnumField(value: self.result, fieldNumber: 1)
    }
    if self.blockCount != 0 {
      try visitor.visitSingularUInt64Field(value: self.blockCount, fieldNumber: 2)
    }
    if self.blockVersion != 0 {
      try visitor.visitSingularUInt32Field(value: self.blockVersion, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: ConsensusCommon_ProposeTxResponse, rhs: ConsensusCommon_ProposeTxResponse) -> Bool {
    if lhs.result != rhs.result {return false}
    if lhs.blockCount != rhs.blockCount {return false}
    if lhs.blockVersion != rhs.blockVersion {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
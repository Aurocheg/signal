#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MobileCoin-Bridging-Header.h"
#import "TestBridgingHeader.h"

FOUNDATION_EXPORT double MobileCoinVersionNumber;
FOUNDATION_EXPORT const unsigned char MobileCoinVersionString[];


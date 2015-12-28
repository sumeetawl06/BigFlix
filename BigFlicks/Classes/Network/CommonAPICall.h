//
//  CommonAPICall.h
//  BigFlicks
//
//  Created on 28/12/15.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface CommonAPICall : NSObject

+ (void)downloadFileFromURL:(NSString *)urlString;

@end

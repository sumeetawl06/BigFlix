//
//  LoginProxy.h
//  iNutraDirectory
//
//  Created by Mobisoft on 07/11/15.
//  Copyright (c) 2015 Mobisoft. All rights reserved.
//

#import "AbstractProxy.h"

typedef void (^APIProxySuccesBlock)(NSDictionary *response);
typedef void (^APIProxyFailureBlock)(NSDictionary *response);

@interface LoginProxy : AbstractProxy
@property (nonatomic, copy) APIProxySuccesBlock successBlock;
@property (nonatomic, copy) APIProxySuccesBlock failureBlock;

- (void) postAPIWithDictioanry:(NSDictionary *) dict withSuccess:(APIProxySuccesBlock)success withFailure:(APIProxySuccesBlock)failure;

@end

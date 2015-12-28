//
//  LoginProxy.m
//  iNutraDirectory
//
//  Created by Mobisoft on 07/11/15.
//  Copyright (c) 2015 Mobisoft. All rights reserved.
//

#import "LoginProxy.h"

@implementation LoginProxy
//static NSString * const kAPI_URL = @"/api/Account/Login";
static NSString * const kAPI_URL = @"/nutradirectory/api/Account/Login";
static NSString * const kAPI_NAME = @"LoginAPI";

#pragma mark - Initialise -

- (void) postAPIWithDictioanry:(NSDictionary *) dict withSuccess:(APIProxySuccesBlock)success withFailure:(APIProxySuccesBlock)failure {
    
    self.successBlock = success;
    self.failureBlock = failure;
    
    [super postRequestDataWithURL:[NSString stringWithFormat:@"%@",kAPI_URL] andRequestName:kAPI_NAME andPostData:dict];
}


#pragma mark - API Callback Methods -

- (void)successWithRequest:(AFHTTPRequestOperation *)operation
               withRespose:(id)responseObject
           withRequestName:(NSString *)requestName {
    
    DebugLog(@"response: %@", operation.responseString);
    
    if([requestName isEqualToString:kAPI_NAME])
    {
        [self handleSuccessWithResponse:operation.responseString];
    }
}

- (void)failedWithRequest:(AFHTTPRequestOperation *)operation
                witherror:(NSError *)error
          withRequestName:(NSString *)requestName
{
    DebugLog(@"response: %@", operation.responseString);
    
    NSDictionary *returnDictionary = nil;
    
    if(operation.responseString != nil)
    {
        returnDictionary = [self JSONValueReturnsDictionary:operation.responseString];
        
    }else
    {
        NSString *messageString = NSLocalizedString(@"Failed to connect with server", nil);
        returnDictionary = [NSDictionary dictionaryWithObject:messageString forKey:@"message"];
    }
    
    if([requestName isEqualToString:kAPI_NAME])
    {
        [self handleFailureWithResponse:returnDictionary];
    }
}

#pragma mark - Handler -

-(void) handleSuccessWithResponse:(NSString *) responseString
{
    NSDictionary *returnDictionary = [self JSONValueReturnsDictionary:responseString];
    self.successBlock(returnDictionary);
}

-(void) handleFailureWithResponse:(NSDictionary *) returnDictionary
{
    self.failureBlock(returnDictionary);
}


@end

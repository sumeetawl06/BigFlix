

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Macros.h"

#define SESSION_EXPIRE_ERROR_CODE  @"3"

@interface AbstractProxy : NSObject

- (void)getRequestDataWithURL:(NSString *)url andRequestName:(NSString *)requestName;

- (void)postRequestDataWithURL:(NSString *)url andRequestName:(NSString *)requestName 
                   andPostData:(NSDictionary*)postData;

- (void)putRequestDataWithURL:(NSString *)url andRequestName:(NSString *)requestName
                   andPutData:(NSDictionary*)putData;

- (void)deleteRequestDataWithURL:(NSString *)url andRequestName:(NSString *)requestName
                   andDeleteData:(NSDictionary*)deleteData;

- (void)postMultiportRequest:(NSDictionary *)postData WithURL:(NSString *)url andRequestName:(NSString *)requestName;

- (void)uploadImage:(NSDictionary*)postData andRequestName:(NSString *)requestName;

- (void)downloadImage:(NSString*)imagePath;

- (void)successWithRequest:(AFHTTPRequestOperation *)operation
               withRespose:(id)responseObject
           withRequestName:(NSString *)requestName;

- (void)failedWithRequest:(AFHTTPRequestOperation *)operation
                witherror:(NSError *)error
          withRequestName:(NSString *)requestName;


- (void)showAlertForFailedRequest:(AFHTTPRequestOperation *)operation
            witherror:(NSError *)error
      withRequestName:(NSString *)requestName;

- (void)showAlertForSuccessfullRequest:(id)object;

- (void)removeLogoutUserDetails;

- (id)JSONValueReturnsArray:(NSString *)jsonString;

- (id)JSONValueReturnsDictionary:(NSString *)jsonString;

-(NSString *) JSONStringFromObject:(id) dataObject;

- (void)getRequestDataWithURL:(NSString *)url
               andRequestName:(NSString *)requestName
                andParameters:(NSDictionary*)parameters;
@end

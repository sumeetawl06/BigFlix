

#import "AbstractProxy.h"
#import "AFNetworking.h"
//#import "SessionDataManager.h"
#import "UserDefaultUtils.h"
//#import "Constants.h"
#import "Macros.h"
#import "FunctionUtils.h"
#import "UIUtils.h"
#import "MBProgressHUD.h"

#define  BAD_REQUEST 400
#define  UNAUTHORISED 401
#define  INTERNAL_SERVER_ERROR 500
#define  SESSION_TAG 123

#define  ERROR @"BUSINESS-ERROR"
#define  SUCCESS @"SUCCESS"

//#define BASEURLString  @"http://testnutradirectory/"
#define BASEURLString  @"http://192.168.10.129/"


#define BASEURL [NSURL URLWithString:BASEURLString]
#define API_SESSION_KEY @"session-Key"
#define USER_NAME @"userName"
#define CONSUMER_SECRET @"consumerSecret"

@interface AbstractProxy () <UIAlertViewDelegate>

@property (nonatomic,retain) AFHTTPRequestOperationManager *aFHTTPRequestOperationManager;
@property (nonatomic,retain) AFURLSessionManager *aFURLSessionManager;

@end

@implementation AbstractProxy


- (AFHTTPRequestOperationManager*)getRequestManager {
    
    if (!self.aFHTTPRequestOperationManager) {
        
    self.aFHTTPRequestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:BASEURL];
    
    [self.aFHTTPRequestOperationManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [self.aFHTTPRequestOperationManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        
    }
//    [self.aFHTTPRequestOperationManager.requestSerializer setValue:[UserDefaultUtils retriveObjectForKey:@"application/json"] forHTTPHeaderField:APP_SUBSCRIPTION_KEY];
    
    [self.aFHTTPRequestOperationManager.requestSerializer setValue:[NSString stringWithFormat:@"nutracorp\\%@",[UserDefaultUtils retriveObjectForKey:USER_DEFAULT_USERNAME]] forHTTPHeaderField:USER_NAME];    //logged in user name
    
    if(![StringUtils isBlank:[UserDefaultUtils retriveObjectForKey:API_SESSION_KEY]]) {
        
        DebugLog(@"api key:%@",[UserDefaultUtils retriveObjectForKey:API_SESSION_KEY]);
        
        [self.aFHTTPRequestOperationManager.requestSerializer setValue:[UserDefaultUtils retriveObjectForKey:API_SESSION_KEY] forHTTPHeaderField:API_SESSION_KEY];
    }
    else
    {
        
        [self.aFHTTPRequestOperationManager.requestSerializer setValue:@"" forHTTPHeaderField:API_SESSION_KEY];
    }

    
    [self.aFHTTPRequestOperationManager.requestSerializer setValue:@"d2brs9xaniSxOf4EagpFUa89m7Jp1DgD9FS9yCwlGo" forHTTPHeaderField:CONSUMER_SECRET];
    
    [self.aFHTTPRequestOperationManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"content-Type"];

    
    return self.aFHTTPRequestOperationManager;
    
}

- (AFSecurityPolicy*)getSecurityPolicy {
    
    NSString *hostCerPath = [[NSBundle mainBundle] pathForResource:@"SimplicitySSLCertificate" ofType:@"cer"];
    
    NSData *hostCerData = [NSData dataWithContentsOfFile:hostCerPath];
    
    NSString *interCerPath = [[NSBundle mainBundle] pathForResource:@"intermidiateD" ofType:@"cer"];

    NSData *interCerData = [NSData dataWithContentsOfFile:interCerPath];
    
    NSString *rootCerPath = [[NSBundle mainBundle] pathForResource:@"rootD" ofType:@"cer"];
    
    NSData *rootCerData = [NSData dataWithContentsOfFile:rootCerPath];
    
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc]init];
    [securityPolicy setPinnedCertificates:@[rootCerData,interCerData,hostCerData]];
    [securityPolicy setAllowInvalidCertificates:NO];
    [securityPolicy setValidatesDomainName:YES];
//    [securityPolicy setValidatesCertificateChain:YES];
    securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    return securityPolicy;
}

- (AFURLSessionManager*)getSessionManager {
 
    
    if (!self.aFURLSessionManager) {
    
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:[[NSBundle mainBundle] bundleIdentifier]];
    
        self.aFURLSessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        [[self.aFURLSessionManager operationQueue] setMaxConcurrentOperationCount:1];

        
    }
    
    return self.aFURLSessionManager;
}


#pragma mark - AFHTTPREQUEST Operations Methods

// Support iOS >= 6

- (void)getRequestDataWithURL:(NSString *)url
               andRequestName:(NSString *)requestName {
       
//     DebugLog(@"%@",url);
    DebugLog(@"url = %@",[[NSURL URLWithString:url relativeToURL:BASEURL] absoluteString]);

    AFHTTPRequestOperationManager *manager = [self getRequestManager];

    [manager GET:url
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
             [self successWithRequest:operation withRespose:responseObject withRequestName:requestName];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             [self  failedWithRequest:operation witherror:error withRequestName:requestName];

         }];
}
// Newly added method for get request with parameters

- (void)getRequestDataWithURL:(NSString *)url
               andRequestName:(NSString *)requestName
                  andParameters:(NSDictionary*)parameters
{
    
    //     DebugLog(@"%@",url);
    DebugLog(@"url = %@",[[NSURL URLWithString:url relativeToURL:BASEURL] absoluteString]);
    
    AFHTTPRequestOperationManager *manager = [self getRequestManager];
    
    [manager GET:url
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             [self successWithRequest:operation withRespose:responseObject withRequestName:requestName];
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             [self  failedWithRequest:operation witherror:error withRequestName:requestName];
             
         }];
}

- (void)postRequestDataWithURL:(NSString *)url
                andRequestName:(NSString *)requestName
                   andPostData:(NSDictionary*)postData {
    
    AFHTTPRequestOperationManager *manager=  [self getRequestManager];
    
     DebugLog(@"url = %@",[[NSURL URLWithString:url relativeToURL:BASEURL] absoluteString]);
    [manager POST:url
       parameters:postData
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              [self successWithRequest:operation withRespose:responseObject withRequestName:requestName];

          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
              [self  failedWithRequest:operation witherror:error withRequestName:requestName];

          }];
    
    
}



- (void)putRequestDataWithURL:(NSString *)url
               andRequestName:(NSString *)requestName
                    andPutData:(NSDictionary*)putData {
    

    
    [[self getRequestManager] PUT:url
      parameters:putData
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             [self successWithRequest:operation withRespose:responseObject withRequestName:requestName];

         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             [self  failedWithRequest:operation witherror:error withRequestName:requestName];

         }];
  
}


- (void)deleteRequestDataWithURL:(NSString *)url
                  andRequestName:(NSString *)requestName
                      andDeleteData:(NSDictionary*)deleteData {
    
    [[self getRequestManager] DELETE:url
         parameters:deleteData
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                [self successWithRequest:operation withRespose:responseObject withRequestName:requestName];

            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                [self  failedWithRequest:operation witherror:error withRequestName:requestName];

            }];
    
}


- (void)postMultiportRequest:(NSDictionary *)postData WithURL:(NSString *)url andRequestName:(NSString *)requestName {
    

     AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:BASEURL];
    
//    if ([FunctionUtils getUserSessionFromKeyChainAccess]) {
//        
//        [manager.requestSerializer setValue:[FunctionUtils getUserSessionFromKeyChainAccess] forHTTPHeaderField:@"x-session-key"];
//        
//    }
    
    if([StringUtils isStringPresent:[UserDefaultUtils retriveObjectForKey:API_SESSION_KEY]]) {
        
        [manager.requestSerializer setValue:[UserDefaultUtils retriveObjectForKey:API_SESSION_KEY] forHTTPHeaderField:API_SESSION_KEY];
    }
    
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
            [formData appendPartWithFileData:[postData objectForKey:@"fileData"] name:[postData objectForKey:@"name"] fileName:[postData objectForKey:@"fileName"] mimeType:[postData objectForKey:@"mimeType"]];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [self successWithRequest:operation withRespose:responseObject withRequestName:requestName];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        [self  failedWithRequest:operation witherror:error withRequestName:requestName];
        
    }];
    
    
}


#pragma mark - AFURLSESSION Methods

// SUpport iOS 7 for background upload / download

- (void)downloadImage:(NSString*)imagePath {

    NSURL *URL = [NSURL URLWithString:imagePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    
    NSURLSessionDownloadTask *downloadTask = [[self getSessionManager]
                                              downloadTaskWithRequest:request
                                              progress:nil
                                              destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                                                  

     NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
                                                  
    
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
    
    }];
    
    [downloadTask resume];
    
}



- (void)uploadImage:(NSDictionary*)postData andRequestName:(NSString *)requestName {


   AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    

//    if ([FunctionUtils getUserSessionFromKeyChainAccess]) {
//    
//        [requestSerializer setValue:[FunctionUtils getUserSessionFromKeyChainAccess] forHTTPHeaderField:@"x-session-key"];
//    
//    }

    NSString *urlString  = [NSString stringWithFormat:@"%@user/UploadImage",BASEURL];
    
    NSMutableURLRequest *request = [requestSerializer
                                    multipartFormRequestWithMethod:@"POST" URLString:urlString
                                    parameters:nil
                                    constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                        
                                        NSArray *keysArray = [postData allKeys];
                                        
                                        for (int i = 0; i < [keysArray count]; i++) {
                                            
                                            NSString  *key = [keysArray objectAtIndex:i];
                                            
                                            
                                            if ([key isEqualToString:@"file"])  {
                                                
                                                
                                                [formData appendPartWithFileData:[postData objectForKey:key] name:key fileName:[postData objectForKey:@"request"] mimeType:@"image/png"];
                                                
                                                
                                            } else {
                                                      
                                                      NSString *stringObject = [postData objectForKey:key];
                                                      
                                                      NSData *dataObject = [stringObject dataUsingEncoding:NSUTF8StringEncoding];
                                                      
                                                      [formData appendPartWithFormData:dataObject name:key];
                                                      
                                                  }
                                            
                                        }
                                        
            }  error:nil];
    
    NSProgress *progress = nil;
    
    NSURLSessionUploadTask *uploadTask = [[self getSessionManager] uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            
            
            [self successWithRequest:nil withRespose:responseObject withRequestName:requestName];

            
        } else {
            
            [self  failedWithRequest:nil witherror:error withRequestName:requestName];

        }
    }];
    
    [uploadTask resume];
}

#pragma mark - Server request callback methods

- (void)successWithRequest:(AFHTTPRequestOperation *)operation
               withRespose:(id)responseObject
           withRequestName:(NSString *)requestName {
    
    
    
}

- (void)failedWithRequest:(AFHTTPRequestOperation *)operation
                witherror:(NSError *)error
           withRequestName:(NSString *)requestName {
    
    
    
} 

#pragma mark - Failure Request Alert -

- (void)showAlertForFailedRequest:(AFHTTPRequestOperation *)operation
                        witherror:(NSError *)error

                  withRequestName:(NSString *)requestName {
    
    DebugLog(@"%d", (int)[operation.response statusCode]);
    
    DebugLog(@"%d", (int)operation.responseString);

    if ([operation.response statusCode] == INTERNAL_SERVER_ERROR) {
        
        [UIUtils alertView:@"Oops, something went wrong! Please try again after some time." withTitle:@"Error!"];
        
    } else if ([operation.response statusCode] == UNAUTHORISED) {
        
        [self  removeLogoutUserDetails];
        
        [UIUtils alertView:@"Session has been expired." withTitle:@"Error!" andDelegate:self andTag:SESSION_TAG];
        
    } else if ([operation.response statusCode] == BAD_REQUEST) {
        
        NSError *error;
        id object = [NSJSONSerialization
                     JSONObjectWithData:operation.responseData
                     options:kNilOptions
                     error:&error];

        
        DebugLog(@"here data is %@",object);
        
        NSString *successMessage = [[object valueForKey:@"message"]stringByReplacingOccurrencesOfString:@"[\"" withString:@""];
   
        successMessage   = [successMessage stringByReplacingOccurrencesOfString:@"\"]" withString:@""];

        [UIUtils  alertView:successMessage withTitle:@"Error!"];
        
    } else {
        
        if (![StringUtils isStringPresent:[operation responseString]]) {
            
            
            if ([StringUtils isStringPresent:[[operation error] localizedFailureReason]]) {
                
                [UIUtils alertView:[error localizedFailureReason] withTitle:@"Error!"];
                
            } else {
                
                [UIUtils alertView:[[operation error] localizedDescription] withTitle:@"Network Failure!"];
                
            }
            
        } else {
            
            if ([StringUtils isStringPresent:[operation responseString]]) {
                
                [UIUtils alertView:[operation responseString] withTitle:requestName];
                
            } 
        }
        
    }
    
}




#pragma mark - Successfull Request Alert -

- (void)showAlertForSuccessfullRequest:(id)object {
    
    if ([[object objectForKey:@"type"] isEqualToString:SUCCESS]) {
        
        NSString *successMessage = [object valueForKey:@"message"] ;
        
        [UIUtils  alertView:successMessage withTitle:@"Success"];
        
    }
    
    if ([[object objectForKey:@"type"] isEqualToString:ERROR]) {
        
        NSString *successMessage = [[object valueForKey:@"message"] componentsJoinedByString:@","];
        
        [UIUtils  alertView:successMessage withTitle:@"Error!"];
    }
}

- (void) removeLogoutUserDetails {
    
    [UserDefaultUtils removeSavedObjectForKey:@"isFacebookLogin"];   
}


- (id)JSONValueReturnsDictionary:(NSString *)jsonString {
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *mainDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return mainDict;
}

- (id)JSONValueReturnsArray:(NSString *)jsonString {
    
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableArray *returnArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return returnArray;
}

-(NSString *) JSONStringFromObject:(id) dataObject
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataObject options:NSJSONWritingPrettyPrinted error:&error];
    NSString *resultAsString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return resultAsString;
}




@end

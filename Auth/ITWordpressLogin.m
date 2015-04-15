//
//  ITWordpressLogin.m
//  Created by Paolo Niccolò Giubelli on 14/04/15.
//  Copyright (c) 2015 ITestense. All rights reserved.
//  Distributed under MIT license.
//
// The MIT License (MIT)
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "ITWordpressLogin.h"

@implementation ITWordpressLogin
@synthesize webSiteUrl;
-(id)initWithWebSite:(NSURL *)webSiteUrl
{
    self = [super init];
    if(self){
        self.webSiteUrl = webSiteUrl;
    }
    return self;
}
-(void)performLoginWithUsername:(NSString *)username andPassword:(NSString *)password completionHandler:(void(^)(NSURLResponse*,NSData*,NSError*))completion
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:self.webSiteUrl];
    NSString *post = [NSString stringWithFormat:@"&log=%@&pwd=%@",username,password];
    NSData* postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:completion];
    
}
-(void)performLogout:(void (^)(NSURLResponse *, NSData *, NSError *))completion{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:self.webSiteUrl];
    NSString *post = [NSString stringWithFormat:@"&action=logout"];
    NSData* postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:completion];
}
@end

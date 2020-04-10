//
//  YJNewNoteDataModel.m
//  YJNewNote_Example
//
//  Created by 刘亚军 on 2020/4/9.
//  Copyright © 2020 lyj. All rights reserved.
//

#import "YJNewNoteDataModel.h"
#import "YJNewNoteManager.h"
#import <MJExtension/MJExtension.h>
#import <YJExtensions/YJExtensions.h>

@implementation YJNewNoteDataModel
- (instancetype)init{
    if (self = [super init]) {
        _UserID = [YJNewNoteManager defaultManager].UserID;
        _UserName = [YJNewNoteManager defaultManager].UserName;
        _UserType = [YJNewNoteManager defaultManager].UserType;
        _SchoolID = [YJNewNoteManager defaultManager].SchoolID;
        _NoteTitle = [YJNewNoteManager defaultManager].NoteTitle;
        _ReSourceName = [YJNewNoteManager defaultManager].ReSourceName;
        _ResourceID = [YJNewNoteManager defaultManager].ResourceID;
        _SystemID = [YJNewNoteManager defaultManager].SystemID;
        _SystemName = [YJNewNoteManager defaultManager].SystemName;
        _SubjectID = [YJNewNoteManager defaultManager].SubjectID;
        _SubjectName = [YJNewNoteManager defaultManager].SubjectName;
        _MaterialName = [YJNewNoteManager defaultManager].MaterialName;
        _MaterialID = [YJNewNoteManager defaultManager].MaterialID;
        
        _OperateFlag = 1;
        _IsKeyPoint = @"0";
        _MaterialIndex = -1;
        _imageInfo = @[];
        
    }
    return self;
}

- (void)uploadNoteDataWithComplete:(void (^)(BOOL))complete{
    NSString *url = [[YJNewNoteManager defaultManager].NoteApi stringByAppendingString:@"/api/V2/Notes/OperateNote"];
    NSDictionary *params = [self mj_JSONObject];
    
    NSURL *requestUrl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    request.HTTPMethod = @"POST";
    
    NSString *totalDataStr = [NSString yj_encryptWithKey:self.UserID encryptDic:params];;
    NSString *md5String = [NSString stringWithFormat:@"%@%@%@",self.UserID,[YJNewNoteManager defaultManager].Token,totalDataStr];
    NSString *sign = [NSString yj_md5EncryptStr:md5String];

    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    request.allHTTPHeaderFields = @{
                                    @"platform":self.UserID,
                                    @"sign":sign,
                                    @"timestamp":[YJNewNoteManager defaultManager].Token
                                    };
    request.timeoutInterval = 30;
    request.HTTPBody = [totalDataStr dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) {
                    complete(NO);
                }
            });
        } else {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (dic && [[dic objectForKey:@"ErrorCode"] hasSuffix:@"00"]) {
                     if (complete) {
                         complete(YES);
                     }
                }else{
                    if (complete) {
                        complete(NO);
                    }
                }
            });
        }
    }];
    [dataTask resume];
    
}
@end

//
//  NHImageLoader.h
//  weex
//
//  Created by nenhall_work on 2018/10/11.
//  Copyright © 2018 nenhall_studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <WXImgLoaderProtocol.h>



NS_ASSUME_NONNULL_BEGIN

@interface NHImageLoader : NSObject <WXImgLoaderProtocol,WXImageOperationProtocol>
///AFHTTPSessionManager
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
///下载任务
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

//2.1 WXImgLoaderProtocol 必须实现方法:
- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock;


//2.2 WXImageOperationProtocol 必须实现方法:
- (void)cancel;

@end

NS_ASSUME_NONNULL_END

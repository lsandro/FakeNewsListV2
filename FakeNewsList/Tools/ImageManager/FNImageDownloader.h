//
//  FNImageDownloader.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FNImageDownloader : NSObject

+ (instancetype)shareManager;

- (void)downloadImageByStr:(NSString *)urlStr complete:(void(^)(UIImage *img))complete;

@end

NS_ASSUME_NONNULL_END

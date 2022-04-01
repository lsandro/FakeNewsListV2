//
//  FNTimerProxy.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FNTimerProxy : NSProxy

- (instancetype)initWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target;

@property (nonatomic, weak, readonly) id target;

@end

NS_ASSUME_NONNULL_END

//
//  FNViewModel.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "FNNews.h"

NS_ASSUME_NONNULL_BEGIN

@interface FNViewModel : NSObject

- (void)updateWithStatusesArr:(NSArray *)statuses complete:(void (^)(void))complete;

@property (nonatomic , strong) NSMutableArray<FNNews *> *newsArr;
@property (nonatomic , strong) NSMutableArray *tableViewCellHeightArr;

@end

NS_ASSUME_NONNULL_END

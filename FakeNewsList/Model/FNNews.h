//
//  FNNews.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import <UIKit/UIKit.h>

#import "FNModel.h"
#import "FNUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface FNNews : FNModel

- (instancetype)initWithNewsDict:(NSDictionary *)dict;

@property (nonatomic , strong) FNUser *user;

@property (nonatomic , strong) NSString *text;

@property (nonatomic , strong) NSString *mid;

@property (nonatomic , strong) NSString *scheme;

@property (nonatomic , assign) NSInteger textLength;

@property (nonatomic , strong) NSArray *url_struct;

@property (nonatomic , strong) NSMutableArray *pic_infos;

@property (nonatomic , assign) double textHeight;

@property (nonatomic , strong) NSMutableArray<UIImage *> *pics;

@end

NS_ASSUME_NONNULL_END

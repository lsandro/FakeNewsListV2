//
//  FNUser.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import "FNModel.h"

@interface FNUser : FNModel

- (instancetype)initWithUserDict:(NSDictionary *)userDict;

@property (nonatomic , strong) NSString *avatar_hd;

@property (nonatomic , strong) NSString *name;

@property (nonatomic , strong) NSString *screen_name;

@end

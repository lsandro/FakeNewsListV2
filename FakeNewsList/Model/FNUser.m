//
//  FNUser.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import "FNUser.h"

@implementation FNUser

- (instancetype)initWithUserDict:(NSDictionary *)userDict
{
    if (self = [self init])
    {
        if (userDict && userDict.count > 0)
        {
            self.avatar_hd = [userDict objectForKey:@"avatar_hd"];
            self.name = [userDict objectForKey:@"name"];
            self.screen_name = [userDict objectForKey:@"screen_name"];
        }
    }
    return self;
}

#pragma mark - getter/setter

- (NSString *)avatar_hd
{
    if (!_avatar_hd)
    {
        _avatar_hd = @"";
    }
    return _avatar_hd;
}

- (NSString *)name
{
    if (!_name)
    {
        _name = @"";
    }
    return _name;
}

- (NSString *)screen_name
{
    if (!_screen_name)
    {
        _screen_name = @"";
    }
    return _screen_name;
}

@end

//
//  FNNews.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import "FNNews.h"

#import "FNImageDownloader.h"

@implementation FNNews

- (instancetype)initWithNewsDict:(NSDictionary *)dict
{
    if (self = [self init])
    {
        self.user = [[FNUser alloc] initWithUserDict:[dict objectForKey:@"user"]];
        self.text = [dict objectForKey:@"text"];
        self.mid = [dict objectForKey:@"mid"];
        self.scheme = [dict objectForKey:@"scheme"];
        self.textLength = [[dict objectForKey:@"textLength"] integerValue];
        
        self.url_struct = [dict objectForKey:@"url_struct"] ? [dict objectForKey:@"url_struct"] : self.url_struct;
        
        NSDictionary *pic_ori_infos = [dict objectForKey:@"pic_infos"] ? [dict objectForKey:@"pic_infos"] : nil;
        
        if (pic_ori_infos && pic_ori_infos.count > 0)
        {
            for (NSDictionary *imgDict in pic_ori_infos.allValues)
            {
//                NSDictionary *largest = [imgDict objectForKey:@"largest"];
                NSDictionary *largest = [imgDict objectForKey:@"middleplus"];
                NSString *imgUlrStr = [largest objectForKey:@"url"];
                [self.pic_infos addObject:imgUlrStr];
                
//                [[FNImageDownloader shareManager] downloadImageByStr:imgUlrStr complete:^(UIImage * _Nonnull img) {
//                    [self.pics addObject:img];;
//                }];
            }
        }
    }
    return  self;
}

#pragma mark - getter/setter

- (FNUser *)user
{
    if (!_user)
    {
        _user = [[FNUser alloc] initWithUserDict:nil];
    }
    return _user;
}

- (NSString *)text
{
    if (!_text)
    {
        _text = @"";
    }
    return _text;
}

- (NSString *)mid
{
    if (!_mid)
    {
        _mid = @"";
    }
    return _mid;
}

- (NSString *)scheme
{
    if (!_scheme)
    {
        _scheme = @"";
    }
    return _scheme;
}

- (NSArray *)url_struct
{
    if (!_url_struct)
    {
        _url_struct = [NSArray array];
    }
    return _url_struct;
}

- (NSMutableArray *)pic_infos
{
    if (!_pic_infos)
    {
        _pic_infos = [NSMutableArray array];
    }
    return _pic_infos;
}

- (NSMutableArray<UIImage *> *)pics
{
    if (!_pics)
    {
        _pics = [NSMutableArray array];
    }
    return _pics;
}

@end

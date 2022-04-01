//
//  FNViewModel.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import "FNViewModel.h"

@interface FNViewModel()

@property (nonatomic , strong) dispatch_queue_t update_data_queue;

@end

@implementation FNViewModel

- (void)updateWithStatusesArr:(NSArray *)statuses complete:(void (^)(void))complete
{

    dispatch_async(self.update_data_queue, ^{
        for (NSDictionary *userDict in statuses)
        {
            FNNews *news = [[FNNews alloc] initWithNewsDict:userDict];
            [self.newsArr addObject:news];
            
            CGFloat cellHeight = 45 + 16 + 5;
            CGSize titleSize = [news.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 16, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
            news.textHeight = titleSize.height;
            cellHeight += titleSize.height;
            if (!news.pic_infos.count)
            {
                
            }
            else if (news.pic_infos.count > 1 && news.pic_infos.count <= 3)
            {
                cellHeight += ([UIScreen mainScreen].bounds.size.width - 16) * 1.f/3.f;
            }
            else if (news.pic_infos.count > 3 && news.pic_infos.count <= 6)
            {
                cellHeight += ([UIScreen mainScreen].bounds.size.width - 16) * 2.f/3.f;
            }
            else // > 6
            {
                cellHeight += ([UIScreen mainScreen].bounds.size.width - 16);
            }
            
            [self.tableViewCellHeightArr addObject:@(cellHeight)];
        }
        if (complete)
        {
            
            if ([NSThread isMainThread]) {
                complete();
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    complete();
                });
            }
        }
    });
}

- (double)getHeightWith:(FNNews *)news
{
    return 0;;
}

#pragma mark - getter/setter

- (NSMutableArray<FNNews *> *)newsArr
{
    if (!_newsArr)
    {
        _newsArr = [NSMutableArray array];
    }
    return _newsArr;
}

- (NSMutableArray *)tableViewCellHeightArr
{
    if (!_tableViewCellHeightArr)
    {
        _tableViewCellHeightArr = [NSMutableArray array];
    }
    return _tableViewCellHeightArr;
}

- (dispatch_queue_t)update_data_queue
{
    if (!_update_data_queue || _update_data_queue == NULL)
    {
        _update_data_queue = dispatch_queue_create("fn_update_data_queue", DISPATCH_QUEUE_CONCURRENT);
    }
    return _update_data_queue;
}

@end

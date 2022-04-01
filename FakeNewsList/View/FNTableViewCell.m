//
//  FNTableViewCell.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import "FNTableViewCell.h"

@implementation FNTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].bounds.size.width, self.frame.size.height);
        [self.contentView addSubview:self.publisherView];
        [self.contentView addSubview:self.imageCellView];
        self.selectionStyle =UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)updateCellByModel:(FNNews *)news
{
    [self.publisherView updatePublisherViewByModel:news];
    self.imageCellView.frame = CGRectMake(8, self.publisherView.frame.size.height + 5, self.frame.size.width - 16, 0);
    [self.imageCellView updateImageViewByModel:news];
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

#pragma mark - getter/setter

- (FNPublisherView *)publisherView
{
    if (!_publisherView)
    {
        _publisherView = [[FNPublisherView alloc] init];
        _publisherView.frame = CGRectMake(8, 0, self.frame.size.width - 16, 0);
    }
    return _publisherView;
}

- (FNImageCellView *)imageCellView
{
    if (!_imageCellView)
    {
        _imageCellView = [[FNImageCellView alloc] init];
        _imageCellView.frame = CGRectMake(8, self.publisherView.frame.size.height + 5, self.frame.size.width - 16, 0);
        _imageCellView.hidden = YES;
    }
    return _imageCellView;
}

@end

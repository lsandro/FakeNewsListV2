//
//  FNTableViewCell.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import <UIKit/UIKit.h>
#import "FNNews.h"
#import "FNPublisherView.h"
#import "FNImageCellView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FNTableViewCell : UITableViewCell

- (void)updateCellByModel:(FNNews *)news;

@property (nonatomic, strong)FNPublisherView *publisherView;
@property (nonatomic, strong)FNImageCellView *imageCellView;

@end

NS_ASSUME_NONNULL_END

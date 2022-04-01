//
//  FNImageCellView.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/9.
//

#import <UIKit/UIKit.h>
#import "FNNews.h"

NS_ASSUME_NONNULL_BEGIN

@interface FNImageCellView : UIView

- (void)updateImageViewByModel:(FNNews *)news;

@end

NS_ASSUME_NONNULL_END

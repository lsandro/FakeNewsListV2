//
//  FNPublisherView.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import <UIKit/UIKit.h>
#import "FNNews.h"

NS_ASSUME_NONNULL_BEGIN

@interface FNPublisherView : UIView

- (void)updatePublisherViewByModel:(FNNews *)news;

@end

NS_ASSUME_NONNULL_END

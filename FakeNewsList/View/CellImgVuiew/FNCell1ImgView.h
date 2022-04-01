//
//  FNCell1ImgView.h
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FNCell1ImgView : UIView

- (void)updateImgsByPicInfos:(NSArray *)pic_infos pics:(NSArray<UIImage *> *)pics;

@end

NS_ASSUME_NONNULL_END

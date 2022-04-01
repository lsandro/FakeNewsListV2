//
//  FNCell1ImgView.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/12.
//

#import "FNCell1ImgView.h"
#import "FNImageDownloader.h"

@interface FNCell1ImgView()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation FNCell1ImgView

- (void)updateImgsByPicInfos:(NSArray *)pic_infos pics:(NSArray<UIImage *> *)pics
{
    if (pics.count && pics[0])
    {
        self.imgView.image = pics[0];
    }
    else
    {
        NSString *urlStr = pic_infos[0];
        [[FNImageDownloader shareManager] downloadImageByStr:urlStr complete:^(UIImage * _Nonnull img) {
            self.imgView.image = img;
        }];
    }
    
    [self addSubview:self.imgView];
    NSLog(@"FNCell1ImgView");
}

- (UIImageView *)imgView
{
    if (!_imgView)
    {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgView;
}

@end

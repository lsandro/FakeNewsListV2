//
//  FNCell6ImgView.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/12.
//

#import "FNCell6ImgView.h"
#import "FNImageDownloader.h"

@implementation FNCell6ImgView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        CGFloat x = 5.f;
        CGFloat width = (frame.size.width - x*4) / 3.f;
        for (NSInteger j = 0; j < 2 ; j ++)
        {
            for (NSInteger i = 0; i < 3 ; i ++)
            {
                UIImageView *imgView = [[UIImageView alloc] init];
                imgView.frame = CGRectMake(x + i * (width + x), (width + 5) * j, width, width);
                [self addSubview:imgView];
            }
        }
    }
    return self;
}

- (void)updateImgsByPicInfos:(NSArray *)pic_infos pics:(NSArray<UIImage *> *)pics
{
    NSLog(@"FNCell6ImgView");
    
    for (UIImageView *imgView in self.subviews)
    {
        imgView.image = nil;
    }
    
    for (NSInteger i = 0 ; i < pic_infos.count ; i ++)
    {
        UIImageView *imgView = self.subviews[i];
        
        if (pics.count && pics[i])
        {
            imgView.image = pics[i];
        }
        else
        {
            NSString *urlStr = pic_infos[i];
            [[FNImageDownloader shareManager] downloadImageByStr:urlStr complete:^(UIImage * _Nonnull img) {
                imgView.image = img;
            }];
        }    }
}

@end

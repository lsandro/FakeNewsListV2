//
//  FNCell9ImgView.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/12.
//

#import "FNCell9ImgView.h"
#import "FNImageDownloader.h"

@implementation FNCell9ImgView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        CGFloat x = 5.f;
        CGFloat width = (frame.size.width - x*4) / 3.f;
        for (NSInteger j = 0; j < 3 ; j ++)
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
    NSLog(@"FNCell9ImgView");
    
    for (UIImageView *imgView in self.subviews)
    {
        imgView.image = nil;
    }
    
    NSInteger maxCount = pic_infos.count > 9 ? 9 : pic_infos.count;
    
    for (NSInteger i = 0 ; i < maxCount ; i ++)
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
        }
    }
}

@end

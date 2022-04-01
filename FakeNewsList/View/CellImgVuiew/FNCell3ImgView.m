//
//  FNCell3ImgView.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/12.
//

#import "FNCell3ImgView.h"
#import "FNImageDownloader.h"

@interface FNCell3ImgView()

//@property (nonatomic, strong)NSMutableArray *picViewArr;

@end

@implementation FNCell3ImgView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
//        self.picViewArr = [NSMutableArray array];
        CGFloat x = 5.f;
        CGFloat width = (frame.size.width - x*4) / 3.f;
        for (NSInteger i = 0; i < 3 ; i ++)
        {
            UIImageView *imgView = [[UIImageView alloc] init];
            imgView.frame = CGRectMake(x + i * (width + x), 0, width, width);
            [self addSubview:imgView];
//            [self.picViewArr addObject:imgView];
        }
    }
    return self;
}

- (void)updateImgsByPicInfos:(NSArray *)pic_infos pics:(NSArray<UIImage *> *)pics
{
    NSLog(@"FNCell3ImgView");
    
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
        }
    }
}

@end

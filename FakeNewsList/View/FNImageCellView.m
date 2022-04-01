//
//  FNImageCellView.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/9.
//

#import "FNImageCellView.h"

#import "FNCell1ImgView.h"
#import "FNCell3ImgView.h"
#import "FNCell6ImgView.h"
#import "FNCell9ImgView.h"

@interface FNImageCellView()

@property (nonatomic , strong)FNCell1ImgView *cell1ImgView;
@property (nonatomic , strong)FNCell3ImgView *cell3ImgView;
@property (nonatomic , strong)FNCell6ImgView *cell6ImgView;
@property (nonatomic , strong)FNCell9ImgView *cell9ImgView;

@end

@implementation FNImageCellView

- (void)updateImageViewByModel:(FNNews *)news
{
    if (news.pic_infos && news.pic_infos.count > 0)
    {
        self.hidden = NO;
        if (news.pic_infos.count == 1)
        {
            self.frame = CGRectMake(self.frame.origin.x , self.frame.origin.y, self.frame.size.width, self.frame.size.width);
            [self.cell1ImgView updateImgsByPicInfos:news.pic_infos pics:news.pics];
//            NSLog(@"-1- %@",news.text);
            if (self.cell1ImgView.hidden)
            {
                [self showImgView:self.cell1ImgView];
            }
        }
        else if (news.pic_infos.count > 1 && news.pic_infos.count <= 3)
        {
            self.frame = CGRectMake(self.frame.origin.x , self.frame.origin.y, self.frame.size.width, self.frame.size.width * 1.0/3.0);
            [self.cell3ImgView updateImgsByPicInfos:news.pic_infos pics:news.pics];
//            NSLog(@"-3- %@",news.text);
            if (self.cell3ImgView.hidden)
            {
                [self showImgView:self.cell3ImgView];
            }
        }
        else if (news.pic_infos.count > 3 && news.pic_infos.count <= 6)
        {
//            NSLog(@"-6- %@",news.text);
            self.frame = CGRectMake(self.frame.origin.x , self.frame.origin.y, self.frame.size.width, self.frame.size.width * 2.0/3.0);
            [self.cell6ImgView updateImgsByPicInfos:news.pic_infos pics:news.pics];
            if (self.cell6ImgView.hidden)
            {
                [self showImgView:self.cell6ImgView];
            }
        }
        else // > 6
        {
//            NSLog(@"-9- %@",news.text);
            self.frame = CGRectMake(self.frame.origin.x , self.frame.origin.y, self.frame.size.width, self.frame.size.width);
            [self.cell9ImgView updateImgsByPicInfos:news.pic_infos pics:news.pics];
            if (self.cell9ImgView.hidden)
            {
                [self showImgView:self.cell9ImgView];
            }
        }
    }
    else
    {
//        NSLog(@"-0- %@",news.text);
        self.frame = CGRectMake(self.frame.origin.x , self.frame.origin.y, self.frame.size.width, 0);
        self.hidden = YES;
    }
}

- (void)showImgView:(UIView *)view
{
    self.cell1ImgView.hidden = YES;
    self.cell3ImgView.hidden = YES;
    self.cell6ImgView.hidden = YES;
    self.cell9ImgView.hidden = YES;
    view.hidden = NO;
}

#pragma mark - getter/setter

- (FNCell1ImgView *)cell1ImgView
{
    if (!_cell1ImgView)
    {
        _cell1ImgView = [[FNCell1ImgView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _cell1ImgView.hidden = YES;
        [self addSubview:_cell1ImgView];
    }
    return _cell1ImgView;
}

- (FNCell3ImgView *)cell3ImgView
{
    if (!_cell3ImgView)
    {
        _cell3ImgView = [[FNCell3ImgView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _cell3ImgView.hidden = YES;
        [self addSubview:_cell3ImgView];
    }
    return _cell3ImgView;
}

- (FNCell6ImgView *)cell6ImgView
{
    if (!_cell6ImgView)
    {
        _cell6ImgView = [[FNCell6ImgView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _cell6ImgView.hidden = YES;
        [self addSubview:_cell6ImgView];
    }
    return _cell6ImgView;
}

- (FNCell9ImgView *)cell9ImgView
{
    if (!_cell9ImgView)
    {
        _cell9ImgView = [[FNCell9ImgView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _cell9ImgView.hidden = YES;
        [self addSubview:_cell9ImgView];
    }
    return _cell9ImgView;
}

@end

//
//  FNPublisherView.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import "FNPublisherView.h"
#import "FNImageDownloader.h"
#import <YYKit/YYKit.h>

@interface FNPublisherView()

@property (nonatomic, strong) UIImageView *avatarImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) YYLabel *textLabel;

@end

@implementation FNPublisherView

- (instancetype)init
{
    if (self = [super init])
    {
        self.avatarImgView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 45, 45)];
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(8 + 45 + 8, 12, 10, 40)];
        self.textLabel = [[YYLabel alloc] initWithFrame:CGRectMake(8, 8 + 45 + 8, 10, 10)];
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.numberOfLines = 0;
        
        [self addSubview:self.avatarImgView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.textLabel];
        
//        self.avatarImgView.backgroundColor = [UIColor redColor];
//        self.nameLabel.backgroundColor = [UIColor redColor];
//        self.textLabel.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)updatePublisherViewByModel:(FNNews *)news
{
    self.avatarImgView.image = nil;
    [[FNImageDownloader shareManager] downloadImageByStr:news.user.avatar_hd complete:^(UIImage * _Nonnull img) {
            self.avatarImgView.image = img;
    }];
    self.nameLabel.text = news.user.screen_name;
    self.nameLabel.frame = CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y, self.frame.size.width - 24 - 45, self.nameLabel.frame.size.height);
    
//    // 1. 创建属性字符串。
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"起飞黑暗芜湖"];
//
//    // 2. 将属性设置为文本，可以使用几乎所有的CoreText属性。
//    text.font = [UIFont boldSystemFontOfSize:30];
//    text.color = [UIColor blueColor];
//    [text setTextHighlightRange:[[text string] rangeOfString:@"黑暗"] color:[UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000] backgroundColor:[UIColor redColor] tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) { //点击文本的操作
//        NSLog(@"我被点击了-%@",text);
//    }];

//     3. 设置为YYLabel或YYTextView。 YYLabel *label = [YYLabel new]; label.attributedText = text; // YYLabel要想自动换行，必须设置最大换行的宽度 label.preferredMaxLayoutWidth = SCREEN_WIDTH-40;
    
    self.textLabel.text = news.text;
//    self.textLabel.attributedText = text;
    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, self.textLabel.frame.origin.y, self.frame.size.width - 16, news.textHeight);
    
    [self.nameLabel sizeToFit];
//    [self.textLabel sizeToFit];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 8 + 45 + 8 + self.textLabel.frame.size.height + 8);
}

@end

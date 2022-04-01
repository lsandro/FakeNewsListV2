//
//  FNImageDownloader.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/11.
//

#import "FNImageDownloader.h"

@interface FNImageDownloader()

@property (nonatomic, strong) dispatch_queue_t imgDownloadQueue;

@property (nonatomic, strong) NSOperationQueue *opQueue;

@end

@implementation FNImageDownloader

+ (instancetype)shareManager
{
    static dispatch_once_t _token;
    static FNImageDownloader *_shareManager;
    dispatch_once(&_token, ^{
        _shareManager = [[FNImageDownloader alloc] init];
    });
    return _shareManager;
}

- (void)downloadImageByStr:(NSString *)urlStr complete:(void(^)(UIImage *img))complete
{
    NSBlockOperation *imgDownloadBlkOp = [NSBlockOperation blockOperationWithBlock:^{
        
        NSCache *cache = [[NSCache alloc] init];

        UIImage *img = [cache objectForKey:urlStr];
        if (!img)
        {
            NSData *imgData = [[NSUserDefaults standardUserDefaults] objectForKey:urlStr];
            if (!imgData)
            {
                NSURL *imgUrl = [NSURL URLWithString:urlStr];
                imgData = [[NSData alloc] initWithContentsOfURL:imgUrl];
                [[NSUserDefaults standardUserDefaults] setObject:imgData forKey:urlStr];
            }
            img = [UIImage imageWithData:imgData];
            [cache setObject:img forKey:urlStr];
        }

        if (complete)
        {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                complete(img);
            }];
        }
    }];
    
    [self.opQueue addOperation:imgDownloadBlkOp];
}

- (void)gcdDownloadImageByStr:(NSString *)urlStr complete:(void(^)(UIImage *img))complete
{
    dispatch_async(self.imgDownloadQueue, ^{

        NSCache *cache = [[NSCache alloc] init];

        UIImage *img = [cache objectForKey:urlStr];
        if (!img)
        {
            NSData *imgData = [[NSUserDefaults standardUserDefaults] objectForKey:urlStr];
            if (!imgData)
            {
                NSURL *imgUrl = [NSURL URLWithString:urlStr];
                imgData = [[NSData alloc] initWithContentsOfURL:imgUrl];
                [[NSUserDefaults standardUserDefaults] setObject:imgData forKey:urlStr];
            }
            img = [UIImage imageWithData:imgData];
            [cache setObject:img forKey:urlStr];
        }

        if (complete)
        {
            if ([NSThread isMainThread]) {
                complete(img);
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    complete(img);
                });
            }
        }
    });
}

- (dispatch_queue_t)imgDownloadQueue
{
    if (_imgDownloadQueue == NULL || !_imgDownloadQueue)
    {
        _imgDownloadQueue = dispatch_queue_create("img_download_queue", DISPATCH_QUEUE_SERIAL);
    }
    return _imgDownloadQueue;
}

- (NSOperationQueue *)opQueue
{
    if (!_opQueue)
    {
        _opQueue = [[NSOperationQueue alloc] init];
    }
    return _opQueue;
}

@end

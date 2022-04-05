//
//  ViewController.m
//  FakeNewsList
//
//  Created by 梁爽 on 2022/3/7.
//

#import "ViewController.h"

#import "BaseData.h"

#import "AFNetworking.h"
#import "MJRefresh.h"

#import "FNViewModel.h"

#import "FNTableViewCell.h"
#import "FNFPSLabel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic, strong)FNViewModel *viewModel;

@property (nonatomic, strong) FNFPSLabel *fpsLabel;

@end

@implementation ViewController

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    self.view.backgroundColor = [UIColor orangeColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 80) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    __weak ViewController *weakSelf = self;
//    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
//        [weakSelf getData];
//    }];
    
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        [weakSelf getData];
    }];

    [self.view addSubview:self.tableView];
    [self getData];
    
    _fpsLabel = [FNFPSLabel new];
    _fpsLabel.frame = CGRectMake(200, 200, 50, 30);
    [_fpsLabel sizeToFit];
//    [self.view.window addSubview:_fpsLabel];
//    [[self getKeyWindow] addSubview:_fpsLabel];
    [self.view addSubview:_fpsLabel];
}

#pragma mark - data

- (void)getData
{
    NSString *url = [BaseData baseURL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        NSArray *arr = [responseObject objectForKey:@"statuses"];
        [self.viewModel updateWithStatusesArr:arr complete:^{
            [self.tableView reloadData];
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"AFHTTPSessionManager Error = %@",error);
        }
    }];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *num = self.viewModel.tableViewCellHeightArr[indexPath.row];
    return num.doubleValue;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.newsArr.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    FNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FNTabelViewCell"];
    if (!cell)
    {
        cell = [[FNTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"FNTabelViewCell"];
    }
    [cell updateCellByModel:self.viewModel.newsArr[indexPath.row]];
    
    return  cell;
}

#pragma mark - APM


#pragma mark - getter/setter

- (FNViewModel *)viewModel
{
    if (!_viewModel)
    {
        _viewModel = [[FNViewModel alloc] init];
    }
    return _viewModel;
}

- (UIWindow *)getKeyWindow
{
    if (@available(iOS 13.0, *))
    {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive)
            {
                for (UIWindow *window in windowScene.windows)
                {
                    if (window.isKeyWindow)
                    {
                        return window;
                        break;
                    }
                }
            }
        }
    }
    else
    {
        return [UIApplication sharedApplication].keyWindow;
    }
    return nil;
}


@end

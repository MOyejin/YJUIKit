//
//  YJCollectionViewController.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJCollectionViewController.h"
#import "MJRefresh/MJRefresh.h"//依赖的第三方库

@interface YJCollectionViewController ()

@property (nonatomic, strong, readwrite) UICollectionView *yj_collectionView;
@property (nonatomic, strong, readwrite) UICollectionViewFlowLayout *yj_collectionViewFlowLayout;


@end

@implementation YJCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.yj_collectionView];
    [self yj_addRefresh];
}

#pragma mark - 设置Delegate与DataSource
- (void)yj_setCollectionViewDelegate:(id<UICollectionViewDelegate>)delegate
                          dataSource:(id<UICollectionViewDataSource>)dataSource {
    
    self.yj_collectionView.delegate = delegate;
    self.yj_collectionView.dataSource = dataSource;
}

#pragma mark - 设置DragDelegate与DropDelegate
- (void)yj_setCollectionViewDragDelegate:(id<UICollectionViewDragDelegate>)dragDelegate
                            dropDelegate:(id<UICollectionViewDropDelegate>)dropDelegate {
    
    self.yj_collectionView.dragDelegate = dragDelegate;
    self.yj_collectionView.dropDelegate = dropDelegate;
}

#pragma mark - 隐藏UICollectionView的ScrollIndicator
- (void)yj_hiddenCollectionViewScrollIndicator {
    
    self.yj_collectionView.showsVerticalScrollIndicator   = NO;
    self.yj_collectionView.showsHorizontalScrollIndicator = NO;
}

#pragma mark - 注册Class
- (void)yj_registerClass:(nullable Class)cellClass
              identifier:(NSString *)identifier {
    
    [self.yj_collectionView registerClass:cellClass
               forCellWithReuseIdentifier:identifier];
}

#pragma mark - MJRefresh相关
- (void)yj_addRefresh {
    
    __weak typeof(self) weakSelf = self;
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf yj_dropDownRefresh];
    }];
    
    self.yj_collectionView.mj_header = header;
    
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf yj_pullUpRefresh];
    }];
    
    self.yj_collectionView.mj_footer = refreshFooter;
}

#pragma mark - 下拉刷新相关
- (void)yj_dropDownBeginRefresh {
    [self.yj_collectionView.mj_header beginRefreshing];
}

- (void)yj_dropDownRefresh {}

- (void)yj_dropDownEndRefresh {
    [self.yj_collectionView.mj_header endRefreshing];
}

#pragma mark - 上拉刷新相关
- (void)yj_pullUpBeginRefresh {
    [self.yj_collectionView.mj_footer beginRefreshing];
}

- (void)yj_pullUpRefresh {}

- (void)yj_pullUpEndRefresh {
    [self.yj_collectionView.mj_footer endRefreshing];
}

- (void)yj_endCollectionViewRefreshWithType:(YJCollectionViewRefreshType)refreshType {
    
    if (refreshType == YJCollectionViewRefreshTypeDropDown) {
        
        [self yj_dropDownEndRefresh];
    } else {
        
        [self yj_pullUpEndRefresh];
    }
}

#pragma mark - 移除MJRefresh
- (void)yj_removeHeaderRefresh {
    self.yj_collectionView.mj_header = nil;
}

- (void)yj_removeFooterRefresh {
    self.yj_collectionView.mj_footer = nil;
}

- (void)yj_removeRefresh {
    
    self.yj_collectionView.mj_header = nil;
    self.yj_collectionView.mj_footer = nil;
}

#pragma mark - 懒加载
#pragma mark - Collection View
- (UICollectionView *)yj_collectionView {
    
    if (!_yj_collectionView) {
        
        _yj_collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                                collectionViewLayout:self.yj_collectionViewFlowLayout];
        
        _yj_collectionView.backgroundColor = [UIColor whiteColor];
        
        [_yj_collectionView registerClass:[UICollectionViewCell class]
               forCellWithReuseIdentifier:@"UICollectionViewCell"];
        
    }
    
    return _yj_collectionView;
}

#pragma mark - Collection View Flow Layout
- (UICollectionViewFlowLayout *)yj_collectionViewFlowLayout {
    
    if (!_yj_collectionViewFlowLayout) {
        
        _yj_collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    
    return _yj_collectionViewFlowLayout;
}

@end

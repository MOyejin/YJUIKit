//
//  YJCollectionViewViewModel.m
//  YJFoundationDemo
//
//  Created by Moyejin668 on 2020/1/16.
//  Copyright © 2020 Moyejin. All rights reserved.
//

#import "YJCollectionViewViewModel.h"

@interface YJCollectionViewViewModel ()

@property (nonatomic, strong, readwrite) NSMutableArray             *yj_dataSource;

@property (nonatomic, weak, readwrite  ) YJCollectionViewController *yj_collectionViewController;

@end

@implementation YJCollectionViewViewModel

- (instancetype)initCollectionViewBaseModelWithController:(YJCollectionViewController *)viewController {
    
    self = [super init];
    
    if (self) {
        self.yj_collectionViewController = viewController;
    }
    
    return self;
}

- (void)yj_collectionViewHTTPRequest {
    
}

- (NSMutableArray *)yj_dataSource {
    
    if (!_yj_dataSource) {
        
        _yj_dataSource = [NSMutableArray array];
    }
    
    return _yj_dataSource;
}

@end

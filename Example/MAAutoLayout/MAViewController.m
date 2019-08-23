//
//  MAViewController.m
//  MAAutoLayout
//
//  Created by ma772528138@qq.com on 11/28/2017.
//  Copyright (c) 2017 ma772528138@qq.com. All rights reserved.
//

#import "MAViewController.h"
#import "Masonry.h"
#import "MAAutoLayout.h"

@interface MAViewController ()

@end

@implementation MAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view2];
    
    [view ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(self.view).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view).offset(-10);
        make.right.equalTo(self.view).offset(-10);
    }];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).insets(UIEdgeInsetsMake(10, 10,10,10));
    }];
    [view2 ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.edge.equalTo(view1).insets(UIEdgeInsetsMake(10, 10, -10, -10));
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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
    
    [view ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(self.view).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view).offset(-10);
        make.right.equalTo(self.view).offset(-10);
    }];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).offset(10);
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

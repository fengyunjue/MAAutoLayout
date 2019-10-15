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

@property (nonatomic, weak) UIView *view0;
@property (nonatomic, weak) UIView *view1;
@property (nonatomic, weak) UIView *view2;

@end

@implementation MAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    self.view0 = view;
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    self.view1 = view1;
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view2];
    self.view2 = view2;
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view3];
    
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
    [view3 ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.center.equalTo(self.view);
        make.size.ma_equalSize(100,200);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view2 ma_remakeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.edge.equalTo(self.view1).insets(UIEdgeInsetsMake(80, 80, -80, -80));
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

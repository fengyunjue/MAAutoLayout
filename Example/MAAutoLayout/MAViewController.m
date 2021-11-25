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

@property (nonatomic, strong) UIView *view0;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.view0];
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
    [self.view addSubview:self.titleLabel];
    
    [self.view0 ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(self.view.ma_safeAreaLayoutGuideTop).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view.ma_safeAreaLayoutGuideBottom).offset(-10);
        make.right.equalTo(self.view).offset(-10);
    }];
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view0).insets(UIEdgeInsetsMake(10, 10,10,10));
    }];
    [self.view2 ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.edge.equalTo(self.view1).insets(UIEdgeInsetsMake(10, 10, -10, -10));
    }];
    [self.view3 ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.center.equalTo(self.view2);
        make.size.ma_equalSize(100,200);
    }];

    [self.titleLabel ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(self.view2).offset(20);
        make.leftRight.equalTo(self.view).offsets(50);
    }];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.view0.ma_topMaker.layoutConstraint.constant = 20;
    
    self.view2.ma_topMaker.layoutConstraint.constant = 80;
    self.view2.ma_leftMaker.layoutConstraint.constant = 80;
    self.view2.ma_rightMaker.layoutConstraint.constant = -80;
    self.view2.ma_bottomMaker.layoutConstraint.constant = -80;
    
    self.view3.ma_widthMaker.layoutConstraint.constant = 150;
    
    [self.titleLabel ma_updateConstraints:^(MAAutoLayout * _Nonnull newMake) {
        newMake.height.ma_equal(300);
    }];
    
    [self.view0 ma_updateConstraints:^(MAAutoLayout * _Nonnull newMake) {
        newMake.bottom.equalTo(self.view.ma_bottom).offset(-100);
    }];
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }completion:^(BOOL finished) {
        
        self.view2.ma_topMaker.layoutConstraint.constant = 20;
        self.view2.ma_leftMaker.layoutConstraint.constant = 20;
        self.view2.ma_rightMaker.layoutConstraint.constant = -20;
        self.view2.ma_bottomMaker.layoutConstraint.constant = -20;
        
        self.view3.ma_heightMaker.layoutConstraint.constant = 150;
        
        [self.titleLabel ma_remakeConstraints:^(MAAutoLayout * _Nonnull make) {
            make.top.equalTo(self.view2).offset(20);
            make.leftRight.equalTo(self.view).offsets(20);
        }];

        [self.view0 ma_updateConstraints:^(MAAutoLayout * _Nonnull newMake) {
            newMake.bottom.equalTo(self.view.ma_safeAreaLayoutGuideBottom).offset(-10);
        }];
        
        [UIView animateWithDuration:1 animations:^{
            [self.view layoutIfNeeded];
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: Lazy Load

- (UIView *)view0 {
    if (_view0 == nil) {
        _view0 = [[UIView alloc] init];
        _view0.backgroundColor = [UIColor redColor];
    }
    return _view0;
}

- (UIView *)view1 {
    if (_view1 == nil) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = [UIColor blueColor];
    }
    return _view1;
}

- (UIView *)view2 {
    if (_view2 == nil) {
        _view2 = [[UIView alloc] init];
        _view2.backgroundColor = [UIColor purpleColor];
    }
    return _view2;
}

- (UIView *)view3 {
    if (_view3 == nil) {
        _view3 = [[UIView alloc] init];
        _view3.backgroundColor = [UIColor yellowColor];
    }
    return _view3;
}


- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"MAAutoLayout is a sample Code for AutoLayout";
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end

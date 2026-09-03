//
//  MAAutoLayoutTests.m
//  MAAutoLayoutTests
//
//  Created by ma772528138@qq.com on 11/28/2017.
//  Copyright (c) 2017 ma772528138@qq.com. All rights reserved.
//

@import XCTest;
#import "MAAutoLayout.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

/// 1. 测试直接传原生 Anchor（例如 make.bottom.lessThanOrEqualTo(superview.keyboardLayoutGuide.topAnchor)）
- (void)testKeyboardLayoutGuideAnchor
{
    UIView *superview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    UIView *subview = [[UIView alloc] init];
    [superview addSubview:subview];
    
    [subview ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(superview);
        make.left.equalTo(superview);
        make.right.equalTo(superview);
        make.bottom.lessThanOrEqualTo(superview.keyboardLayoutGuide.topAnchor);
    }];
    
    NSLayoutConstraint *bottomConstraint = subview.ma_bottomMaker.layoutConstraint;
    XCTAssertNotNil(bottomConstraint);
    XCTAssertEqual(bottomConstraint.firstItem, subview);
    XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttributeBottom);
    XCTAssertEqual(bottomConstraint.relation, NSLayoutRelationLessThanOrEqual);
    XCTAssertEqual(bottomConstraint.secondItem, superview.keyboardLayoutGuide);
    XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttributeTop);
}

/// 2. 测试 MAAutoLayout 风格属性（例如 make.bottom.equalTo(superview.ma_keyboardLayoutGuideTop)）
- (void)testKeyboardLayoutGuideMAViewAttribute
{
    UIView *superview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    UIView *subview = [[UIView alloc] init];
    [superview addSubview:subview];
    
    [subview ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(superview);
        make.left.equalTo(superview);
        make.right.equalTo(superview);
        make.bottom.equalTo(superview.ma_keyboardLayoutGuideTop);
    }];
    
    NSLayoutConstraint *bottomConstraint = subview.ma_bottomMaker.layoutConstraint;
    XCTAssertNotNil(bottomConstraint);
    XCTAssertEqual(bottomConstraint.firstItem, subview);
    XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttributeBottom);
    XCTAssertEqual(bottomConstraint.relation, NSLayoutRelationEqual);
    XCTAssertEqual(bottomConstraint.secondItem, superview.keyboardLayoutGuide);
    XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttributeTop);
}

/// 3. 测试直接传入 UILayoutGuide 对象
- (void)testKeyboardLayoutGuideDirect
{
    UIView *superview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    UIView *subview = [[UIView alloc] init];
    [superview addSubview:subview];
    
    [subview ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.bottom.equalTo(superview.keyboardLayoutGuide);
    }];
    
    NSLayoutConstraint *bottomConstraint = subview.ma_bottomMaker.layoutConstraint;
    XCTAssertNotNil(bottomConstraint);
    XCTAssertEqual(bottomConstraint.secondItem, superview.keyboardLayoutGuide);
    XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttributeBottom);
}

/// 4. 测试 UIViewController 上的 ma_keyboardLayoutGuideTop
- (void)testViewControllerKeyboardLayoutGuide
{
    UIViewController *vc = [[UIViewController alloc] init];
    [vc loadViewIfNeeded];
    UIView *subview = [[UIView alloc] init];
    [vc.view addSubview:subview];
    
    [subview ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.bottom.equalTo(vc.ma_keyboardLayoutGuideTop);
    }];
    
    NSLayoutConstraint *bottomConstraint = subview.ma_bottomMaker.layoutConstraint;
    XCTAssertNotNil(bottomConstraint);
    XCTAssertEqual(bottomConstraint.secondItem, vc.view.keyboardLayoutGuide);
    XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttributeTop);
}

@end

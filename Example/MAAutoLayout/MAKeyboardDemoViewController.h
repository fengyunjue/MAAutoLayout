//
//  MAKeyboardDemoViewController.h
//  MAAutoLayout_Example
//
//  Created by admin on 2026/9/3.
//  Copyright © 2026 CocoaPods. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAKeyboardDemoViewController : UIViewController

@property (nonatomic, strong, readonly) UISegmentedControl *modeSegment;
@property (nonatomic, strong, readonly) UILabel *codeSnippetLabel;
@property (nonatomic, strong, readonly) UITextView *contentTextView;
@property (nonatomic, strong, readonly) UIView *bottomInputBar;
@property (nonatomic, strong, readonly) UITextField *bottomTextField;
@property (nonatomic, strong, readonly) UIButton *doneButton;

@end

NS_ASSUME_NONNULL_END

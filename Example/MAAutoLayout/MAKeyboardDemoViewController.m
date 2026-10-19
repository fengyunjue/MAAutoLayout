//
//  MAKeyboardDemoViewController.m
//  MAAutoLayout_Example
//
//  Created by admin on 2026/9/3.
//  Copyright © 2026 CocoaPods. All rights reserved.
//

#import "MAKeyboardDemoViewController.h"
#import "MAAutoLayout.h"

@interface MAKeyboardDemoViewController ()

@property (nonatomic, strong, readwrite) UISegmentedControl *modeSegment;
@property (nonatomic, strong, readwrite) UILabel *codeSnippetLabel;
@property (nonatomic, strong, readwrite) UITextView *contentTextView;
@property (nonatomic, strong, readwrite) UIView *bottomInputBar;
@property (nonatomic, strong, readwrite) UITextField *bottomTextField;
@property (nonatomic, strong, readwrite) UIButton *doneButton;

@end

@implementation MAKeyboardDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    self.title = @"Keyboard Layout Guide Demo";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(onClose)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(onDismissKeyboard)];

    [self setupSubviews];
    [self updateConstraintsForMode:0];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onDismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

- (void)onClose {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onDismissKeyboard {
    [self.view endEditing:YES];
}

- (void)setupSubviews {
    [self.view addSubview:self.modeSegment];
    [self.view addSubview:self.codeSnippetLabel];
    [self.view addSubview:self.contentTextView];
    [self.view addSubview:self.bottomInputBar];
    [self.bottomInputBar addSubview:self.bottomTextField];
    [self.bottomInputBar addSubview:self.doneButton];

    // 固定布局约束
    [self.modeSegment ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(self.view.ma_safeAreaLayoutGuideTop).offset(12);
        make.leftRight.equalTo(self.view).offsets(16);
        make.height.ma_equal(32);
    }];

    [self.codeSnippetLabel ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(self.modeSegment.ma_bottom).offset(8);
        make.leftRight.equalTo(self.view).offsets(16);
        make.height.ma_equal(40);
    }];

    [self.bottomTextField ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.left.equalTo(self.bottomInputBar).offset(12);
        make.centerY.equalTo(self.bottomInputBar);
        make.right.equalTo(self.doneButton.ma_left).offset(-8);
        make.height.ma_equal(36);
    }];

    [self.doneButton ma_makeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.right.equalTo(self.bottomInputBar).offset(-12);
        make.centerY.equalTo(self.bottomInputBar);
        make.size.ma_equalSize(50, 36);
    }];
}

- (void)onSegmentChanged:(UISegmentedControl *)sender {
    [self updateConstraintsForMode:sender.selectedSegmentIndex];
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)updateConstraintsForMode:(NSInteger)index {
    __weak typeof(self) weakSelf = self;
    if (index == 0) {
        self.codeSnippetLabel.text = @"make.bottom.equalTo(self.view.keyboardLayoutGuide.topAnchor);";
        [self.bottomInputBar ma_remakeConstraints:^(MAAutoLayout * _Nonnull make) {
            make.leftRight.equalTo(weakSelf.view);
            make.height.ma_equal(54);
            make.bottom.equalTo(weakSelf.view.keyboardLayoutGuide.topAnchor);
        }];
    } else if (index == 1) {
        self.codeSnippetLabel.text = @"make.bottom.equalTo(self.view.ma_keyboardLayoutGuideTop);";
        [self.bottomInputBar ma_remakeConstraints:^(MAAutoLayout * _Nonnull make) {
            make.leftRight.equalTo(weakSelf.view);
            make.height.ma_equal(54);
            make.bottom.equalTo(weakSelf.view.ma_keyboardLayoutGuideTop);
        }];
    } else {
        self.codeSnippetLabel.text = @"make.bottom.equalTo(self.view.keyboardLayoutGuide);";
        [self.bottomInputBar ma_remakeConstraints:^(MAAutoLayout * _Nonnull make) {
            make.leftRight.equalTo(weakSelf.view);
            make.height.ma_equal(54);
            make.bottom.equalTo(weakSelf.view.keyboardLayoutGuide);
        }];
    }

    // 中间内容文本区域自适应填充至工具条上方
    [self.contentTextView ma_remakeConstraints:^(MAAutoLayout * _Nonnull make) {
        make.top.equalTo(weakSelf.codeSnippetLabel.ma_bottom).offset(12);
        make.leftRight.equalTo(weakSelf.view).offsets(16);
        make.bottom.equalTo(weakSelf.bottomInputBar.ma_top).offset(-12);
    }];
}

#pragma mark - Lazy Loading

- (UISegmentedControl *)modeSegment {
    if (!_modeSegment) {
        _modeSegment = [[UISegmentedControl alloc] initWithItems:@[@"Anchor Top", @"MA Guide Top", @"Direct Guide"]];
        _modeSegment.selectedSegmentIndex = 0;
        [_modeSegment addTarget:self action:@selector(onSegmentChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _modeSegment;
}

- (UILabel *)codeSnippetLabel {
    if (!_codeSnippetLabel) {
        _codeSnippetLabel = [[UILabel alloc] init];
        _codeSnippetLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.06];
        _codeSnippetLabel.font = [UIFont fontWithName:@"Menlo" size:12] ?: [UIFont systemFontOfSize:12];
        _codeSnippetLabel.textColor = [UIColor systemBlueColor];
        _codeSnippetLabel.numberOfLines = 0;
        _codeSnippetLabel.textAlignment = NSTextAlignmentCenter;
        _codeSnippetLabel.layer.cornerRadius = 6;
        _codeSnippetLabel.layer.masksToBounds = YES;
    }
    return _codeSnippetLabel;
}

- (UITextView *)contentTextView {
    if (!_contentTextView) {
        _contentTextView = [[UITextView alloc] init];
        _contentTextView.font = [UIFont systemFontOfSize:14];
        _contentTextView.backgroundColor = [UIColor secondarySystemGroupedBackgroundColor];
        _contentTextView.layer.cornerRadius = 8;
        _contentTextView.layer.masksToBounds = YES;
        _contentTextView.text = @"1. Tap textfield below to show keyboard.\n2. Observe bottom bar sticking smoothly to keyboard top.\n3. Switch segments to test different API modes.\n4. Content TextView also adapts its height automatically.";
    }
    return _contentTextView;
}

- (UIView *)bottomInputBar {
    if (!_bottomInputBar) {
        _bottomInputBar = [[UIView alloc] init];
        _bottomInputBar.backgroundColor = [UIColor secondarySystemGroupedBackgroundColor];
        _bottomInputBar.layer.shadowColor = [UIColor blackColor].CGColor;
        _bottomInputBar.layer.shadowOpacity = 0.08;
        _bottomInputBar.layer.shadowOffset = CGSizeMake(0, -2);
        _bottomInputBar.layer.shadowRadius = 4;
    }
    return _bottomInputBar;
}

- (UITextField *)bottomTextField {
    if (!_bottomTextField) {
        _bottomTextField = [[UITextField alloc] init];
        _bottomTextField.placeholder = @"Type here to test keyboard guide...";
        _bottomTextField.borderStyle = UITextBorderStyleRoundedRect;
        _bottomTextField.font = [UIFont systemFontOfSize:14];
    }
    return _bottomTextField;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_doneButton setTitle:@"Done" forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [_doneButton addTarget:self action:@selector(onDismissKeyboard) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end

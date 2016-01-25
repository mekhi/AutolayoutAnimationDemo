//
//  ViewController.m
//  AutolayoutAnimationDemo
//
//  Created by limeijian on 16/1/25.
//  http://1gcode.com 
//  Copyright © 2016年 mekhi. All rights reserved.
//

#import "ViewController.h"
#import "MEKAnimationUtil.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldBottomLineConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *phoneIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *topTipsLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomTipsView;
@property (weak, nonatomic) IBOutlet UIButton *regButton;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // 用了autolayout 就不能通过改变控件的frame来实现动画
    _topTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _bottomTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    
    _phoneIconImageView.transform = CGAffineTransformMakeTranslation(-200, 0);
    
    //通过改变NSLayoutConstraint的constraint来实现动画
    _textFieldBottomLineConstraint.constant = 0;
    
    
    CGFloat progress = _numberTextField.text.length/11.0;
    
    [HomePageAnimationUtil registerButtonWidthAnimation:_regButton withView:self.view andProgress:progress];
    
    // 添加通知实时检测输入框
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLength) name:UITextFieldTextDidChangeNotification object:nil];
    // 设置numberTextField代理
    _numberTextField.delegate = self;
}

//实现通知方法
- (void)updateLength {
    CGFloat progress = _numberTextField.text.length/11.0;
    
    [HomePageAnimationUtil registerButtonWidthAnimation:_regButton withView:self.view andProgress:progress];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [HomePageAnimationUtil titleLabelAnimationWithLabel:_topTitleLabel withView:self.view];
    [HomePageAnimationUtil titleLabelAnimationWithLabel:_bottomTitleLabel withView:self.view];
    
    [HomePageAnimationUtil textFieldBottomLineAnimationWithConstraint:_textFieldBottomLineConstraint WithView:self.view];
    
    [HomePageAnimationUtil phoneIconAnimationWithLabel:_phoneIconImageView withView:self.view];
    
    [HomePageAnimationUtil tipsLabelMaskAnimation:_topTipsLabel withBeginTime:0];
    [HomePageAnimationUtil tipsLabelMaskAnimation:_bottomTipsView withBeginTime:1];
}

#pragma mark - UITextFieldDelegate

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // 控制注册只有在按钮在输入11位才可点击
    self.regButton.enabled = range.location == 11;
    // 控制输入手机号长度不能超过11位
    return range.location < 11;
} 


#pragma mark - override view method

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

@end

//
//  LoginViewController.m
//  EPB_LiShi
//
//  Created by lanou3g on 16/7/14.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property(strong,nonatomic) UIImageView *backgroundImgView;
@property(strong,nonatomic) UIView *backgroundView;

@property(strong,nonatomic) UITextField *usernameField;// 用户名
@property(strong,nonatomic) UITextField *passwordField;// 密码
//@property(strong,nonatomic)
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.rootVC.LSTabBar.hidden = YES;
    
    [self drawView];
    
    
}
-(void)drawView{
    // 添加背景图片
    self.backgroundImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.backgroundImgView.image = [UIImage imageNamed:@"IMG_5529.jpg"];
    [self.view addSubview:self.backgroundImgView];
    self.backgroundImgView.userInteractionEnabled = YES;
    self.backgroundView = [[UIView alloc] initWithFrame:self.backgroundImgView.bounds];
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.backgroundView.userInteractionEnabled = YES;
    // 在图片上添加view视图
    [self.backgroundImgView addSubview:self.backgroundView];
    // 添加用户名textfield
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, WindownWidth*2/3, WindowHeight/10)];
    
    self.usernameField.backgroundColor = [UIColor whiteColor];
    self.usernameField.layer.cornerRadius = 10;
    self.usernameField.layer.masksToBounds = YES;
    self.usernameField.placeholder = @"请输入用户名";
    self.usernameField.alpha = 0.85;
    self.usernameField.center = CGPointMake(self.view.center.x, self.view.center.y / 2);
    // 密码textfield
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, WindownWidth*2/3, WindowHeight/10)];
    
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.passwordField.layer.cornerRadius = 10;
    self.passwordField.layer.masksToBounds = YES;
    self.passwordField.placeholder = @"请输入密码";
    self.passwordField.alpha = 0.85;
    self.passwordField.center = CGPointMake(self.view.center.x, self.view.center.y / 2 + WindowHeight / 10 + 1);
    self.passwordField.secureTextEntry = YES;// 密文输入
    
    [self.backgroundView addSubview:self.usernameField];
    [self.backgroundView addSubview:self.passwordField];
    
    // 添加登录按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(0, 0, WindownWidth*2/3, WindowHeight/11);
    [loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    loginBtn.backgroundColor = [UIColor colorWithRed:220.0 green:219.0 blue:195.0 alpha:1];
    loginBtn.layer.cornerRadius = 10;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.alpha = 0.85;
    loginBtn.center = CGPointMake(self.view.center.x, self.view.center.y  + WindowHeight / 11 );
    
    [self.backgroundView addSubview:loginBtn];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

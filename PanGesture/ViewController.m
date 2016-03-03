//
//  ViewController.m
//  PanGesture
//
//  Created by 张昭 on 16/3/3.
//  Copyright © 2016年 张昭. All rights reserved.
//

#import "ViewController.h"
#import "SignatureView.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) SignatureView *signView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"画板";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.signView = [[SignatureView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 114)];
    [self.view addSubview:self.signView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"查看签名" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.signView) {
        [self.signView removeFromSuperview];
        self.signView = [[SignatureView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 50)];
        [self.view addSubview:self.signView];

    }
}

- (void)clickedBtn:(UIButton *)sender {
    SecondViewController *second = [[SecondViewController alloc] init];
    
    second.image = [self saveScreen];
    
    [self.navigationController pushViewController:second animated:YES];
}

- (UIImage *)saveScreen {
    
    // 截屏
    UIView *screenView = self.signView;
    UIGraphicsBeginImageContext(screenView.bounds.size);
    [screenView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

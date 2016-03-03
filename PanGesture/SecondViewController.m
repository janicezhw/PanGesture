//
//  SecondViewController.m
//  PanGesture
//
//  Created by 张昭 on 16/3/3.
//  Copyright © 2016年 张昭. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 300, 400)];
    myImage.center = self.view.center;
    [self.view addSubview:myImage];
    myImage.image = self.image;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"保存到相册" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickedBtn:(UIButton *)sender {
    // 保存到本地相册

    UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil);

    [self.navigationController popViewControllerAnimated:YES];
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

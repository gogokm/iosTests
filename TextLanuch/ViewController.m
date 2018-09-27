//
//  ViewController.m
//  TextLanuch
//
//  Created by fdt on 2017/4/27.
//  Copyright © 2017年 fdt. All rights reserved.
//

#if DEBUG_MODE
#define NSLog( s, ...) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#define NSLog(...) NSLog(__VA_ARGS__);
#else
//#define NSLog(...)
#endif

//#ifdef DEBUG
//#define NSLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )//分别是方法地址，文件名，在文件的第几行，自定义输出内容
//#else
//#define NSLog( s, ... )
//#endif

//#ifdef DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(FORMAT, ...) nil
//#endif

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [UIImage imageNamed:@"bg@2x.jpg"];
    
//    NSDecimalNumber *num = [NSDecimalNumber decimalNumberWithString:@"10.01"];
//    NSLog(@"---%@",num);
//
//    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithMantissa:12345 exponent:-3 isNegative:NO];
//    NSLog(@"number:%@",number);

//    NSDecimalNumber *a = [NSDecimalNumber decimalNumberWithDecimal:[num decimalValue]];
//    NSLog(@"---%@",a);
//    
//    NSDecimalNumber *b = [num decimalNumberByAdding:number];
//    NSLog(@"---%@",b);
//
//    NSDecimalNumberHandler *hander = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp scale:2 raiseOnExactness:nil raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
//    NSDecimalNumber *c = [number decimalNumberByRoundingAccordingToBehavior:hander];
//    NSLog(@"c:%@",c);
    
    UIButton *alertBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    [alertBtn setTitle:@"点击" forState:(UIControlStateNormal)];
    alertBtn.backgroundColor = [UIColor brownColor];
    [alertBtn addTarget:self action:@selector(addAlert:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:alertBtn];
    
//    NSString *text = @"123";
//    NSScanner *scancer = [NSScanner scannerWithString:text];
//    CGFloat flot;
//    int intl;
//    BOOL isNum = [scancer scanDouble:NULL];
//    BOOL ints = [scancer scanInt:&intl];
//    BOOL isEnd = [scancer isAtEnd]; // 是否扫描到末尾
//    NSLog(@"%d----%d",isNum,isEnd);
    
//    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"当前不是Wifi网络，您要继续观看直播吗？"
//                                                   delegate:self cancelButtonTitle:@"不看了"
//                                          otherButtonTitles: @"继续观看", nil];
//    [alert show];

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld",buttonIndex);
}

-(void)addAlert:(UIButton *)button {
    NSString *str = @"log";
    if ([str isEqualToString:@"log"]) {
        NSLog(@"AAA");
    }else {
        NSLog(@"BB");
    }
    
//    // 旋转
//    [UIView animateWithDuration:1.0 animations:^{
//        button.transform = CGAffineTransformMakeRotation(M_PI);
//    }];
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"标题" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"晓标题" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self popoverPresentationController];
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"2标题" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self popoverPresentationController];
    }]];
    [self presentViewController:alertVC animated:YES completion:^{
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

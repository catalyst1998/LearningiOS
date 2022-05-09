//
//  HypnosisterViewController.m
//  Hypnosister
//
//  Created by Goggles on 2022/5/7.
//

#import "HypnosisterViewController.h"
#import "HypnosisView.h"

@interface HypnosisterViewController ()<UITextFieldDelegate>

@end

@implementation HypnosisterViewController
/*
 重写loadView方法
 */
- (void)loadView{
    HypnosisView *backgroundView = [[HypnosisView alloc] init];
    
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(60, 130, 160, 40)];
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    textFiled.placeholder = @"Hypnotize me.";
    textFiled.returnKeyType = UIReturnKeyDone;
    
    //设置textField的委托为视图控制器
    textFiled.delegate = self;
    
    [backgroundView addSubview:textFiled];
    self.view = backgroundView; //viewcontroller有一个view属性，负责管理视图层级
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
    self.tabBarItem.title = @"hypnosis";
        self.tabBarItem.image = [UIImage imageNamed:@"moon.stars aq"];
    }
    return self;
}

/*
 实现UITextFieldDelegate的方法
 NOTE:视图控制器不需要实现UITextField对象所有的委托方法，该对象会在运行时检查委托是否实现某个方法，如果没有实现就不会调用
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //textField就是委托给视图控制器的对象
    NSLog(@"%@",textField.text);
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

/*
 在屏幕上随机位置绘制20个UILabel对象，方法需要一个NSString参数，表示需要展示的文字
 */
- (void)drawHypnoticMessage:(NSString *)message{
    for(int i = 0; i < 20; i++){
        
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.text = message;
        
        messageLabel.backgroundColor = [UIColor clearColor];
        
        messageLabel.textColor = [UIColor blackColor];
        
        [messageLabel sizeToFit];
        
        int availabelWidth = (int)( self.view.bounds.size.width - messageLabel.frame.size.width);
        
        int x = arc4random() % availabelWidth;
        
        int availableHeight = (int)(self.view.bounds.size.height - messageLabel.frame.size.height);
        
        int y = arc4random() % availableHeight;
        
        CGRect frame = messageLabel.frame;
        
        frame.origin = CGPointMake(x, y);
        
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
//        UIInterpolatingMotionEffect *motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
//        motionEffect.minimumRelativeValue = @"-25";
//        motionEffect.maximumRelativeValue = @"25";
//        [messageLabel addMotionEffect:motionEffect];
    }
}
@end

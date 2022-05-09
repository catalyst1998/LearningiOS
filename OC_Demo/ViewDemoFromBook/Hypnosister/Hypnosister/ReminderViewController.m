//
//  ReminderViewController.m
//  Hypnosister
//
//  Created by Goggles on 2022/5/7.
//

#import "ReminderViewController.h"
/*
 reminderViewController包括一个UIDatePicker和一个UIbutton
 */
@interface ReminderViewController ()
/*
 这里将outlet变量声明成弱引用是因为，当系统内存不够的时候，视图控制器会自动释放其视图，并在需要的时候重新创建。因此使用弱引用的outlet变量指向view的子视图，以便在释放view的同时释放view的所有子视图，避免内存泄漏。
 NOTE：rvc通过view属性间接持有UIdatapick对象和UIButton对象，并且有一个属性datapicker 弱引用指向UIdatapicker。当需要释放view属性所持有的对象时，如果datapicker属性时强引用的，那么UIDatapicker对象就不会被销毁，从而造成了内存泄漏。
 */
@property (nonatomic,strong) UIDatePicker *datePicker;
@property (nonatomic,strong) UIButton *button;
@end

@implementation ReminderViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"");
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(70, 200, 200, 200)];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(130, 300, 80, 30)];
    [self.button setTitle:@"confirm" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(addReminder) forControlEvents:UIControlEventTouchUpInside];
    self.button.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.datePicker];
    [self.view addSubview:self.button];
}

-(void)addReminder{
    NSDate *date = self.datePicker.date;
     NSLog(@"%@",date);
    

//    UILocalNotification *notification = [[UILocalNotification alloc] init];
//    notification.alertBody = @"Hypnotize me!";
//    notification.fireDate = date;
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"reminder";
        self.tabBarItem.image = [UIImage imageNamed:@"alarm"];
        
    }
    return self;
}

@end

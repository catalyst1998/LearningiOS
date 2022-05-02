//
//  ViewController.m
//  KVC_Demo
//
//  Created by 玛卡巴卡 on 2022/4/30.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person *p = [[Person alloc] init];
    NSString *name = [p valueForKey:@"name"];
    NSLog(@"name:%@",name);
    /*
     当为给Person类定义name属性的时候，会报一下错误：
     Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<Person 0x6000025844d0> valueForUndefinedKey:]: this class is not key value coding-compliant for the key name.'
     当定义了实例变量name _name isname _isname后，valueForKey会先找到_name _isname name isname
     
     KVC调用顺序：
     ｜- 先调用相关方法：
        |- getter方法：getKey -> Key ->isKey
        ｜-NSArray方法：countKey和objectInKeyAtIndex
     ｜— 如果没有相关的方法：看+ (BOOL)accessInstanceVariablesDirectly 的返回值
        ｜- YES的话，调用顺序为：_Key -> _isKey -> Key ->isKey
        ｜- NO的话，如果重写了valueforUndefinedKey就会调用该方法，否则异常处理，valueForUndefinedKey
     
     */
    
    NSObject *dog = [p valueForKey:@"dog"];
    id age= [dog valueForKey:@"age"];
    NSLog(@"dog's age:%@",age);
    
    //简化，嵌套
    id age2 = [p valueForKeyPath:@"dog.age"];
    NSLog(@"dog's age:%@",age2);

}


@end

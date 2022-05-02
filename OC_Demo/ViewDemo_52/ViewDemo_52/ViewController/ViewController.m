//
//  ViewController.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController

   
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    TestView *view = [[TestView alloc]init];
//    view.backgroundColor = [UIColor blueColor];
//    view.frame = CGRectMake(100, 100, 100, 100);
    
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"Click Me!";
//    label.frame = CGRectMake(10, 10,100,100);
//    label.textColor = [UIColor redColor];
//    [view addSubview:label];
    
     
//    UIView *view2 = [[UIView alloc]init];
//    view2.backgroundColor = [UIColor blackColor];
//    view2.frame = CGRectMake(170, 170, 100, 100);
    
//    // 为view2添加一个点击事情，跳转到新的页面
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [view addGestureRecognizer:tapGesture];
    /*
     UITableView只是视图，只负责展示，协助管理，不管理数据，需要为view提供所需的数据和cell
     通过delegat模式没实现uitableviewdatasource
     */
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    
    
    [self.view addSubview:tableView];
//    [self.view addSubview:view2];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //系统提供复用回收池，根据reuseidentifier从回收池中取到被回收的指定identifier的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
    //如果没有取到，比如说当初始化的时候，
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"message"];  //cellstyle 有四种 subtitle是有副标题
    }
      
    //cell中常用的属性设置：detailtextlabel、textlabel、imageview、contentview
    cell.textLabel.text = @"好友名称";
    cell.detailTextLabel.text = @"最后接收到的消息";
    return cell;
}

-(void) pushController{
    //创建一个要跳转的页面
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    //设置顶部导航栏的标题和右侧的button
    viewController.navigationItem.title = @"Elon Musk";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Follow" style:UIBarButtonItemStylePlain target:self action:nil];    //不设置响应
    [self.navigationController pushViewController:viewController animated:YES];
}

@end


 

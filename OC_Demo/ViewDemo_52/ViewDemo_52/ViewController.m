//
//  ViewController.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "ViewController.h"
#import "GTableViewCell.h"
#import "DetailViewController.h"
#import "GDeleteCellView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,GTableViewCellDelegate>

@end

@implementation ViewController

   
- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [tableView addGestureRecognizer:tapGesture];     //tableView注册手势事件
    
    [self.view addSubview:tableView];
}

//设置每行的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
//设置有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //系统提供复用回收池，根据reuseidentifier从回收池中取到被回收的指定identifier的cell
    GTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
    //如果没有取到，比如说当初始化的时候，
    if(!cell){
        cell = [[GTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"message"];  //cellstyle 有四种 subtitle是有副标题
        
    }
    cell.delegate = self;
    //调用自定义的layout方法
    [cell layoutTableViewCell];
    
    return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton{
    
    GDeleteCellView *deleteView = [[GDeleteCellView alloc] initWithFrame:self.view.bounds];
    [deleteView showDeleteView];
    NSLog(@"----");
}



-(void) pushController{
    //创建一个要跳转的页面
    DetailViewController *viewController = [[DetailViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    //设置顶部导航栏的标题和右侧的button
    viewController.navigationItem.title = @"goggles's zoom";
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Follow" style:UIBarButtonItemStylePlain target:self action:nil];    //不设置响应
    [self.navigationController pushViewController:viewController animated:YES];
}

@end


 

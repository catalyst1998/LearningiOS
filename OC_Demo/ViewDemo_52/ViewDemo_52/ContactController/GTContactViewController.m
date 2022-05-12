//
//  GTContactViewController.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "GTContactViewController.h"

@interface GTContactViewController ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation GTContactViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController = [[UIViewController alloc] init];
    //设置顶部导航栏的标题和右侧的button
    viewController.navigationItem.title = [NSString stringWithFormat:@"好友-%@",@(indexPath.row)];
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看信息" style:UIBarButtonItemStylePlain target:self action:nil];    //不设置响应
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friends"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"friends"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"好友-%@",@(indexPath.row)];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [cell addGestureRecognizer:tapGesture];
    
    return cell;
}


#pragma mark - TapGesture Selector

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

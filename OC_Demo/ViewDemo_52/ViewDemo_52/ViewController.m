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
@property (nonatomic,strong,readwrite) UITableView *tableView;
@property   (nonatomic,strong,readwrite) NSMutableArray *dataArray;
@end

@implementation ViewController

- (instancetype)init{
    self = [super init];
    if(self){
        _dataArray = @[].mutableCopy;
        for(int i = 0; i < 5; i++){
            [_dataArray addObject:@(i)];
        }
    }
    return self;
    
}
   
- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [_tableView addGestureRecognizer:tapGesture];     //tableView注册手势事件
    
    [self.view addSubview:_tableView];
}

//设置每行的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
//设置有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
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
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    
    __weak typeof(self) wself =self;
    
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        //删除该行
        __strong typeof(wself) strongSelf = wself;
        NSIndexPath *delIndexPath = [strongSelf.tableView indexPathForCell:tableViewCell];
        [strongSelf.dataArray removeObjectAtIndex:delIndexPath.row];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[delIndexPath]                withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
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


 

//
//  GTChatViewController.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "GTNewsViewController.h"
#import "GTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTSongLoader.h"
#import "GTListItem.h"
#import "GTSongItem.h"

@interface GTNewsViewController ()<UITableViewDataSource,UITableViewDelegate,GTableViewCellDelegate>

@property (nonatomic,strong,readwrite) UITableView *tableView;
@property   (nonatomic,strong,readwrite) NSArray *dataArray;

@property (nonatomic,strong,readwrite) GTListLoader *listLoader;

@property (nonatomic,strong,readwrite) GTSongLoader *songLoader;

@end

@implementation GTNewsViewController

#pragma mark - life cycle

- (instancetype)init {
	self = [super init];
	if(self) {
//        _dataArray = [[NSArray alloc] init];
//        for(int i = 0; i < 5; i++){
//            [_dataArray addObject:@(i)];
//        }
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	_tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
	_tableView.dataSource = self;
	_tableView.delegate = self;

//	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//	[_tableView addGestureRecognizer:tapGesture]; //tableView注册手势事件

	[self.view addSubview:_tableView];


	self.listLoader = [[GTListLoader alloc] init];
    
    self.songLoader = [[GTSongLoader alloc] init];
    

	__weak typeof(self) wself =self;

//	[self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
//	         __strong typeof(wself) strongSelf = wself;
//	         strongSelf.dataArray = dataArray;
//	         [strongSelf.tableView reloadData];
//	         NSLog(@"");
//	 }];
    
    [self.songLoader loadSongDataWithFinishBlock:^(BOOL success, NSArray<GTSongItem *> * _Nonnull dataArray) {
             __strong typeof(wself) strongSelf = wself;
             strongSelf.dataArray = dataArray;
             [strongSelf.tableView reloadData];
             NSLog(@"");
     }];
}


#pragma mark - UITableViewDelegate
/*
   实现UITableViewDelegate的方法
 */
//设置每行的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//	GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
//
//  GTDetailViewController *controller = [[GTDetailViewController alloc] initWithString:item.articleUrl];
    
    GTSongItem *item = [self.dataArray objectAtIndex:indexPath.row];

	GTDetailViewController *controller = [[GTDetailViewController alloc] initWithString:item.picUrl];
    

	controller.view.backgroundColor = [UIColor whiteColor];
	//设置顶部导航栏的标题和右侧的button
    
	controller.navigationItem.title = item.artist;
  
//    controller.navigationItem.title = item.title;

    [self.navigationController pushViewController:controller animated:YES];

    
    //实现已读功能
//    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniqueKey];
//    NSLog(@"");
}

#pragma mark - UITableViewDataSource

/*
   UITableViewDataSource 有两个required方法：
   1. tableView:numberOfRowsInSection:
   2. tableView:(UITableView *)tableView cellForRowAtIndexPath:
 */
//设置一个section有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _dataArray.count;
}

/*
   指定行的cell需要展示什么内容，包括初始化cell，设置cell的delegate为自定义的delegate
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	//系统提供复用回收池，根据reuseidentifier从回收池中取到被回收的指定identifier的cell
	GTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
	//如果没有取到，比如说当初始化的时候，
	if(!cell) {
		cell = [[GTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"message"]; //cellstyle 有四种 subtitle是有副标题
	}
	cell.delegate = self;
    
	//调用自定义的layout方法
    
//	GTListItem *itemAtIndex = [_dataArray objectAtIndex:indexPath.row];
//	[cell layoutTableViewCellWithItem:itemAtIndex];
    
    GTSongItem *itemAtIndex = [_dataArray objectAtIndex:indexPath.row];
    [cell layoutTableViewCellWithSongItem:itemAtIndex];

	return cell;
}

#pragma mark - GTTableViewCellDelegate

/*
   实现自定义的delegate中的方法
 */
//- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton{
//    //初始化deleteview
//    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];    //从cell坐标系转换到window坐标
//
//    __weak typeof(self) wself =self;
//
////调用展示删除界面的消息，并在block中完成删除
//    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
////删除该行
//        __strong typeof(wself) strongSelf = wself;
//        NSIndexPath *delIndexPath = [strongSelf.tableView indexPathForCell:tableViewCell];
//        [strongSelf.dataArray removeObjectAtIndex:delIndexPath.row];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[delIndexPath]                withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
//    NSLog(@"----");
//
//}


#pragma mark - TapGesture Selector


//-(void) pushController{
//    //创建一个要跳转的页面
//    GTDetailViewController *viewController = [[GTDetailViewController alloc] initWithString:<#(nonnull NSString *)#>];
//    viewController.view.backgroundColor = [UIColor whiteColor];
//    //设置顶部导航栏的标题和右侧的button
//    viewController.navigationItem.title = @"goggles's zoom";
//    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Follow" style:UIBarButtonItemStylePlain target:self action:nil];    //不设置响应
//    [self.navigationController pushViewController:viewController animated:YES];
//}

@end




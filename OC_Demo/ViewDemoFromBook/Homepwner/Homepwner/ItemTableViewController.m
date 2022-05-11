//
//  ItemTableViewController.m
//  Homepwner
//
//  Created by Goggles on 2022/5/9.
//

#import "ItemTableViewController.h"
#import "Item.h"
#import "ItemStore.h"

@interface ItemTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (instancetype)init{
    //1.在新的指定初始方法中调用父类的指定初始方法
    self = [super initWithStyle:UITableViewStylePlain];
    if(self){
        for(int i=0; i<5; i++){
            [[ItemStore sharedStore] createItem];
        }
    }
    return self;
}

    //2.重写父类的指定初始方法，并调用新的指定初始方法
//- (instancetype)initWithStyle:(UITableViewStyle)style{
//    return [self init];
//}









#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[ItemStore sharedStore] allItems] count];
}

/*
 tableView:cellForRowAtIndexPath是datasource协议的另一个必须方法，用于构建指定行的cell应该是什么
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell对象，指定风格和复用的id
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //获取allItems，根据row的行号从allitems从获取item
    NSArray *items = [[ItemStore sharedStore] allItems];
    Item *item = items[indexPath.row];
    //再将item的description展示在界面上
    cell.textLabel.text = [item description];
    return cell;
}

@end

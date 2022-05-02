//
//  VideoController.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/2.
//

#import "VideoController.h"

@interface VideoController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation VideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建layout，用于collection的布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
//    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width-10)/2, 200);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    //注册需要复用的cell的class类型
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"video"];
    
    [self.view addSubview:collectionView];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"video" forIndexPath:indexPath];
    if(!cell){
        cell = [[UICollectionViewCell alloc] init];
    }
    cell.backgroundColor = [UIColor blueColor];
    return cell;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.item%3 == 0){
        return CGSizeMake(self.view.frame.size.width, 200);
    }else{
        return CGSizeMake((self.view.frame.size.width-10)/2, 200);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

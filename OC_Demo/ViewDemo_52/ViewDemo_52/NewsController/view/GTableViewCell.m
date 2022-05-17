//
//  GTableViewCell.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/5.
//

#import "GTableViewCell.h"
#import "GTListItem.h"
#import "GTSongItem.h"
#import "SDWebImage.h"

@interface GTableViewCell()
@property (nonatomic,strong,readwrite) UILabel *titleLabel;
@property (nonatomic,strong,readwrite) UILabel *sourceLabel;
@property (nonatomic,strong,readwrite) UILabel *commentLabel;
@property (nonatomic,strong,readwrite) UILabel *timeLabel;

@property (nonatomic,strong,readwrite) UIImageView *newsPic;

@property (nonatomic,strong,readwrite) UIButton *deleteButton;
@end

@implementation GTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self.contentView addSubview:({
            self.newsPic = [[UIImageView alloc] initWithFrame:CGRectMake(290,10, 80, 80)];
            self.newsPic.contentMode =  UIViewContentModeScaleAspectFit;
            self.newsPic;
        })];
        
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,15,270,50)];
//            self.titleLabel.backgroundColor = [UIColor grayColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,70,50,20)];
//            self.messageLabel.backgroundColor = [UIColor grayColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,70,30,20)];
//            self.messageLabel.backgroundColor = [UIColor grayColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];


        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150,70,130,20)];
//            self.timeLabel.backgroundColor = [UIColor grayColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(300,60,25,25)];
            self.deleteButton.backgroundColor = [UIColor systemGrayColor];
            [self.deleteButton setTitle:@"n" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"y" forState:UIControlStateHighlighted];
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            
            //调用CALayer，绘制圆角
            self.deleteButton.layer.cornerRadius = 7;
            self.deleteButton.layer.masksToBounds = YES;
            
            self.deleteButton;
        })];
         
        
    }
    return self;
}



/// news list layout
/// @param item the news item
- (void)layoutTableViewCellWithItem:(GTListItem *)item{
//    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniqueKey];
//    
//    if(hasRead){
//        self.titleLabel.textColor = [UIColor grayColor];
//    }else{
//        self.titleLabel.textColor = [UIColor blackColor];
//    }
    
    self.titleLabel.text = item.title;
    [self.titleLabel sizeToFit];

    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];

    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+10,
                                      self.commentLabel.frame.origin.y,
                                      self.commentLabel.frame.size.width,
                                      self.commentLabel.frame.size.height) ;

    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x+self.commentLabel.frame.size.width+10,
                                      self.timeLabel.frame.origin.y,
                                      self.timeLabel.frame.size.width,
                                      self.timeLabel.frame.size.height) ;
    self.deleteButton.frame =CGRectMake(self.timeLabel.frame.origin.x+self.timeLabel.frame.size.width+10,
                                        self.deleteButton.frame.origin.y,
                                        self.deleteButton.frame.size.width,
                                        self.deleteButton.frame.size.height) ;

    //将耗时的操作放到非主线程
    
//    NSThread *imageThread = [[NSThread alloc] initWithBlock:^{
//         UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.newsPic.image = image;
//    }];
//
//    imageThread.name = @"downloadImageThread";
//    [imageThread start];

    //使用GCD进程多线程的操作
//    dispatch_queue_global_t downloadQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_queue_main_t mainQueue =  dispatch_get_main_queue();
//    
//    dispatch_async(downloadQueue, ^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        dispatch_sync(mainQueue, ^{
//            self.newsPic.image = image;
//        });
//    });
    
    /*
     dispatch_once 只运行一次
     dispatch_source 事件源 自定义的触发和监听
     dispatch_group 管理一组GCD block
     dispatch_semaphore 信号量，用于实现线程间的同步
     dispatch_barrier_async 并发队列中的同步点
     */
    
    [self.newsPic sd_setImageWithURL:[NSURL URLWithString:item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            NSLog(@"");
    }];
}

//- (void)deleteButtonClick{
//    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
//        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
//    }
//}



/// song item layout
/// @param item the song item
- (void)layoutTableViewCellWithSongItem:(GTSongItem *)item{
    self.titleLabel.text = item.name;
    [self.titleLabel sizeToFit];
    
    self.sourceLabel.text = item.artist;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"comment";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+10,
                                      self.commentLabel.frame.origin.y,
                                      self.commentLabel.frame.size.width,
                                      self.commentLabel.frame.size.height) ;

    self.timeLabel.text = @"12:30";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x+self.commentLabel.frame.size.width+10,
                                      self.timeLabel.frame.origin.y,
                                      self.timeLabel.frame.size.width,
                                      self.timeLabel.frame.size.height) ;
    self.deleteButton.frame = CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+10,
                                        self.deleteButton.frame.origin.y,
                                        self.deleteButton.frame.size.width,
                                        self.deleteButton.frame.size.height) ;
    
//    NSThread *imageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.newsPic.image = image;
//    }];
//    
//    imageThread.name = @"downloadImageThread";
//    [imageThread start];
    
    dispatch_queue_global_t downloadQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_queue_main_t mainQueue =  dispatch_get_main_queue();

    dispatch_async(downloadQueue, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
        dispatch_sync(mainQueue, ^{
            self.newsPic.image = image;
        });
    });
    
//    [self.newsPic sd_setImageWithURL:[NSURL URLWithString:item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//            NSLog(@"");
//    }];
    
}
 
@end

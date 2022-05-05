//
//  GTableViewCell.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/5.
//

#import "GTableViewCell.h"
@interface GTableViewCell()
@property (nonatomic,strong,readwrite) UILabel *titleLabel;
@property (nonatomic,strong,readwrite) UILabel *messageLabel;
@property (nonatomic,strong,readwrite) UILabel *timeLabel;

@property (nonatomic,strong,readwrite) UIImageView *pictureImageView;

@property (nonatomic,strong,readwrite) UIButton *deleteButton;
@end

@implementation GTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20,15, 50, 50)];
            self.pictureImageView.contentMode =  UIViewContentModeScaleAspectFit;
            self.pictureImageView;
        })];
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80,20,150,20)];
//            self.titleLabel.backgroundColor = [UIColor grayColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(80,60,100,20)];
//            self.messageLabel.backgroundColor = [UIColor grayColor];
            self.messageLabel.font = [UIFont systemFontOfSize:10];
            self.messageLabel.textColor = [UIColor grayColor];
            self.messageLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(250,60,100,20)];
//            self.timeLabel.backgroundColor = [UIColor grayColor];
            self.timeLabel.font = [UIFont systemFontOfSize:10];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(300,20,60,40)];
            self.deleteButton.backgroundColor = [UIColor systemGrayColor];
            [self.deleteButton setTitle:@"delete" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"deleting" forState:UIControlStateHighlighted];
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton;
        })];
         
        
    }
    return self;
}

- (void)layoutTableViewCell{
    self.titleLabel.text = @"好友昵称";
    [self.titleLabel sizeToFit];
    
    self.messageLabel.text = @"最后的消息";
    [self.messageLabel sizeToFit];
    
    self.timeLabel.text = @"三分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.messageLabel.frame.origin.x+self.messageLabel.frame.size.width+50,
                                      self.messageLabel.frame.origin.y,
                                      self.messageLabel.frame.size.width,
                                      self.timeLabel.frame.size.height) ;
    self.pictureImageView.image = [UIImage imageNamed:@"bag.circle"];
}

- (void)deleteButtonClick{
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}
 
@end

//
//  GTableViewCell.h
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/5.
//

#import <UIKit/UIKit.h>
@class GTListItem;
@class GTSongItem;
NS_ASSUME_NONNULL_BEGIN

/// 点击删除按钮
@protocol GTableViewCellDelegate <NSObject>
- (void) tableViewCell:(UITableViewCell *) tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

/// 新闻列表cell
@interface GTableViewCell : UITableViewCell

@property (nonatomic,weak,readwrite) id<GTableViewCellDelegate> delegate;

- (void) layoutTableViewCellWithItem:(GTListItem *)item;
- (void)layoutTableViewCellWithSongItem:(GTSongItem *)item;
@end

NS_ASSUME_NONNULL_END

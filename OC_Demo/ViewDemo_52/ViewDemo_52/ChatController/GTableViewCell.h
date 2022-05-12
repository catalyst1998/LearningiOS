//
//  GTableViewCell.h
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GTableViewCellDelegate <NSObject>
- (void) tableViewCell:(UITableViewCell *) tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTableViewCell : UITableViewCell

@property (nonatomic,weak,readwrite) id<GTableViewCellDelegate> delegate;

- (void) layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END

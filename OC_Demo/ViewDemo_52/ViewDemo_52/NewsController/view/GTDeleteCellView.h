//
//  GDeleteCellView.h
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
-(void) showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock;

@end

NS_ASSUME_NONNULL_END

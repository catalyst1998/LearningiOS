//
//  DeleteCellView.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/5.
//

#import "DeleteCellView.h"
/*
 灰色浮层 和一个删除按钮的组件
 */
@interface DeleteCellView()

@property (nonatomic,strong,readwrite) UIView *backgroundView;
@property (nonatomic,strong,readwrite) UIButton *deleteButton;

@end



@implementation DeleteCellView

- (instancetype) initWithFram:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
//            [self.backgroundView addGestureRecognizer:({
//                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
//                tapGesture;
//            })];
            _backgroundView ;
        })];
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor redColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void) showDeleteView{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
- (void) dismissDeleteView{
    [self removeFromSuperview];
}
- (void) _clickButton{
    
    [self removeFromSuperview];
}

@end


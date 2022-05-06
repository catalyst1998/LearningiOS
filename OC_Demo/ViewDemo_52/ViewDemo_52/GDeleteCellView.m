//
//  GDeleteCellView.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/5.
//

#import "GDeleteCellView.h"

@interface GDeleteCellView ()

@property (nonatomic,strong,readwrite) UIView *backgroundView;
@property (nonatomic,strong,readwrite) UIButton *deleteButton;
@property (nonatomic,copy,readwrite) dispatch_block_t deleteBlock;
@end
@implementation GDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:frame];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.6;
            
            //增加点击的手势，使得点击浮层也能调用dismissdeleteview
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroundView;

        })];
        
        [self addSubview:({
            //初始的样子为deletebutton本身的point，通过添加动画，呈现一个渐变的过程
            _deleteButton =  [[UIButton alloc] initWithFrame:CGRectMake(0,0, 0, 0)];
            _deleteButton.backgroundColor = [UIColor blueColor];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton;
        })];
    }
    return self;
}

-(void) _clickButton{
    [self removeFromSuperview];
}
-(void) showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock{
    _deleteButton.frame = CGRectMake(point.x, point.y,200, 200);
    _deleteBlock = clickBlock;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
//    [UIView animateWithDuration:1.f animations:^{
//       //move deleteButton to assigned point,and change its size
//        self.deleteButton.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200 );
//    }];
    
    [UIView animateWithDuration:1.0f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        //move deleteButton to assigned point,and change its size
         self.deleteButton.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200 );
    } completion:^(BOOL finished){
        NSLog(@"finished");
    }];
    
    
}
-(void) dismissDeleteView{
    [self removeFromSuperview];
}

@end

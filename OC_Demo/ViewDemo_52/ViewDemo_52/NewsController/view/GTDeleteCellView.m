//
//  GTDeleteCellView.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/5.
//

#import "GTDeleteCellView.h"

@interface GTDeleteCellView ()

@property (nonatomic,strong,readwrite) UIView *backgroundView;
@property (nonatomic,strong,readwrite) UIButton *deleteButton;
@property (nonatomic,copy,readwrite) dispatch_block_t deleteBlock;
@end
@implementation GTDeleteCellView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [  super initWithFrame:frame];
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
    if(_deleteBlock){
        _deleteBlock();
    }
    [self removeFromSuperview];
}


/// 该方法是给viewcontroller调用的，因此要在头文件中声明。当用户点击cell中的删除按钮，会先执行展示deleteview的逻辑，当用户点击deleteview中的button才会触发clickbutton方法，该方法中会实现controller传入的关于删掉cell相关的block逻辑，最后调用remove方法，deletveview从屏幕上移除
/// @param point tableviewcell中deletebutton的位置
/// @param clickBlock viewcontroller关于删除cell的逻辑，这一部分逻辑写在block中，deleteblock把传入的block复制，并将这个block的逻辑，放在clickbutton中实现。
-(void) showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock{
    _deleteButton.frame = CGRectMake(point.x, point.y,200, 200);
    _deleteBlock = [clickBlock copy];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:1.0f
                          delay:0.f
         usingSpringWithDamping:0.5
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
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

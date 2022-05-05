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
            _deleteButton =  [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
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
-(void) showDeleteView{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
-(void) dismissDeleteView{
    [self removeFromSuperview];
}

@end

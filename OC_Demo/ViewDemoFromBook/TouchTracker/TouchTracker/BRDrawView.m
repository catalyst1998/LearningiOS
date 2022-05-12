//
//  BRDrawView.m
//  TouchTracker
//
//  Created by Goggles on 2022/5/10.
//

#import "BRDrawView.h"
#import "BRLine.h"

@interface BRDrawView ()<UIGestureRecognizerDelegate>

//@property (nonatomic,strong) BRLine *currentLine;
@property (nonatomic,strong) NSMutableDictionary *lineInprocess;

@property(nonatomic,strong) NSMutableArray *finishedLines;

@property(nonatomic,weak) BRLine *selectedLine; //之所以是weak，finished会保存了select，是强引用，如果删掉select，会自动置nil
@property (nonatomic,strong) UIPanGestureRecognizer *moveRecogzier;
@end

@implementation BRDrawView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if(self){
        self.lineInprocess = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor whiteColor];
        
        
        //接受多指操作
        self.multipleTouchEnabled = YES;
        
        //双击手势
        UITapGestureRecognizer *doubeTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        
        doubeTapRecognizer.numberOfTapsRequired = 2;
        
        doubeTapRecognizer.delaysTouchesBegan = YES;
        
        
        [self addGestureRecognizer:doubeTapRecognizer];
        
        //为了避免双击被拆分成两个单击，设置单击后暂时不识别，确定时不是双击再识别为单击

        //单击手势
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        [tapRecognizer addTarget:self  action:@selector(delete)];
        
        tapRecognizer.numberOfTapsRequired = 1;
        tapRecognizer.delaysTouchesBegan = YES;
        [tapRecognizer requireGestureRecognizerToFail:doubeTapRecognizer]; //相当于双击的优先权大于单击，比如三击会被识别为双击加单击
        
        
        [self addGestureRecognizer:tapRecognizer];
        
        //长按手势
        UILongPressGestureRecognizer *longReconizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
        
        [self addGestureRecognizer:longReconizer];
        
        //拖拽shoushi
        self.moveRecogzier = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveLine:)];
        self.moveRecogzier.delegate = self;
        self.moveRecogzier.cancelsTouchesInView = NO;       //如果是yes，拖拽手势会吃掉touchesbegan的uitouch对象，就无法创建BRLine对象了。
        [self addGestureRecognizer:self.moveRecogzier];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
//    NSLog(@");
    [[UIColor blackColor] set];
    for (BRLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
//    if(self.currentLine){
//        [[UIColor redColor]set];
//        [self strokeLine:self.currentLine];
//    }
    [[UIColor redColor] set];
    for(NSValue *key in self.lineInprocess){
        [self strokeLine:self.lineInprocess[key]];
    }
    
    if(self.selectedLine){
        NSLog(@"greenline");
        [[UIColor greenColor] set];
        [self strokeLine:self.selectedLine];
    }
}

- (void) strokeLine:(BRLine *)line{
    NSLog(@"划线");
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 7;
    path.lineCapStyle = kCGLineCapRound;
    [path moveToPoint:line.begin];
    [path addLineToPoint:line.end];
    [path stroke];
}
/*
 当触摸事件开始的时候，创建一个BRLine对象，将begin和end设置为发生触摸的位置，当开始移动时，不断改变end位置。当触摸结束，加入finishedline，并置currentLine为nil,dispaly，就会实现手指在屏幕上绘制的时候，是红色的线，当手离开屏幕会刚绘制的线会变成黑色的
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    /*
     处理多指操作
     */
    for(UITouch *touch in touches){
        BRLine *line = [[BRLine alloc] init];
        
        CGPoint location = [touch locationInView:self];

        line.begin = location;
        line.end = location;
        
        //key:touch value:line
        NSValue *key = [NSValue valueWithNonretainedObject:touch];  //该方法将touch对象的内存地址封装成NSValue对象，作为key。之所以可以将内存作为key是因为，在移动的过程，uitouch的内存地址没有发生改变。
        
        self.lineInprocess[key] = line;
    }
    /*
     单指操作
     */
//    UITouch *touch = [touches anyObject];
//    //根据触摸位置创建BRline对象，标记begin和end属性
//    CGPoint location = [touch locationInView:self];
//    self.currentLine = [[BRLine alloc] init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for(UITouch *touch in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        
        BRLine *line = self.lineInprocess[key];
        
        line.end = [touch locationInView:self];
    }
//    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInView:self];
//    self.currentLine.end =location;
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    for(UITouch *touch in touches){
        
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        BRLine *line = self.lineInprocess[key];
        
        [self.finishedLines addObject:line];
        [self.lineInprocess removeObjectForKey:key];
    }
//    [self.finishedLines addObject:self.currentLine];
//    self.currentLine = nil;
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    [self.lineInprocess removeAllObjects];
    
    [self setNeedsDisplay];
}

-(void) doubleTap:(UIGestureRecognizer *)gr{
    NSLog(@"recognized double tap");
    
    [self.lineInprocess removeAllObjects];
    [self.finishedLines removeAllObjects];
    
    [self setNeedsDisplay];
}

-(void) tap:(UIGestureRecognizer *)gr{
    NSLog(@"tap调用了");
    
    CGPoint point = [gr locationInView:self];   //返回发生手势的位置信息
    
    self.selectedLine = [self lineAtPoint:point];

    [self setNeedsDisplay];
    
//    if(self.selectedLine){
//
//
//        [self delete];
//    }
//    if(self.selectedLine){
//        //是视图成为UIMenuitem动作消息的目标
//        [self becomeFirstResponder];
//
//        UIMenuController *menu = [UIMenuController sharedMenuController];
//
//        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(delete:)];
//
//        menu.menuItems = @[deleteItem];
//
//        [menu setTargetRect:CGRectMake(50, 50, 30, 30) inView:self];
//
//        [menu setMenuVisible:YES animated:YES];
////        [menu showMenuFromView:self rect:CGRectMake(point.x, point.y, 2, 2)];
//        [self setNeedsDisplay];
//    }else{
//        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
//    }
//    [self setNeedsDisplay];
}

-(BRLine *) lineAtPoint :(CGPoint) p{
    for(BRLine *li in self.finishedLines){
        CGPoint start = li.begin;
        CGPoint end = li.end;
        /*
         将线段分为若干点，如果线段某个点距离p小于20，返回
         */
        for(float t = 0.0; t <= 1.0; t += 0.05){
            float x = start.x + t*(end.x-start.x);
            float y = start.y + t*(end.y-start.y);
            if(hypot(x-p.x, y-p.y)<20.0){
                return li;
            }
        }
    }
    return nil;
}

- (BOOL)becomeFirstResponder{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    if([window isKeyWindow]== NO){
        [window becomeKeyWindow];
        [window makeKeyAndVisible];
    }
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if(action == @selector(delete:)){
        return YES;
    }
    return NO;
}
-(void) delete{
    sleep(0.5);
    NSLog(@"delete");
    [self.finishedLines removeObject:self.selectedLine];

    [self setNeedsDisplay];
}

-(void) longPress:(UIGestureRecognizer *)gr{
    if(gr.state == UIGestureRecognizerStateBegan){
        CGPoint point = [gr locationInView:self];
        self.selectedLine = [self lineAtPoint:point];
        if(self.selectedLine){
            [self.lineInprocess removeAllObjects];
        }
    }else if(gr.state == UIGestureRecognizerStateEnded){
        self.selectedLine = nil;
    }
    [self setNeedsDisplay];
}

-(void) moveLine:(UIPanGestureRecognizer *)gr{
    NSLog(@"pan调用了");

    if(!self.selectedLine){
        return ;
    }
    if(gr.state == UIGestureRecognizerStateChanged){
        //移动距离
        CGPoint translation = [gr translationInView:self];
        
        CGPoint begin = self.selectedLine.begin;
        CGPoint end = self.selectedLine.end;
        
    
        begin.x += translation.x;
        begin.y += translation.y;
        
        end.x += translation.x;
        end.y += translation.y;
        
        self.selectedLine.begin = begin;
        self.selectedLine.end = end;
        
        [self setNeedsDisplay];
        
        [gr setTranslation:CGPointZero inView:self];
    }
}
/*
 允许长按和移动同时处理touch对象
 当UIGestureReconizer子类对象识别出特殊手势，并且另一个UIGestureReconizer子类对象也是识别出特殊手势后，
 允许两个UIGestureReconizer子类对象共享UITouch对象
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if(gestureRecognizer == self.moveRecogzier){
        return YES;
    }
    return NO;
}
@end

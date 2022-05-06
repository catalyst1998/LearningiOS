//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Goggles on 2022/5/6.
//

#import "HypnosisView.h"
//在类扩展里声明属性
@interface HypnosisView()

@property(nonatomic,strong) UIColor *circleColor;

@end

@implementation HypnosisView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor redColor];
        
    }
    return self;
}
/*
 重写dramRect方法，添加绘图逻辑，画一个圆
 */
- (void)drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    //calculate the point of center according to bounds
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    //select the min of them to dram the radius
//    float radius = (MIN(bounds.size.width, bounds.size.height)/2.0);
    
    
    /*
     use UIBezierPath to define the path of circle,and draw the path with some properties.
     go to see the developer documentation.
     */
    
    UIBezierPath *path = [[UIBezierPath alloc]init];    //create a path
//    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI*2 clockwise:YES]; //construct the path with center point radius and angles...
    
    
    //绘制同心圆,最外层圆形称为视图的外接圆
    //绘制完之后会发现同心圆的右侧出现了一条直线，这是因为path是连续不断的，要从外圆画内圆，需要移动，因此需要再每次循环开始的时候，将path的位置切换一下
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    for(float currentRadius = maxRadius; currentRadius>0; currentRadius -=30){
        [path moveToPoint:CGPointMake(center.x+currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI*2.0
                     clockwise:YES];
    }
    
    //after defining the path,we have to draw the path(even can make some Accessing Drawing Properties)
    
    path.lineWidth = 8;
    [self.circleColor setStroke];   //seStroke:Sets the color of subsequent stroke operations to the color that the receiver represents.
    [path stroke];
    //将图像文件绘制到视图上
//    UIImage *image = [UIImage imageNamed:@"power.circle.fill"];
//    [image drawInRect:rect];
}

    
    
/*
 重写touchesBeganwithEvent消息，用来处理触摸事件
 */
    
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"");
//}
    
    
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [[self nextResponder] touchesBegan:touches withEvent:event];
    UITouch *touch = touches.anyObject;
    NSLog(@"%@",@(touch.tapCount));
    float red = (arc4random()%100)/100.0;
    float blue = (arc4random()&100)/100.0;
    float green = (arc4random()%100)/100.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

@end

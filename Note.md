# 笔记
## MVC
+ View:用户可见的对象，如按钮、文本框、滑动条等。视图对象用来构建用户界面。
+ Model：模型对象负责存储数据，与用户界面无关。包括存储字符串的数组等。
+ Controller：控制器对象扮演“管家”的角色，它用于控制视图对象为用户呈
现的内容，以及负责确保视图对象和模型对象的数据保持一致。
> 注意：model和view之间没有直接的联系，而是通过controller来负责彼此间的消息发送和传递数据

## 视图
应用通常 只有一个UIWindow对象，UIWindow对象就像一个容器，负责包含应用中的所有视。应用需要在启动时创建并设置UIWindow对象，然后为其添加其他视图。加入窗口的视图会成为该窗口的子视图（subview）。窗口的子视图还可以有自己的子视图，从而构成一个以UIWindow对象为根视图的视图层次结构
视图绘制过程可以分为两步：
    1. 层次结构中的每个视图分别绘制自己。视
图会将自己绘制到图层（layer）上，每个UIView对象都有一个layer
属性，指向一个CALayer类的对象。
    2. 所有视图的图层组合成一幅图像，绘制到屏幕上。
    
### UIView
#### UIView生命周期函数
1. init：初始化
2. (void)willMoveToSuperview:(nullable UIView *)newSuperview；
3. (void)didMoveToSuperview；
4. (void)willMoveToWindow:(nullable UIWindow *)newWindow；
5.  (void)didMoveToWindow；

#### UIView属性
+ frame属性：保存视图大小和相对于父视图的位置.
    + CGRect包括了两个结构，origin和size。origin类型是CGPoint结构，分别表示x轴坐标和y轴坐标。size是CGSize结构，包含width和height。因此使用CGRect可以表示一个view的相对位置和大小




### UIViewController
#### UIViewController 生命周期
1. `init`:初始化
2. `Viewdidload`:在这一步中，初始化所有要在viewcontroller中展示的view，接着回去调用view的生命周期函数
3. `(void)viewWillAppear:(BOOL)animated`：当view和viewcontroller初始化结束后，调用该方法
4. `(void)viewDidAppear:(BOOL)animated`；
5. `(void)viewWillDisappear:(BOOL)animated`；
6. `(void)viewDidDisappear:(BOOL)animated`；
7. `dealloc`

### UITabBarController
>`UITabBarController`可以管理多个`UIViewController`，通过点击底部的按钮来实现页面的切换。
创建4～5个viewcontroller，再通过`setviewcontrollers`方法添加到tabbarcontroller里。通过`tabbaritem.title`来设置每个tabbar item的名字

### UINavigationController
初始化的时候可以设置rootviewcontroller作为栈底的view，在该view中设置一个点击事情，实现页面的跳转，这里用到了`tapGestureRecognizer` 回调函数，参数中的
action要自定义。通过navigationItem的title、rightbarbuttonItem等进行顶部导航栏设置

> 详细代码在ViewDemo_52中，层级结构为UIWindow-> UITabBarController-> NavigationController-> ViewController. 这种层级结构在点击底部的tabbar实现页面切换，且tabbar依然存在。
> 另一种层级结构：UIWindow-> NavigationController-> UITabBarController-> ViewController.如果是这种， 页面切换的时候底部的tabbar会随着页面消失

### UIWindow
> UIWindow作为容器和viewcontroller协同工作










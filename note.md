# 笔记
## MVC
+ View:用户可见的对象，如按钮、文本框、滑动条等。视图对象用来构建用户界面。
+ Model：模型对象负责存储数据，与用户界面无关。包括存储字符串的数组等。
+ Controller：控制器对象扮演“管家”的角色，它用于控制视图对象为用户呈
现的内容，以及负责确保视图对象和模型对象的数据保持一致。
> 注意：model和view之间没有直接的联系，而是通过controller来负责彼此间的消息发送和传递数据

## 视图
> 任何一个应用只有一个UIWindow对象， 
UIView生命周期函数
1. init：初始化
2. (void)willMoveToSuperview:(nullable UIView *)newSuperview；
3. (void)didMoveToSuperview；
4. (void)willMoveToWindow:(nullable UIWindow *)newWindow；
5.  (void)didMoveToWindow；
UIViewController 生命周期
1. init:初始化
2. Viewdidload:在这一步中，初始化所有要在viewcontroller中展示的view，接着回去调用view的生命周期函数
3. (void)viewWillAppear:(BOOL)animated：当view和viewcontroller初始化结束后，调用该方法
4. (void)viewDidAppear:(BOOL)animated；
5. (void)viewWillDisappear:(BOOL)animated；
6.  (void)viewDidDisappear:(BOOL)animated；
7. dealloc

UITabBarController

# minutia-Experiment
iOS常用编程中所作一些测试


## NSNotification

	Q: NSNotification在子线程中发发送通知,监听通知事件的处理是在哪个线程
	A: 主线程发 ,主线程处理事件. 子线程发,子线程处理
	
	Q: NSNotification,同一个对象,重复监听同一个通知,那么通知事件的处理会多次触发么?
	A: 会,监听几次,事件就会触发几次.所以在使用时,init / viewDidLoad中添加的通知,在dealloc中移除; 在viewWillAppear中添加的通知,在viewWillDisappear中移除
	
	
## 混合渲染
	
	Q: layer切圆角一定会引起混合渲染?
	A: 使用layer.cornerRadius属性设置圆角,会引起混合渲染.使用layer.mask属性设置则不会.
	注: 测试时,使用UIButton做示例,发现title为英文时,titleLabel不会引起混合渲染.title为中文时,titleLabel部分依然会混合渲染.因为中文会多渲染出透明外边界,使用`button.titleLabel.layer.masksToBounds = YES`即可解决
	
	
## dealloc在哪个线程执行

	Q:对象的dealloc在哪个线程执行
	A:在该对象的引用计数变为0的线程被调用


## __Block如何作用
	Q:__Block 关键字修饰的变量,如何在block中作引用的
	A:在block引用变量时,变成对变量地址的引用.
	

## Static 变量内存地址的分配

    Q:一个类中定义一个 static 变量, 这个 static 变量是所有这个类的实例共同拥有同一个, 还是每个实例都有一个
    A:所有类实例共同拥有一个

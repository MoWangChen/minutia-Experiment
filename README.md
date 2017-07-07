# minutia-Experiment
iOS常用编程中所作一些测试

####NSNotification

	Q: NSNotification在子线程中发发送通知,监听通知事件的处理是在哪个线程
	A: 主线程发 ,主线程处理事件. 子线程发,子线程处理
	
	Q: NSNotification,同一个对象,重复监听同一个通知,那么通知事件的处理会多次触发么?
	A: 会,监听几次,事件就会触发几次.所以在使用时,init / viewDidLoad中添加的通知,在dealloc中移除; 在viewWillAppear中添加的通知,在viewWillDisappear中移除
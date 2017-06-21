# minutia-Experiment
iOS常用编程中所作一些测试

####NSNotification

	Q: NSNotification在子线程中发发送通知,监听通知事件的处理是在哪个线程
	A: 主线程发 ,主线程处理事件. 子线程发,子线程处理
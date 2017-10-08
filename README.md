# iRonSensitiveBtn

A Sensitive Button for iOS / 触感更灵敏的button控件

## Chinese

在我们的App项目中，我们的UI工程师有时候设计的按钮由于美观原因，设计得比较小，容易让用户误触或者不灵敏，这个时候我们就要从技术的角度去解决问题了。<br>

苹果官方文档有介绍，每个UIButton的响应大小应不小于44*44，小于这个大小，会让用户感动难以使用。所以我们的Button样式大小不管有没有小于44*44，其响应的范围不能小于。<br>


解决方法：<br>

  自定义UIButton，重写其-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event方法,这个方法是： 判断触点是否在范围内<br>
  
  <pre><code>
 Code：
  
 /* 重写 pointInside */
 - (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
 {
    CGRect bounds = self.bounds;
    /* 苹果官方认为点击热区应不小于44*44 */
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    
    return CGRectContainsPoint(bounds, point);
 }

</code></pre>


## English

In our App project,sometimes the UIer design the small button for the inspiration, therefore users can't enjoy their touching time -- insensitive 、confusing touching. As this time, the method can be come from the Technology.<br>

Apple says, each button's response area must bigger than 44*44. So, we can do this:<br>

user-defined a UIButton ,override the method: -(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event<br>

<pre><code>
 Code：
  
 /* overRide pointInside */
 - (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
 {
    CGRect bounds = self.bounds;
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    
    return CGRectContainsPoint(bounds, point);
 }

</code></pre>

# iRonSensitiveBtn

A Sensitive Button for iOS / 触感更灵敏的button控件

苹果官方文档有介绍，每个UIButton的响应大小应不小于44*44，小于这个大小，会让用户感动难以使用。所以我们的Button样式大小不管有没有小于44*44，其响应的范围不能小于。


解决方法：
  自定义UIButton，重写其-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event方法,这个方法是： 判断触电是否在范围内
  <pre><code>
    
  code：
 /* overRide pointInside */
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

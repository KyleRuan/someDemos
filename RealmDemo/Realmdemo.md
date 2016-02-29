#RealmDemo

##Realm的数据模型类
新建一个普通的 Swift 类继承自 `Object` 就是一个Realm的数据类型。因为 Realm 数据模型类的基类是 `Object`，所以 `Object` 的子类都可以扩展为 Realm 的模型类.Realm是支持以下Swift基本类型

1. `Int，Int8，Int16，Int32 和 Int64`
2. `Boolean`
3. `Float`
4. `String`
5. `NSDate`
6. `NSData`
7. 继承自 `Object` 的类 => 作为一对一关系（Used for One-to-one relations）
8. `List` => 作为一对多关系（Used for one-to-many relations）

需要注意的是对于类来说每个属性都需前都要添加关键字`dynamic`,这使得属性可以被数据库读写.但是除了泛型以外，因为在 Objective-C 运行时无法表示泛型属性。
##Realm的基本操作
（1）通过查询操作，Realm 将会返回包含 Object 集合的Results实例。Results 的表现和 Array 十分相似，并且包含在 Results 中的对象能够通过索引下标进行访问。 
（2）所有的查询（包括查询和属性访问）在 Realm 中都是延迟加载的，只有当属性被访问时，才能够读取相应的数据。 
（3）查询结果并不是数据的拷贝：修改查询结果（在写入事务中）会直接修改硬盘上的数据。

###Realm断言查询
支持断言查询(Predicate)，这样可以通过条件查询特定数据，同时可以使用链式查询数据


```
 //查询花费超过10元的消费记录(使用断言字符串查询)
consumeItems = self.realm.objects(ConsumeItem).filter("cost > 10")
         
//查询花费超过10元的购物记录(使用 NSPredicate 查询)
let predicate = NSPredicate(format: "type.name = '购物' AND cost > 10")
consumeItems = self.realm.objects(ConsumeItem).filter(predicate)
         
//使用链式查询
consumeItems = self.realm.objects(ConsumeItem).filter("cost > 10").filter("type.name = '购物'")


支持的断言：
比较操作数(comparison operand)可以是属性名称或者某个常量，但至少有一个操作数必须是属性名称；

比较操作符 ==、<=、<、>=、>、!=, 以及 BETWEEN 支持 int、long、long long、float、double 以及 NSDate 属性类型的比较，比如说 age == 45；

相等比较 ==以及!=，比如说Results<Employee>().filter("company == %@", company)比较操作符 == and != 支持布尔属性；

对于 NSString 和 NSData 属性来说，我们支持 ==、!=、BEGINSWITH、CONTAINS 以及 ENDSWITH 操作符，比如说 name CONTAINS ‘Ja’；

字符串支持忽略大小写的比较方式，比如说 name CONTAINS[c] ‘Ja’ ，注意到其中字符的大小写将被忽略；

Realm 支持以下复合操作符：“AND”、“OR” 以及 “NOT”。比如说 name BEGINSWITH ‘J’ AND age >= 32；

包含操作符 IN，比如说 name IN {‘Lisa’, ‘Spike’, ‘Hachi’}；
==、!=支持与 nil 比较，比如说 Results<Company>().filter("ceo == nil")。注意到这只适用于有关系的对象，这里 ceo 是 Company 模型的一个属性。

ANY 比较，比如说 ANY student.age < 21
注意，虽然我们不支持复合表达式类型(aggregate expression type)，但是我们支持对对象的值使用 BETWEEN 操作符类型。比如说，Results<Person>.filter("age BETWEEN %@", [42, 43]])。
```




[参考文献](https://realm.io/docs/swift/latest/)
##这个demo需要注意的地方
1. `lists = uiRealm.objects(TaskList)`返回值是`Results<TaskList>`类型
2. 所有对数据的操作都在` try! uiRealm.write`的闭包里
3. `prepareForSegue`的操作，`UITableView`是需要从view上拖出segue,而不是从`UITableviewCell`上拖出。这样调用的顺序是tableView的`didSelectRowAtIndexPath`,在这里面在执行`performSegueWithIdentifier`
4. `Results`的 `sorted`方法返回的是一个排序好的`Results`,并不是对原数据进行排序，也不是对数据库进行排序。
5. `tableView`的`editActionsForRowAtIndexPath`方法。




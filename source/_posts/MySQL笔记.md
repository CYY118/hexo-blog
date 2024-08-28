---
title: MySQL学习笔记
description: 🥧本文汇总Markdown格式以及外挂查询所有数据库标签在网页端的渲染效果，可作为文档进行查询
mathjax: true
tags:
  - Markdown
  - 外挂标签
categories:
  - 演示
abbrlink: 2013454d
sticky: 2
swiper_index: 2
date: 2022-08-09 18:19:03
updated: 2022-10-23 22:00:00
---

<meta name="referrer" content="no-referrer" />

## **MySQL学习笔记**

查询

查询所有数据库  纯音乐

show databases;

# DDL

查询所有数据库

> show databases；

查询当前数据库

> select database();

创建

> create database [if not exists] 数据库名 [default charset 字符集] [collate 排序规则];
>
> if not exists :如果数据库不存在则创建

删除

> drop database [if exists] 数据库名;

使用

> use 数据库名;

查询当前数据库所有表

> show tables;

查询表结构

> desc 表名;

查询指定表的建表语句

> show create table 表名;



图形化界面

![image-20230103213132978](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032131062.png)

# DQL

介绍：DQL是用来查询数据库中表的记录

关键字：==select==

语法：

```sql
select 
	字段列表
from
	表名列表
where
	条件列表
group by
	分组字段列表
having
	分组后条件列表
order by
	排序字段列表
limit
	分页参数
```

![image-20230103232214978](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032322061.png)

- 基本查询
- 条件查询（where）
- 聚合函数（count、max、min、avg、sum）
- 分组查询（gruop by）
- 排序查询（order by）
- 分页查询（limit）



## 基本查询

**查询多个字段**

```sql
select 字段1，字段2.... from 表名;

select * from 表名;
```

**设置别名**

列的别名只能在order by 中使用，不能在where中使用

```sql
select 字段1[as 别名1], 字段2[as 别名2]....  from 表名;
```

**去重复记录**

```sql
select distinct 字段列表 from 表名;
```



使用order by 对查询到的数据进行排序操作

升序：asc （默认）

降序：desc 

也可以使用列的别名，进行排序



+号的作用：

java：

- 运算符
- 连接符

mysql：

- 运算符 



concat函数：

concat拼接函数

```sql
SELECT CONCAT(`name`,author) AS "结果" from book;
```

![image-20221225164400767](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202212251644915.png)



ifnull函数：

ifnull（name，0）：如果name为null，那么name就等于0



## 条件查询

语法：

```sql
select 
	查询列表
from
	表名
where
	筛选条件;
```

分类 ：

- 按条件表达式筛选

  - 简单 条件运算符：< 	>	 =	 !=	 <> 	>= 	<=

- 按逻辑表达式筛选

  - java：&&    ||    ！
  - mysql：and	or	not

- 模糊查询

  - like

    - like不支持in的操作
    - 一般和通配符配合使用

    通配符：

    %  ：任意多个字符，包含了0个字符

    _    :  任意的单个字符

  - between   and 
  - in ：
    - 用于去判断某字段的值是否属于in列表中的某一项
    - 使用in提高语句的简洁度
    - in列表的值类型必须一致或兼容 
  - is null
    - sql语句中不能直接使用`= null`,而是要使用`is null`
    - = 或者 <> 不能用于判断null值

==is null **VS** <=>==

is null:

仅可以判断null值，可读性较高，建议使用

<=>:

既可以判断null值，又可以判断普通的数值，可读性较低

escape：在mysql中可以指定转义字符

![image-20230103213856564](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032138632.png)

![image-20230103215857927](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032158987.png)

## 聚合函数

**介绍**

将一列数据作为一个整体，进行纵向计算

**常见的聚合函数**

| 函数  | 功能     |
| ----- | -------- |
| count | 统计数量 |
| max   | 最大值   |
| min   | 最小值   |
| avg   | 平均值   |
| sum   | 求和     |

**语法**

> select 聚合函数(字段列表) from 表名

![image-20230103221527015](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032215118.png)

所有的null值不参与计算

## 分组查询

**语法**

> select 字段列表 form [where 条件] group by 分组字段名  [having 分组后过滤条件]

**where 和 having区别**

- 执行时机不同：where是分组之前进行过滤，不满足where条件，不参与分组；而having是分组之后对结果进行过滤
- 判断条件不同：where不能对聚合函数进行判断，而having可以



![image-20230103222240777](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032222836.png)

![image-20230103222256170](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032222214.png)



![image-20230103222418823](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032224894.png)



![image-20230103222740159](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301032227244.png)

==注意：==

- 执行顺序：where>聚合函数>having
- 分组之后，查询的字段一般为聚合函数和分组字段，查询其他字段无任何意义

## 排序查询

语法：

> select 字段列表 from 表名 order by 字段名 [asc/desc]

升序：asc （默认）

降序：desc

## 分页查询

**语法**

> select 字段列表 from 表名 limit 起始索引，查询记录数;



==注意：==

- 起始索引从0开始，起始索引 = （查询页码-1）*每页显示记录数
- 分页查询是数据库的方言，不同的数据库有不同的实现，mysql中是 limit
- 如果查询的是第一页数据，起始索引可以省略，直接简写为 limit 10



# DCL

DCL（数据控制语言），用来管理数据库 用户、控制数据库访问权限

## 管理用户

![image-20230105164629283](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301051646592.png)

```sql
#创建用户itcast，只能够在当前主机localhost访问，密码123456；
create user 'itcast'@'localhost' identified  by '123456';
#创建用户heima，可以在任意主机访问该数据库，密码123456；
create user 'heima'@'%' identified by '123456';
#修改用户heima 的访问密码为1234；
alter user 'heima'@'%' identified with mysql_native_password by '1234';
#删除itcast@localhost用户
drop user 'itcast'@'localhost';
```



# 函数

概念：是指一段可以直接被另一段程序调用的程序或代码

例如：![image-20230105215033600](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301052150833.png)

## 字符串函数

如下是常用的几个：

| 函数                     | 功能                                                      |
| ------------------------ | --------------------------------------------------------- |
| concat(s1,s2,...,sn)     | 字符串拼接                                                |
| lower（str）             | 将字符串全部转为小写                                      |
| upper（str）             | 将字符串全部转为大写                                      |
| lpad（str,n,pad）        | 左填充，用字符串pad对str的左边进行填充，达到n个字符串长度 |
| rpad（str,n,pad）        | 右填充，用字符串pad对str的右边进行填充，达到n个字符串长度 |
| trim(str)                | 去掉字符串头部和尾部的空格                                |
| substring(str,start,len) | 返回从字符串str从start位置起的len个长度的字符串           |

```sql
-- 字符串拼接
SELECT CONCAT('hello-','world!');

-- 全部转为大写
SELECT LOWER('HELLo');

-- 左填充
SELECT LPAD('01',5,'-');

-- 右填充
SELECT RPAD('01',5,'-');

-- 去除空格
SELECT TRIM(' hello world! ')

-- 字符串截取
SELECT SUBSTRING('hello world',1,5);

```

```sql
-- 练习：
-- 员工号显示五位数
UPDATE emp set workno=LPAD(workno,5,0);
```



## 数值函数

常见的数值函数

| 函数       | 功能                               |
| ---------- | ---------------------------------- |
| ceil(x)    | 向上取整                           |
| floor(x)   | 向下取整                           |
| mod(x,y)   | 返回x/y的模                        |
| rand()     | 返回0~1内的随机数                  |
| round(x,y) | 求参数x的四舍五入的值，保留y位小数 |

```sql
-- 向上取整
SELECT CEIL(1.5);

-- 向下取整
SELECT FLOOR(1.5);

-- 返回x/y的模,相当于x除以y取余
SELECT MOD(5,4);

-- 返回0~1内的随机数
SELECT rand();

-- 求参数x的四舍五入的值，保留y位小数
SELECT ROUND(1.423223,2);
```

```	sql
-- 练习：
-- 通过数据库的函数，生成一个六位数的随机验证码
SELECT LPAD(ROUND(rand()*1000000,0),6,'0');
-- 解析：
-- rand()：生成一个随机数
-- ROUND：四舍五入，保留0位小数
-- LPAD：向左填充补齐六位数字
```

## 日期函数

| 函数                              | 功能                                              |
| --------------------------------- | ------------------------------------------------- |
| curdate()                         | 返回当前日期                                      |
| curtime()                         | 返回当前时间                                      |
| now()                             | 返回当前日期和时间                                |
| year(date)                        | 获取指定date的年份                                |
| month(date)                       | 获取指定date的月份                                |
| day(date)                         | 获取指定date日期                                  |
| date_add(date,interval expr type) | 返回一个日期/时间值加上一个时间间隔expr后的时间值 |
| datediff(date1,date2)             | 返回起始时间date1和结束时间date2之间的天数        |

```sql
-- 返回当前日期
SELECT CURDATE();

-- 返回当前时间
SELECT CURTIME();

-- 返回当前日期和时间
SELECT NOW();

-- YEAR(),MONTH(),DAY()
SELECT YEAR(NOW());
SELECT month(NOW());
SELECT day(NOW());

-- date_add(date,interval expr type)返回一个日期/时间值加上一个时间间隔expr后的时间值
SELECT DATE_ADD(NOW(),INTERVAL 70 DAY);

-- DATEDIFF 返回起始时间date1和结束时间date2之间的天数
SELECT DATEDIFF(NOW(),'2024-01-05');

```

```sql
-- 练习：
-- 查询所有员工的入职天数，并根据入职天数倒序排序
SELECT `name`,DATEDIFF(CURDATE(),entrydate) 'entrydates'
FROM emp
ORDER BY entrydates desc;
```



## 流程控制函数

流程控制函数也是很常用的一类函数，可以在sql语句中实现条件筛选，从而提高语句的效率

| 函数                                                       | 功能                                                     |
| ---------------------------------------------------------- | -------------------------------------------------------- |
| if(value,t,f)                                              | 如果value的值true，则返回t，否则返回f                    |
| ifnull(value1,value2)                                      | 如果value1不为空，返回value1，否则返回value2             |
| case when [val1] then [res1] ... else [default] end        | 如果val1位true，返回res1，...否则返回default默认值       |
| case [expr] when [val1] then [res1] ... else [defalut] end | 如果expr的值等于val1，返回res1，...否则返回defalut默认值 |

```sql
-- if(value,t,f)如果value的值true，则返回t，否则返回f
SELECT IF(TRUE,'ok','FALSE');

-- ifnull(value1,value2)如果value1不为空，返回value1，否则返回value2
SELECT IFNULL('ok','defalut');
SELECT IFNULL(NULL,'defalut');

```

```sql
-- case 
-- when [val1] then [res1] ... 
-- else [default] 
-- end
-- 如果val1位true，返回res1，...否则返回default默认值
-- 需求：查询emp表的员工姓名和工作地址（上海/北京-->一线城市，其他-->二线城市）
SELECT
	name,
	(CASE worksddress
	WHEN '北京' THEN
		'一线城市'	
    WHEN '上海' THEN
		'一线城市'
	ELSE
		'二线城市'
    END) AS '工作地址'
FROM emp;
```

结果如下：

![image-20230105225749978](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301052257080.png)



![image-20230107211526221](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301072115487.png)

![image-20230107212015036](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301072120130.png)

## 总结

- 字符串函数
- 数值函数
- 日期函数
- 流程函数

![image-20230107212405292](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301072124378.png)

# 约束

## 概述

1. 概述：约束是作用于表中字段上的规则，用于限制存储在表中的数据

2. 目的：保证数据库中数据的正确性、有效性、完善性

3. 分类：

   | 约束                    | 描述                                                     | 关键字      |
   | ----------------------- | -------------------------------------------------------- | ----------- |
   | 非空约束                | 限制该字段的数据不能为null                               | not null    |
   | 唯一约束                | 保证该字段的所有数据都是唯一，不重复的                   | unque       |
   | 主键约束                | 主键是一行数据的唯一标识，要求非空且唯一                 | primary key |
   | 默认约束                | 保存数据时，如果未指定该字段的值，则采用默认值           | defalut     |
   | 检查约束（8.0版本之后） | 保证字段值满足某一个条件                                 | check       |
   | 外键约束                | 用来让两张表的数据之间建立连接，保证数据的一致性和完整性 | foreign key |

   注意：约束是作用于表中字段上的，可以在创建/修改表的时候添加约束

## 演示

![image-20230107214017315](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301072140438.png)

```sql
-- 约束演示：根据需求建表
CREATE TABLE user(
	id int primary key auto_increment COMMENT '主键',
	name varchar(10) not null unique comment '姓名',
	age int check(age>0&&age<=120) comment '年龄',
	status char(1) DEFAULT '1' comment '状态',
	gender char(1) comment '性别'
) COMMENT '用户表';
```

```sql
-- 插入数据
INSERT into
user(name,age,status,gender)
values
('Tom1',19,'1','男'),
('Tom2',25,'0','男');
```

## 外键约束

![image-20230107221448427](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301072214527.png)

### 语法

- 添加外键

```sql
create table 表名(
	字段名	数据类型,
    ...
    [constraint] [外键名称] foreign key(外键字段名) references 主表(主表列名)
);
```

或者

```sql
alter table  表名 add constaint 外键名称 foreign key(外键字段名) references 主表(主表列名);


```





# 多表查询



属于DQL语句

## 多表关系

在项目开发中，在进行数据库表的设计时，会根据业务需求以及模块之间的关系，分析并设计表结构，由于业务之间相互关联，所以各个表结构之间也存在着各种联系，基本上分为三种：

- 一对多（多对一）

![image-20230108211238413](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082112514.png)

- 多对多

![image-20230108211357871](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082113952.png)

```sql
-- 创建学生表
CREATE TABLE student(
	id int auto_increment primary key comment '主键ID',
	name varchar(10) comment '姓名',
	no varchar(10) comment '学号'
) comment '学生表';
-- 插入学生信息
insert into student 
VALUES
(null,'张三','2000100101'),
(null,'王五','2000100102'),
(null,'李四','2000100103'),
(null,'谢逊','2000100104');

-- 创建课程表
create table course(
	id int auto_increment primary key comment '主键',
	name varchar(10) comment '课程名称'
) comment '课程表';

-- 插入课程信息
insert into course 
VALUES
(null,'Java'),
(null,'PHP'),
(null,'MySQL'),
(null,'Hadoop');

-- 创建中间表
create table student_course(
	id int auto_increment primary key  comment '主键',
	studentid int not null comment '学生ID',
	courseid int not null comment '课程ID',
  constraint fk_courseid foreign key (courseid) references course(id),
	constraint fk_studentid foreign key (studentid) references student(id)
) comment '学生课程中间表';

-- 插入中间表信息
insert into student_course 
VALUES
(null,1,1),
(null,1,2),
(null,1,3),
(null,2,2),
(null,2,3),
(null,3,4);
```

通过idea查看多表之间的关联

![image-20230108213852549](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082138751.png)

如下图即为以上三个表的关联图

![image-20230108213951661](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082139736.png)

- 一对一

![image-20230108214236673](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082142750.png)

```sql
create table tb_user(
	id int auto_increment primary key comment'主ID',
	name varchar(10) comment '姓名',
	age int comment '年龄',
	gender char(1) comment '1: 男 ，2:女',
	phone char(11) comment'手机号'
) comment '用户基本信息表' ;

create table tb_user_edu(
	id int auto_increment primary key comment'主健ID',
	degree varchar(20) comment '学历',
	major varchar(50) comment '专业',
	primaryschool varchar(50) comment '小学',
	middleschool varchar(50) comment '中学',
	university varchar(50) comment '大学',
	userid int unique comment '用户ID',
	constraint fk_userid foreign key (userid) references tb_user(id)
)comment '用户教育信息表';

insert into tb_user(id,name,age, gender, phone) values
(null,'黄渤',45,1,'18800001111'),
(null,'冰冰',35,2,'18800002222'),
(null,'码云',55,1,'18800008888'),
(null,'李彦宏',50,1,'18800009999');

insert into tb_user_edu(id,degree,major,primaryschool,middleschool,university,userid) 
values
(null,'本科','舞蹈','静安区第一小学','静安区第一中学','北京彝蹈学院',1),
(null,'顾士','表演','朝阳区第一小学','朝阳区第一中学','北京电影学院',2),
(null,'本科','英语','杭州市第一小学','杭州市第一中学','杭州师范大学',3),
(null,'本科','应用数学','阳泉第一小学','阳泉区第一中学','清华大学',4);
```



## 多表查询概述

概述：从多张表中进行数据查询

```sql
-- 多表查询 ---笛卡尔积
SELECT * from emp,dept;
```

笛卡尔积：笛卡尔乘积是指在数学中，两个集合A集合B的所有组合情况（在多表查询当中，需要消除无效的笛卡尔积）。如下图所示：

![image-20230108220719360](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082207433.png)

消除笛卡尔积：

![image-20230108220814507](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082208580.png)

### 分类

![image-20230108221130066](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082211130.png)

- 连接查询
  - 内连接：相当于查询A、B交集部分数据
  - 外连接：
    - 左外连接：查询左表所有数据，以及两张表交集部分数据
    - 右外连接：查询右表所有数据，以及两张表交集部分数据
  - 自连接：当前表与自身的连接查询，自连接必须使用表列名
- 子查询

## 内连接

==内连接查询的是两张表交集的部分==

内连接查询语法：

- 隐式内连接

> select 字段列表 from 表1，表2 where 条件...;

```sql
-- 内连接演示
-- 查询每一个员工的姓名，及关联的部门的名称（隐式内连接实现）
-- 表结构：emp, dept
-- 连接条件：emp.dept_id=dept.id
select emp.id,emp.name '员工姓名',dept.name '部门名称' 
from emp,dept 
where emp.dept_id=dept.id;
```



- 显式内连接

> select 字段列表 from表1 [inner] join 表2 on 连接条件...;

```sql
-- 查询每一个员工的姓名，及关联的部门的名称（显式内连接实现）
select e.id,e.name '员工姓名',d.name '部门名称' 
from emp e inner join dept d on e.dept_id=d.id;
```

查询结果如下：

![image-20230108223502322](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082235395.png)

## 外连接

![image-20230108223643545](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082236609.png)

外连接查询语法：

- 左外连接

> select 字段列表 from 表1 left [outer] join 表2 on 条件...;

==相当于查询表1（左表）的所有数据 包含 表1和表2交集部分的数据==

```sql
-- 外连接演示
-- 表结构：emp, dept
-- 连接条件：emp.dept_id=dept.id
-- 查询emp表所有数据，和对应的部门信息(左外连接)
select e.*,d.name 
from emp e 
left outer join dept d
on e.dept_id=d.id;
-- outer 可写可不写
```

结果如下：

![image-20230108225159919](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082252008.png)

- 右外连接

> select 字段列表 from 表1 right [outer] join 表2 on 条件...;

==相当于查询表2（右表）的所有数据 包含 表1和表2交集部分的数据==

```sql
-- 查询dept表所有数据，和对应的员工信息(右外连接)
select d.*,e.* 
from emp e 
right outer join dept d
on e.dept_id=d.id;
-- outer 可写可不写
-- 注意：右外通常可以改为左外，如下
select d.*,e.* 
from dept d
left outer join emp e 
on e.dept_id=d.id;
```

结果如下：

![image-20230108225233506](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082252597.png)

## 自连接

概述：自己连接自己

自连接查询语法：

> select 字段列表 from 表A 别名A join 表A 别名B on 条件...;

==自连接查询，可以是内连接查询，也可以是外连接查询==

```sql
-- 自连接
-- 表结构：emp,
-- 查询员工 及其 所属员工的名字
select a.name '员工姓名',b.name '领导姓名' 
from emp a,emp b 
where a.managerid=b.id;
```

结果如下图：

![image-20230108231135775](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082311856.png)

```sql
-- 查询所有员工 emp 及其领导的名字 emp，如果员工没有领导，也需要查询出来
select a.name '员工姓名',b.name '领导姓名' 
from emp a left join emp b 
on a.managerid=b.id;
```

结果如下图：

![image-20230108231228312](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301082312382.png)

## 联合查询-union、union all

对于ubion查询，就是把多次结果结果合并起来，形成一个新的查询结果集

> select 字段列表 from 表A
>
> union [all]
>
> select 字段列表 from 表B ...;

- union all：是直接将查询的结果合并
- union：是将查询的结果合并并进行去重操作

注意：

==对于联合查询的多张表的列数必须保持一致，字段类型也需要保持一致==

## 子查询

- 概念：SQL语句中嵌套select语句，称为嵌套语句，又称子查询。

> select  *  from  t1  where  column1 = (select  column1  from t2);

==子查询外部的语句可以是insert / update / delete / select 的任何一个。==

- 根据子查询结果不同，分为：

  - 标量子查询（子查询结果为单个值）

  子查询返回的结果是单个值（数字、字符串、日期等），最简单的形式，这种子查询成为==标量子查询==。

  常用的操作符：=  <>  >  >=  <   <=

  ```sql
  -- 标量子查询
  -- 需求：查询销售部所有员工的信息
  -- 拆解完成如下：
  -- a.查询‘销售部’部门ID
  select id from dept where name = '销售部';
  -- b.根据销售部部门ID，查询员工信息
  select * from emp where dept_id = 4;
  -- 子查询sql如下：
  select * from emp where dept_id = (select id from dept where name = '销售部');
  
  
  -- 需求：查询在 ‘张艳’ 入职之后的信息
  -- 拆解完成如下：
  -- a.查询 ‘张艳’ 的入职日期
  select entrydate from emp where name='张艳';
  -- b.查询指定入职日期之后入职的员工信息
  select * from emp where entrydate > '2010-01-01';
  -- 子查询sql如下：
  select * from emp where entrydate > (select entrydate from emp where name='张艳');
  
  ```

  - 列子查询（子查询结果为一列）

  子查询返回的结果是一列（可以是多列），这种子查询称为==列子查询==

  常用的操作符：in 、not in 、any 、some、all

  | 操作符 | 描述                                   |
  | ------ | -------------------------------------- |
  | IN     | 在指定的集合范围之内，多选一           |
  | NOT IN | 不在指定的集合范围之内                 |
  | ANY    | 子查询返回列表中，有任意一个满足即可   |
  | SOME   | 与ANY等同，使用SOME的地方都可以使用ANY |
  | ALL    | 子查询返回列表的所有值都必须满足       |

  ![image-20230109215531811](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301092155013.png)

  - 行子查询（子查询结果为一行）

  子查询返回的结果是一行（可以是多列），这种子查询查询称为==行子查询==

  常用的操作符：=、<>、IN、NOT IN

  ```sql
  
  -- 行子查询
  -- 查询与“张艳”的薪资 及直属领导相同的员工信息
  -- 分布完成
  -- a.查询“张艳”的薪资及直属领导
  SELECT salary,managerid from emp WHERE name='张艳';
  -- b.查询与“张艳”的薪资及直属领导相同的员工信息
  SELECT * from emp WHERE salary = '6000' and managerid=13;
  
  -- 行子查询完成
  SELECT * 
  from emp 
  where (salary,managerid)=(SELECT salary,managerid from emp WHERE name='张艳');
  ```

  ![image-20230112202034213](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301122020357.png)

  - 表子查询（子查询结果为多行多列）

  子查询返回的结果是多行多列，这种子查询称为==表子查询==

  常用的操作符：IN

  ![image-20230112202835680](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301122028795.png)

  ![image-20230112203454159](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202301122034246.png)

- 根据子查询位置，分为：

  - where 之后
  - from 之后
  - select 之后









## 多表查询案例





# 事务

简介：

事务是一组操作的集合，它是一个不可分割得工作单位，事务会把所有得操作作为一个整体一起向系统提交或撤销操作请求，即这些操作要么同时成功，要么同时失败

默认mysql的事务是自动提交的，也就是说，当执行一条DML语句，MySQL会立即隐式的提交事务



# 存储对象

![image-20230330214917346](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202303302149516.png)

## 视图

**介绍：**

视图是一种虚拟存在的表，视图中的数据并不在数据中实际存在，行和列数据来定义视图的查询中使用的表（基表），并且是在使用视图时动态生成的

通俗的说，视图 只是保存了查询的SQL逻辑，不保存查询逻辑。所以我们在创建视图的时候，主要的工作就落在了创建这条SQL查询的语句上

### **创建**

> create [or replace] view 视图名称[(列名列表)] as select语句 [with[cascaded|local] check option]

replace：替换某一个视图时用replace

```sql
-- 创建视图
CREATE or replace VIEW stu_1 as select id,name from student where id<10;
```

![image-20230330220110919](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202303302201033.png)

### 查询

> 查看创建视图语句：show create view 视图名称;
>
> 查看视图数据：select * from 视图名称.......;

```sql
-- 查询
show create view stu_1;

select * from stu_1 where id<10;
```

![image-20230330220619432](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202303302206509.png)

### 修改

> 方式一：create [or replace] view 视图名称[(列名列表)] as select语句 [with[cascaded|local] check option]
>
> 方式二：alter view 视图名称[(列名列表)]  as select语句 [with[cascaded|local] check option]

```sql
CREATE or replace VIEW stu_1 as select id,name,no from student where id<10;

alter VIEW stu_1 as select id,name,no from student where id<10;

```

### 删除

> drop view [if exists] 视图名称 [,视图名称] ...

```sql
drop view stu_1;
```





```sql
--创建视图
CREATE or replace VIEW stu_1 as select id,name from student where id<10;
--查询视图数据
select * from stu_1;
--向视图中插入数据
insert into stu_1 values(5,'李飞');
--向视图中插入数据（因为在创建的时候规定了id的上限，所以插入不到视图中）
insert into stu_1 values(30,'Tom');
```

==默认插入视图中的数据会存放在基表中（student），即使视图规定了id的上限基表中还是会存在，只是视图中不存在==

加上 `with[cascaded|local] check option` 在向视图中插入数据的时候会进行校验

### 视图的检查选项

![image-20230330222553781](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202303302225867.png)

cascaded（级联）：递归检查所有有所依赖的视图条件

![image-20230330223652021](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202303302236104.png)

LOCAL:

![image-20230330224618439](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202303302246524.png)

### 视图的更新

要使试图可更新，视图中的行与基表中的行之间必须存在一对一的关系。如果试图包含以下任何一项，则该视图不可更新

- 聚合函数或窗口函数（sum()、min()、max()、count()等）
- distinct
- group by
- having
- union或者 union all

### 作用

- 简单

  视图不仅可以简化用户对数据的理解，也可以简化他们的操作。那些被经常使用的查询可以被定义为视图，从而使得用户不必为以后的操作每次指定全部的条件

- 安全

  数据库可以授权，但不能授权到数据库特定行和特定列上。通过视图用户只能查询和修改他们所能见到的数据

- 数据独立

  视图可帮助用户屏蔽真实表结构变化带来的影响

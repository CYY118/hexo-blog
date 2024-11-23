---
abbrlink: spring_security
categories:
- - Java
date: '2024-11-23T21:19:51.406989+08:00'
description: SpringSecurity的笔记
filename: filename
mathjax: true
sticky: 2
swiper_index: 2
tags:
- Spring
title: SpringSecurity
updated: '2024-11-23T21:19:52.569+08:00'
---
## SpringSecurity(安全)

在网站的开发中，安全是第一位的！过滤器，拦截器

功能性需求：否

==设计网站之初就需要考虑到安全性能==

![image-20221010214744102](https://gitee.com/yangstudys/typora-pic/raw/master/prcture/202210102147269.png)

```te
Spring Security是一个功能强大、高度可定制的身份验证和访问控制框架。它是保护基于spring的应用程序的事实上的标准。
```

- 功能权限
- 访问权限
- 菜单权限
- 拦截器，过滤器，需要用到大量的原生代码 ~ 冗余太大

shiro、springSecurity：很像，除了类不一样，名字不一样

认证、授权（vip1、vip2...）

[Spring Security官网](https://spring.io/projects/spring-security)

记住这几个类：

- WebSecurityConfigurerAdapter：自定义Security策略
- AuthenticationManagerBuilder：自定义认证策略
- @EnableWebSecurity：开启认证WebSecurity模式，@EnableXXXXX  开启某个功能

SpringSecurity的两个主要目标是“认证”和“授权”（控制访问）

“认证”（Authentication）

“授权”（Authorization）

这个概念是通的，而不是只在SpringSecurity中存在

# SpringBoot面试题

## 1. 谈谈你对SpringBoot的理解，它有哪些特性（优点）？

SpringBoot是用来快速开发Spring应用的脚手架，其设计目的就是用来简化新Spring应用的初始搭建以及开发过程

1. SpringBoot提供了很多内置的Starter（启动器）结合自动配置，对主流框架无配置集成、开箱即用
2. SpringBoot简化了开发，采用JavaConfig的方式可以使用零xml的方式进行开发
3. SpringBoot内置了Web容器无需依赖外部Web服务器，省略了Web.xml，直接运行jar文件就可以启动web应用
4. SpringBoot帮我们管理了常用的第三方以来的版本，减少出现版本冲突的问题
5. SpringBoot自带了监控功能，可以监控应用程序的运行状况，或者内存、线程池、Http请求统计等，同时还提供了优雅关闭应用程序等功能

## 2.Spring和SpringBoot的关系和区别？

SpringBoot是Spring生态的产品

Spring Framework是一个容器框架

SpringBoot它不是一个框架，它是一个可以快速构建基于Spring的脚手架（里面包含了Spring和各种框架），为开发Spring生态其他框架铺平道路

二者不是一个层面的东西

## 3.SpringBoot的核心注解

@SpringBootApplication：标记成SpringBoot应用，表示它是一个SpringBoot工程

@SpringBootConfiguration：这个注解实际就是一个@Configuration，表示启动类也是一个配置类

@EnableAutoConfiguration：向Spring容器中导入了一个Selector，用来加载ClassPath下SpringFactories中所定义的自动配置类，将这些自动加载为配置Bean

@Conditional也很关键，如果没有它是无法在自定义应用中进行定制开发

- @CondittionalOnBean、
- @ConditionalOnMissingBean
- @ConditionalOnClass
- @ConditionalOnExpression
- @ConditionalOnMissingBean等

@Configuration

这些注解在Spring3时就已经出现了

@Bean

@Import

。。。

## 4.SpringBoot的自动配置原理

1. 通过@SpringBootConfiguration引入了@EnableAutoConfiguration（负责启动自动配置功能）
2. @EnableAutoCondfiguration引入了@Import
3. Spring容器启动时：加载Ioc容器时会解析@Import注解
4. @ImportdaoruleyigedeferredImportSelector，它会使SpringBoot的自动配置类的顺序在最后，这样方便我们扩展和覆盖
5. 然后读取所有的/META-INF/spring.factories文件
6. 过滤出所有AutoConfigurtionClass类型的类
7. 最后通过@Condition排除无效的自动配置类

## 5.为什么SpringBoot的jar可以直接运行

1. SpringBoot提供了一个插件Spring-boot-maven-plugin用于把程序打包成一个可执行的jar包
2. springboot应用打包之后，生成一个Fat jar（jar包中包含jar），包含了应用依赖的的jar包和SpringBoot loader相关的类
3. java -jar 会去找jar中的mainifest文件，在那里面找到真正的启动类
4. Fat jar 的启动Main函数时JarLauncher，它负责创建一个LaunchedURLClassLoader来加载boot-lib下面的jar，并以一个新线程启动应用的main函数

## 6.SpringBoot的启动原理？

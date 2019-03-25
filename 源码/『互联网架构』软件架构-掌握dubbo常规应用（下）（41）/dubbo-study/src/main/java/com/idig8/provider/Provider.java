package com.idig8.provider;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Provider {
    public static void main(String[] args) throws Exception {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
               "config/spring-dubbo-provider.xml");
        context.start();
        System.out.println("dubbo multicast 服务启动成功 ");
        System.in.read(); // press any key to exit
    }
}
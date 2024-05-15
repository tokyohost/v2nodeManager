package com.ruoyi.common.utils;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/13 14:45
 * @Content
 */
public interface ExecuteCommandACallable<T> {

    boolean IamDone();//提前结束执行，如果终端是无限输出，则可以在达到一定条件的时候，通过IamDone通知上述程序结束读取。

    //for buffer
    ExecuteCommandACallable<T> appendBuffer(String content);//异步追加输出到自定义的Buffer

    String endBuffer();//正常结束Buffer，
}
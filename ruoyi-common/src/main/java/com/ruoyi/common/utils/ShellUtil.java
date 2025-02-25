package com.ruoyi.common.utils;

import com.jcraft.jsch.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.exec.Watchdog;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/4/26 15:40
 * @Content
 */
@Component
@Slf4j
@Scope(value = "prototype")
public class ShellUtil {


    @Value("${ssh.strictHostKeyChecking:no}")
    private String strictHostKeyChecking;

    @Value("${ssh.timeout:10000}")
    private Integer timeout;

    private Session session;

    private Channel channel;

    private ChannelExec channelExec;

    private ChannelSftp channelSftp;

    private ChannelShell channelShell;

    public Session getSession() {
        return session;
    }

    /**
     * 初始化
     *
     * @param ip       远程主机IP地址
     * @param port     远程主机端口
     * @param username 远程主机登陆用户名
     * @param password 远程主机登陆密码
     * @throws JSchException JSch异常
     */
    public void init(String ip, Integer port, String username, String password) throws JSchException {
        JSch jsch = new JSch();
        session = jsch.getSession(username, ip, port);
        session.setPassword(password);
        Properties sshConfig = new Properties();
        sshConfig.put("StrictHostKeyChecking", strictHostKeyChecking);
        session.setConfig(sshConfig);
        session.connect(timeout);
        log.info("Session connected!");

    }

    public ShellUtil getOne() {
        ShellUtil shellUtil = new ShellUtil();
        shellUtil.timeout = this.timeout;
        shellUtil.strictHostKeyChecking = this.strictHostKeyChecking;
        return shellUtil;
    }

    public void init(String ip, String username, String password) throws JSchException {
        init(ip, 22, username, password);
    }

    /**
     * 连接多次执行命令，执行命令完毕后需要执行close()方法
     *
     * @param command 需要执行的指令
     * @return 执行结果
     * @throws Exception 没有执行初始化
     */
    public String execCmd(String command) throws Exception {
        initChannelExec();
        log.info("execCmd command - > {}", command);
        channelExec.setCommand(command);
        channel.setInputStream(null);
        channelExec.setErrStream(System.err);
        channel.connect();
        StringBuilder sb = new StringBuilder(16);
        try (InputStream in = channelExec.getInputStream();
             InputStreamReader isr = new InputStreamReader(in, StandardCharsets.UTF_8);
             BufferedReader reader = new BufferedReader(isr)) {
            String buffer;
            while ((buffer = reader.readLine()) != null) {
                sb.append("\n").append(buffer);
            }
            log.info("execCmd result - > {}", sb);
            return sb.toString();
        }

    }


    /**
     * 执行命令关闭连接
     *
     * @param command 需要执行的指令
     * @return 执行结果
     * @throws Exception 没有执行初始化
     */
    public String execCmdAndClose(String command) throws Exception {
        String result = execCmd(command);
        close();
        return result;
    }

    /**
     * 执行复杂shell命令
     *
     * @param cmds 多条命令
     * @return 执行结果
     * @throws Exception 连接异常
     */
    public String execCmdByShell(String... cmds) throws Exception {
        return execCmdByShell(Arrays.asList(cmds));
    }

    /**
     * 执行复杂shell命令
     *
     * @param cmds 多条命令
     * @return 执行结果
     * @throws Exception 连接异常
     */
    public String execCmdByShell(List<String> cmds) throws Exception {
        String result = "";
        initChannelShell();
        InputStream inputStream = channelShell.getInputStream();
        channelShell.setPty(true);
        channelShell.connect();

        OutputStream outputStream = channelShell.getOutputStream();
        PrintWriter printWriter = new PrintWriter(outputStream);
        for (String cmd : cmds) {
            printWriter.println(cmd);
        }
        printWriter.flush();

        byte[] tmp = new byte[1024];
        while (true) {

            while (inputStream.available() > 0) {
                int i = inputStream.read(tmp, 0, 1024);
                if (i < 0) {
                    break;
                }
                String s = new String(tmp, 0, i);
                if (s.contains("--More--")) {
                    outputStream.write((" ").getBytes());
                    outputStream.flush();
                }
                System.out.println(s);
            }
            if (channelShell.isClosed()) {
                System.out.println("exit-status:" + channelShell.getExitStatus());
                break;
            }
            try {
                Thread.sleep(1000);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        outputStream.close();
        inputStream.close();
        return result;
    }


    /**
     * SFTP文件上传
     *
     * @param src 源地址
     * @param dst 目的地址
     * @throws Exception 上传文件失败
     */
    public void putAndClose(String src, String dst) throws Exception {
        putAndClose(src, dst, ChannelSftp.OVERWRITE);
    }

    /**
     * SFTP文件上传
     *
     * @param src  源地址
     * @param dst  目的地址
     * @param mode 上传模式 默认为ChannelSftp.OVERWRITE
     * @throws Exception 上传文件失败
     */
    public void putAndClose(String src, String dst, int mode) throws Exception {
        put(src, dst, mode);
        close();
    }

    public void put(String src, String dst) throws Exception {
        put(src, dst, ChannelSftp.OVERWRITE);
    }

    public void put(String src, String dst, int mode) throws Exception {
        initChannelSftp();
        log.info("Upload File {} -> {}", src, dst);
        channelSftp.put(src, dst, mode);
        log.info("Upload File Success!");
    }

    /**
     * SFTP文件上传并监控上传进度
     *
     * @param src 源地址
     * @param dst 目的地址
     * @throws Exception 上传文件失败
     */
    public void putMonitorAndClose(String src, String dst) throws Exception {
        putMonitorAndClose(src, dst, ChannelSftp.OVERWRITE);
    }

    /**
     * SFTP文件上传并监控上传进度
     *
     * @param src  源地址
     * @param dst  目的地址
     * @param mode 上传模式 默认为ChannelSftp.OVERWRITE
     * @throws Exception 上传文件失败
     */
    public void putMonitorAndClose(String src, String dst, int mode) throws Exception {
        initChannelSftp();
        FileProgressMonitor monitor = new FileProgressMonitor(new File(src).length());
        log.info("Upload File {} -> {}", src, dst);
        channelSftp.put(src, dst, monitor, mode);
        log.info("Upload File Success!");
        close();
    }

    /**
     * SFTP文件下载
     *
     * @param src 源文件地址
     * @param dst 目的地址
     * @throws Exception 下载文件失败
     */
    public void getAndClose(String src, String dst) throws Exception {
        get(src,dst);
        close();
    }

    public void get(String src, String dst) throws Exception {
        initChannelSftp();
        log.info("Download File {} -> {}", src, dst);
        channelSftp.get(src, dst);
        log.info("Download File Success!");
    }

    /**
     * SFTP文件下载并监控下载进度
     *
     * @param src 源文件地址
     * @param dst 目的地址
     * @throws Exception 下载文件失败
     */
    public void getMonitorAndClose(String src, String dst) throws Exception {
        initChannelSftp();
        FileProgressMonitor monitor = new FileProgressMonitor(new File(src).length());
        log.info("Download File {} -> {}", src, dst);
        channelSftp.get(src, dst, monitor);
        log.info("Download File Success!");
        close();
    }

    /**
     * 删除指定目录文件
     *
     * @param path 删除路径
     * @throws Exception 远程主机连接异常
     */
    public void deleteFile(String path) throws Exception {
        initChannelSftp();
        channelSftp.rm(path);
        log.info("Delete File {}", path);
    }

    /**
     * 删除指定目录
     *
     * @param path 删除路径
     * @throws Exception 远程主机连接异常
     */
    public void deleteDir(String path) throws Exception {
        initChannelSftp();
        channelSftp.rmdir(path);
        log.info("Delete Dir {} ", path);
    }

    /**
     * 释放资源
     */
    public void close() {
        if (channelSftp != null && channelSftp.isConnected()) {
            channelSftp.disconnect();
            channelSftp = null;
        }
        if (channelExec != null && channelExec.isConnected()) {
            channelExec.disconnect();
            channelExec = null;
        }
        if (channel != null && channel.isConnected()) {
            channel.disconnect();
            channel = null;
        }
        if (session != null && session.isConnected()) {
            session.disconnect();
            session = null;
        }
        log.info("shell Exit");
    }

    private void initChannelSftp() throws Exception {
        channel = session.openChannel("sftp");
        channel.connect(); // 建立SFTP通道的连接
        channelSftp = (ChannelSftp) channel;
        if (session == null || channel == null || channelSftp == null) {
            log.error("请先执行init()");
            throw new Exception("请先执行init()");
        }
    }

    private void initChannelExec() throws Exception {
        // 打开执行shell指令的通道
        channel = session.openChannel("exec");
        channelExec = (ChannelExec) channel;
        if (session == null || channel == null || channelExec == null) {
            log.error("请先执行init()");
            throw new Exception("请先执行init()");
        }
    }

    private void initChannelShell() throws Exception {
        // 打开执行shell指令的通道
        channel = session.openChannel("shell");
        channelShell = (ChannelShell) channel;
        if (session == null || channel == null || channelShell == null) {
            log.error("请先执行init()");
            throw new Exception("请先执行init()");
        }
    }
    public String executeCommandWait(String command,
                                                ExecuteCommandACallable<String> buffer) {
        Session session = this.session;
        Channel channel = null;
        InputStream in = null;
        InputStream er = null;
        Watchdog watchdog = new Watchdog(120000);//2分钟超时
        try {
//            String user = submitMachineInfo.getUser();
//            String host = submitMachineInfo.getHost();
//            int remotePort = submitMachineInfo.getPort();

//            JSch jsch = new JSch();
//            session = jsch.getSession(user, host, remotePort);

//            Properties prop = new Properties();
            //File file = new File(SystemUtils.getUserHome() + "/.ssh/id_rsa");
            //String knownHosts = SystemUtils.getUserHome() + "/.ssh/known_hosts".replace('/', File.separatorChar);
            //jsch.setKnownHosts(knownHosts)
            //jsch.addIdentity(file.getPath())
            //prop.put("PreferredAuthentications", "publickey");
            //prop.put("PreferredAuthentications", "password");
            //

//            prop.put("StrictHostKeyChecking", "no");
//            session.setConfig(prop);
//            session.setPort(remotePort);
//            session.connect();

            channel = session.openChannel("exec");
            ((ChannelExec) channel).setPty(false);
            ((ChannelExec) channel).setCommand(command);

            // get I/O streams

            in = channel.getInputStream();
            er = ((ChannelExec) channel).getErrStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8));
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(er, StandardCharsets.UTF_8));

            Thread thread = Thread.currentThread();
            watchdog.addTimeoutObserver(w -> thread.interrupt());

            channel.connect();
            watchdog.start();
            String buf;
            while ((buf = reader.readLine()) != null) {
                buffer.appendBuffer(buf);
                if (buffer.IamDone()) {
                    break;
                }
            }
            String errbuf;
            while ((errbuf = errorReader.readLine()) != null) {
                buffer.appendBuffer(errbuf);
                if (buffer.IamDone()) {
                    break;
                }
            }

            //两分钟超时，无论什么代码，永久运行下去并不是我们期望的结果，
            //加超时好处多多，至少能防止内存泄漏，也能符合我们的预期，程序结束，相关的命令也结束。
            //如果程序是前台进程，不能break掉，那么可以使用nohup去启动，或者使用子shell，但外层我们的程序一定要能结束。
            watchdog.stop();
            channel.disconnect();
            session.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
                if (er != null) {
                    er.close();
                }
            } catch (Exception e) {
                //
            }

            if (channel != null) {
                channel.disconnect();
            }
            if (session != null) {
                session.disconnect();
            }
            watchdog.stop();
        }

        return buffer.endBuffer();
    }


}




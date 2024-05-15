package com.ruoyi.system.service.impl;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.domain.CloudFlareDNSRecord;
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2Domain;
import com.ruoyi.system.service.CfApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/11 9:54
 * @Content
 */

@Service
public class CfApiServiceImpl implements CfApiService {
    @Autowired
    RestTemplate restTemplate;
    @Override
    public List<V2Domain> getV2DomainListFromCF(String cfKey) {
        // 定义请求参数
        String url = "https://api.cloudflare.com/client/v4/zones";
        HttpEntity<String> requestEntity = getRequestInfo(cfKey,"");

        // 发起 HTTP 请求
        ResponseEntity<JSONObject> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, JSONObject.class);

        // 获取响应结果
        HttpStatus statusCode = responseEntity.getStatusCode();
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        JSONObject responseBody = responseEntity.getBody();
        if (statusCode.is2xxSuccessful()) {
            List<JSONObject> result = responseBody.getJSONArray("result").toJavaList(JSONObject.class);
            for (JSONObject object : result) {
                object.put("domainId", object.get("id"));
                object.put("id", null);

            }


            return JSONArray.copyOf(result).toJavaList(V2Domain.class);
        }else{
            throw new RuntimeException("请求失败", new Throwable(responseBody.toJSONString()));
        }
    }
    private  <T> HttpEntity<T> getRequestInfo(String token, T Body) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set(HttpHeaders.AUTHORIZATION, "Bearer "+token);
        HttpEntity<T> requestEntity = new HttpEntity<T>(Body,headers);
        return requestEntity;
    }

    @Override
    public List<V2Dns> getV2DnsListFromCF(String cfKey, String zoneId) {
        String url = "https://api.cloudflare.com/client/v4/zones/"+zoneId+"/dns_records";
        HttpEntity<String> requestEntity = getRequestInfo(cfKey,"");

        // 发起 HTTP 请求
        ResponseEntity<JSONObject> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, JSONObject.class);

        // 获取响应结果
        HttpStatus statusCode = responseEntity.getStatusCode();
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        JSONObject responseBody = responseEntity.getBody();

        // 打印响应信息
        if (statusCode.is2xxSuccessful()) {
            List<V2Dns> result = responseBody.getJSONArray("result").toJavaList(V2Dns.class);

            return result;
        }else{
            throw new RuntimeException("请求失败", new Throwable(responseBody.toJSONString()));
        }
    }

    @Override
    public AjaxResult createCfDns(String cfKey, V2Dns v2Dns) {
        String url = "https://api.cloudflare.com/client/v4/zones/"+v2Dns.getZoneId()+"/dns_records";


        CloudFlareDNSRecord cloudFlareDNSRecord = new CloudFlareDNSRecord();
        cloudFlareDNSRecord.setContent(v2Dns.getContent());
        cloudFlareDNSRecord.setName(v2Dns.getName());
        cloudFlareDNSRecord.setProxied(v2Dns.getProxied().equals("true"));
        cloudFlareDNSRecord.setType(v2Dns.getType());
        cloudFlareDNSRecord.setComent("create by v2nodeManage");
        cloudFlareDNSRecord.setTtl(v2Dns.getTtl());
        HttpEntity<CloudFlareDNSRecord> requestEntity = getRequestInfo(cfKey,cloudFlareDNSRecord);
        // 发起 HTTP 请求
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);

        // 获取响应结果
        HttpStatus statusCode = responseEntity.getStatusCode();
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        String responseBody = responseEntity.getBody();
        if (statusCode.is2xxSuccessful()) {
            return AjaxResult.success();
        }else{
            return AjaxResult.error(responseBody);
        }

        // 打印响应信息
//        logger.error("Status code: " + statusCode);
//        logger.error("Response headers: " + responseHeaders);
//        logger.error("Response body: " + responseBody);
    }

    @Override
    public AjaxResult updateCfDns(String cfKey, V2Dns v2Dns) {
        String url = "https://api.cloudflare.com/client/v4/zones/"+v2Dns.getZoneId()+"/dns_records/"+v2Dns.getId();


        CloudFlareDNSRecord cloudFlareDNSRecord = new CloudFlareDNSRecord();
        cloudFlareDNSRecord.setContent(v2Dns.getContent());
        cloudFlareDNSRecord.setName(v2Dns.getName());
        cloudFlareDNSRecord.setProxied(v2Dns.getProxied().equals("true"));
        cloudFlareDNSRecord.setType(v2Dns.getType());
        cloudFlareDNSRecord.setComent("create by v2nodeManage");
        cloudFlareDNSRecord.setTtl(v2Dns.getTtl());
        HttpEntity<CloudFlareDNSRecord> requestEntity = getRequestInfo(cfKey,cloudFlareDNSRecord);
        // 发起 HTTP 请求
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.PATCH, requestEntity, String.class);

        // 获取响应结果
        HttpStatus statusCode = responseEntity.getStatusCode();
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        String responseBody = responseEntity.getBody();
        if (statusCode.is2xxSuccessful()) {
            return AjaxResult.success();
        }else{
            return AjaxResult.error(responseBody);
        }
    }

    @Override
    public AjaxResult deleteCfDns(String cfKey, String id,String zoneId) {


        String url = "https://api.cloudflare.com/client/v4/zones/"+zoneId+"/dns_records/"+id;

        HttpEntity<CloudFlareDNSRecord> requestEntity = getRequestInfo(cfKey,null);
        // 发起 HTTP 请求
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.DELETE, requestEntity, String.class);

        // 获取响应结果
        HttpStatus statusCode = responseEntity.getStatusCode();
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        String responseBody = responseEntity.getBody();
        if (statusCode.is2xxSuccessful()) {
            return AjaxResult.success(responseBody);
        }else{
            return AjaxResult.error(responseBody);
        }
    }
}

import com.ruoyi.RuoYiApplication;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.domain.CloudFlareDNSRecord;
import org.apache.poi.ss.formula.functions.T;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.*;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.client.RestTemplate;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/10 17:23
 * @Content
 */

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = RuoYiApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class AllTest {
    Logger logger = LoggerFactory.getLogger(AllTest.class);

    @Autowired
    RestTemplate restTemplate;

    @Test
    public void test() {
        // 定义请求参数
        String url = "https://api.cloudflare.com/client/v4/zones";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set(HttpHeaders.AUTHORIZATION, "Bearer SWvBvT8jS-exFQhmAbCBjRGbjIIvt8dKbTHQEm27");
        HttpEntity<String> requestEntity = new HttpEntity<>(headers);

        // 发起 HTTP 请求
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, String.class);

        // 获取响应结果
        HttpStatus statusCode = responseEntity.getStatusCode();
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        String responseBody = responseEntity.getBody();

        // 打印响应信息
        logger.error("Status code: " + statusCode);
        logger.error("Response headers: " + responseHeaders);
        logger.error("Response body: " + responseBody);
    }

    public <T> HttpEntity<T> getRequestInfo(String token, T Body) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set(HttpHeaders.AUTHORIZATION, "Bearer "+token);
        HttpEntity<T> requestEntity = new HttpEntity<T>(Body,headers);
        return requestEntity;
    }

    @Test
    public void testGetAllDNS(){
        String url = "https://api.cloudflare.com/client/v4/zones/"+"524ee5074daeaf70e0787c25dbdb1194"+"/dns_records";
        HttpEntity<String> requestEntity = getRequestInfo("SWvBvT8jS-exFQhmAbCBjRGbjIIvt8dKbTHQEm27","");


        // 发起 HTTP 请求
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, requestEntity, String.class);

        // 获取响应结果
        HttpStatus statusCode = responseEntity.getStatusCode();
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        String responseBody = responseEntity.getBody();

        // 打印响应信息
        logger.error("Status code: " + statusCode);
        logger.error("Response headers: " + responseHeaders);
        logger.error("Response body: " + responseBody);

    }

    @Test
    public void testCreateDNS(){
        String url = "https://api.cloudflare.com/client/v4/zones/"+"524ee5074daeaf70e0787c25dbdb1194"+"/dns_records";


        CloudFlareDNSRecord cloudFlareDNSRecord = new CloudFlareDNSRecord();
        cloudFlareDNSRecord.setContent("103.79.76.129");
        cloudFlareDNSRecord.setName(IdUtils.fastSimpleUUID()+".hostacg.com");
        cloudFlareDNSRecord.setProxied(true);
        cloudFlareDNSRecord.setType("A");
        cloudFlareDNSRecord.setComent("test");
        cloudFlareDNSRecord.setTtl(3600L);
        HttpEntity<CloudFlareDNSRecord> requestEntity = getRequestInfo("SWvBvT8jS-exFQhmAbCBjRGbjIIvt8dKbTHQEm27",cloudFlareDNSRecord);
        // 发起 HTTP 请求
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);

        // 获取响应结果
        HttpStatus statusCode = responseEntity.getStatusCode();
        HttpHeaders responseHeaders = responseEntity.getHeaders();
        String responseBody = responseEntity.getBody();

        // 打印响应信息
        logger.error("Status code: " + statusCode);
        logger.error("Response headers: " + responseHeaders);
        logger.error("Response body: " + responseBody);

    }
}

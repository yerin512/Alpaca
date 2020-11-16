package com.myteam.trip.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.myteam.trip.member.dao.MemberDAO;
import com.myteam.trip.member.vo.MemberVO;
 
@Service("kakao")
public class KakaoAPI {
	@Autowired
	private MemberDAO memberDAO;
    
    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
         
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
           
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=4d6c516eb262829dabdcac45cae9703c");
            sb.append("&redirect_uri=http://localhost:8090/trip/login");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
           
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
           
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
           
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
    
    public HashMap<String, Object> getUserInfo (String access_Token) {
        
       
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
           
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
 
     
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
          
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
          
            String email = "";
//  이메일 동의 안한 사람을 위한 주석
//            if(kakao_account.getAsJsonObject().get("email").getAsString() != null) {
//            	email =kakao_account.getAsJsonObject().get("email").getAsString();
//            }
            
            //아이디값 추출
            int begin = 6;
            int end = result.indexOf(",");
            String kakaoID = result.substring(begin, end);
            System.out.println("카카오 아이디: "+kakaoID);
            
            //프사 추출
            begin = result.indexOf("http");
            end = result.indexOf("\",\"thumbnail");
            String profileImage = result.substring(begin,end);
            
            System.out.println("카카오 프사 : "+profileImage);
            //카카오 아이디 DB 확인 후 없으면 때려넣기
            String memberChk = memberDAO.kIdChk(kakaoID);
            MemberVO memberVO = new MemberVO();
            memberVO.setId(kakaoID);
            memberVO.setEmail("test@test.com");
            memberVO.setName("kakao");
            memberVO.setPwd("1234");
            
            if(memberChk == null || memberChk.equals("")) {
            	memberDAO.insertMember(memberVO);
            }else {
            	//아이디 값으로 로그인 상태 유지는 필요없을 듯 카카오 토큰 유지되는 한 로그인 상태유지니까 
            }
            
            
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            userInfo.put("profileImage", profileImage);
            
        } catch (IOException e) {
        	
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return userInfo;
    }
    
    
//    public void kakaoLogout(String access_Token) {
//        String reqURL = "https://kapi.kakao.com/v1/user/logout";
//        try {
//            URL url = new URL(reqURL);
//            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//            conn.setRequestMethod("POST");
//            conn.setRequestProperty("Authorization", "Bearer" + access_Token);
//            int responseCode = conn.getResponseCode();
//            System.out.println("responseCode : " + responseCode);
//            
//            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//            
//            String result = "";
//            String line = "";
//            
//            while ((line = br.readLine()) != null) {
//                result += line;
//            }
//            System.out.println(result);
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//    }


    
    
}
 
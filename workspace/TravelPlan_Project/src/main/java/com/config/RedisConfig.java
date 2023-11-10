package com.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {
	// redis 설정 https://zero-gravity.tistory.com/329 참고
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	
	@Bean
	public void RedisTemplateSet() {
		// serializer 설정 : https://yonguri.tistory.com/14 참고
		redisTemplate.setKeySerializer(new StringRedisSerializer()); // ex) userInfo
		redisTemplate.setValueSerializer(new StringRedisSerializer()); // key-value했을 때의 value값
		redisTemplate.setHashKeySerializer(new StringRedisSerializer()); // ex) email
		redisTemplate.setHashValueSerializer(new StringRedisSerializer()); // ex) aa@abc.co.kr
//	redisTemplate.setValueSerializer(new GenericJackson2JsonRedisSerializer()); // java Object -> JSON 변환을 지원하는 serializer
	}

	public RedisTemplate<String, Object> getRedisTemplate() {
		return redisTemplate;
	}

	public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}
}
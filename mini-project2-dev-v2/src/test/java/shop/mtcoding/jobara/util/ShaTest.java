package shop.mtcoding.jobara.util;

import org.junit.jupiter.api.Test;

import shop.mtcoding.jobara.common.util.Hash;

public class ShaTest {

      @Test
      public void Sha_test() {
            String password = "1234";
            String encryption = null;
            try {
                  String salt = Hash.makeSalt();
                  System.out.println("솔트 : " + salt);
                  encryption = Hash.encode(password + salt);
            } catch (Exception e) {
                  System.out.println("테스트 실패");
            }
            System.out.println(encryption);

            // 솔트 : PlaqMgXB8zGtrsD2CfZEcg==
            // 1234 : 03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4
            // 12345 : 5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5
            // 솔트 + 1234 : 7c3fd9ebc3c42a298f6e1a9fc3437ac5994b829c6d5dffb44e22e25023f4049f
      }
}

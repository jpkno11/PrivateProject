package shop.mtcoding.jobara.common.config.filter;

import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;
import shop.mtcoding.jobara.common.config.auth.JwtProvider;
import shop.mtcoding.jobara.common.config.auth.LoginUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class JwtVerifyFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String prefixJwt = req.getHeader(JwtProvider.HEADER);

        if (prefixJwt == null) {
            resp.setStatus(401);
            resp.setContentType("text/plain; charset=utf-8");
            resp.getWriter().println("로그인이 필요합니다.");
        } else {
            String jwt = prefixJwt.replace(JwtProvider.TOKEN_PREFIX, "");
            try {
                DecodedJWT decodedJWT = JwtProvider.verify(jwt);
                int id = decodedJWT.getClaim("id").asInt();
                String role = decodedJWT.getClaim("role").asString();

                // 내부적으로 권한처리
                HttpSession session = req.getSession();
                LoginUser loginUser = LoginUser.builder().id(id).role(role).build();
                session.setAttribute("loginUser", loginUser);
                chain.doFilter(req, resp);
            } catch (SignatureVerificationException sve) {
                resp.setStatus(401);
                resp.setContentType("text/plain; charset=utf-8");
                resp.getWriter().println("로그인을 하지 않았거나 만료되었습니다.");
            } catch (TokenExpiredException tee) {
                resp.setStatus(401);
                resp.setContentType("text/plain; charset=utf-8");
                resp.getWriter().println("로그인을 하지 않았거나 만료되었습니다.");
            }
        }

    }
}
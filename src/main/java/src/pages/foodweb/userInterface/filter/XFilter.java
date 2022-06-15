package src.pages.foodweb.userInterface.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class XFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse res=(HttpServletResponse) servletResponse;
        res.addHeader("X-Frame-Options","DENY");
        res.addHeader("X-Content-Type-Options", "nosniff");
        res.addHeader("Content-Security-Policy","script-src 'self'");
        filterChain.doFilter(servletRequest,res);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
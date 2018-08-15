package sharefile

import org.springframework.security.authentication.AnonymousAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

class LoginTagLib {
    def loginControl = {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String currentUserName = auth.getName()
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            out << """${link(action:"index",
                    controller:"logout"){"Logout"}}"""
        }
        else {
            out << """${link(action:"auth",
                    controller:"login"){"Login"}}"""
            out <<"""</button>"""
        }
    }
}

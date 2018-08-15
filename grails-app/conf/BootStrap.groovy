import com.sharefile.SecRole
import com.sharefile.SecUserSecRole
import com.sharefile.User

class BootStrap {

    def init = { servletContext ->
/*        def  userRole =  SecRole.findByAuthority('ROLE_USER') ?: new SecRole (authority:
                'ROLE_USER').save(failOnError:  true )
        def  adminRole =  SecRole.findByAuthority('ROLE_ADMIN') ?: new  SecRole (authority:
                'ROLE_ADMIN').save(failOnError:  true )
        def  moderatorRole =  SecRole.findByAuthority('ROLE_AUTHORIZED_USER') ?: new
                SecRole (authority: 'ROLE_AUTHORIZED_USER').save(failOnError:  true )

        def admin = User.findOrSaveWhere(username: 'admin', password: 'admin', email: 'sagar.giri@deerwalk.edu.np',
                enabled: true)

        if (!admin.authorities.contains(adminRole)){
            SecUserSecRole.create(admin,adminRole,true)
        }*/
    }
    def destroy = {
    }
}
#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
/**
 * 
 */
package security;

import org.springframework.security.core.GrantedAuthority;

/**
 * @author lgrippa
 *
 */
public class ApiGrantedAuthority implements GrantedAuthority {
	private static final long serialVersionUID = 6707002029353822574L;
	private String authority;
	public ApiGrantedAuthority() {}
	public ApiGrantedAuthority(String name) {
		authority = name;
	}
	@Override
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authName) {
		this.authority = authName;
	}

}

#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package services;

import java.util.List;

import entities.Roles;

public interface IRolesService {
	Roles find(long id);
	Roles find(String code);
	List<Roles> listAll();
	boolean save(Roles role);
	boolean remove(long id);
}

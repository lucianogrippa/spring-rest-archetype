#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package dao;

import java.util.List;

import entities.Roles;
import entities.User;

public interface UserDao {
	User findByCredential(String username,String pwd);
	User findById(long id);
	User findByIdUsername(String username, long userId);
	User findByRequestAuthToken(String authToken);
	boolean add(User user);
	boolean addInrole(User user,Roles roles);
	boolean delete(long id);
	List<User> list();
}

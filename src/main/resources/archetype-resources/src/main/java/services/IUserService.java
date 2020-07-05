#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package services;

import entities.User;

public interface IUserService {
	User authUser(String username,String pwd,String appKey);
	public User find(long id);
	 User authUserWithUUID(String username, long userId);
	 User authUserByRequestAuthToken(String authToken);
}

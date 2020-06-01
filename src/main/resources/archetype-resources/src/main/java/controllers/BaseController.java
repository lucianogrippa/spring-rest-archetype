#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package controllers;

import helpers.LogHelper;

public abstract class BaseController {
	protected LogHelper logger = LogHelper.getLogger();

	public LogHelper getLogger() {
		return logger;
	}

	public void setLogger(LogHelper logger) {
		this.logger = logger;
	}

}

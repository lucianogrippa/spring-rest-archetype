#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import controllers.ContentTestController;

public class SpringContextIntegrationTest {
	 
	    @InjectMocks
	    private ContentTestController contentTestController;
	 
	    private MockMvc mockMvc;
	 
	    @Before
	    public void setup() {
	    	System.setProperty("jboss.server.home.dir","./src/test/server");
	        System.setProperty("jboss.server.log.dir","./src/test/server/log");
	       
	        // Process mock annotations
	        MockitoAnnotations.initMocks(this);
	 
	        // Setup Spring test in standalone mode
	        this.mockMvc = MockMvcBuilders.standaloneSetup(contentTestController).build();
	 
	    }
	    
	    @Test
	    public void apiTestIdTestCase() throws Exception {
	    	
	    	this.mockMvc.perform(get("/api/test/10"))
	                .andExpect(status().isOk())
	                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
	                .andExpect(content().string(Matchers.containsString("${symbol_escape}"id${symbol_escape}":10")));
	    }
}
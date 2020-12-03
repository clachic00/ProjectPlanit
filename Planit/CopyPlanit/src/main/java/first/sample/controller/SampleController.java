package first.sample.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.sample.service.SampleService;

@Controller
public class SampleController {
	protected Log log = LogFactory.getLog(SampleController.class);

	@Resource(name="sampleService")
	private SampleService sampleService;

	@RequestMapping("/home")
	public ModelAndView openSampleList(Map<String, Object> commandMap) throws Exception {
		log.info("DdDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
		ModelAndView mv = new ModelAndView("");
		log.debug("인터셉터 테스트");
		
		mv.setViewName("home");
		return mv;
	}
}

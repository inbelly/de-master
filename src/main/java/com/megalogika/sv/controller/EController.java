package com.megalogika.sv.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.megalogika.sv.model.E;
import com.megalogika.sv.model.ProductCategory;
import com.megalogika.sv.model.User;
import com.megalogika.sv.service.ESearchCriteria;
import com.megalogika.sv.service.EService;
import com.megalogika.sv.service.ProductService;

@Controller("eController")
public class EController {
	public transient Logger logger = Logger.getLogger(EController.class);
	
	public final static String KEY_PRODUCT = "product";
	public final static String KEY_ADDED_TO_BASKET = "addedToBasket";
	public final static String KEY_REMOVED_FROM_BASKET = "removedFromBasket";
	public final static String KEY_CREATE_PRODUCT_IN_PROGRESS = "createProductInProgress";
	
	@Autowired 
	private FrontendService frontendService;
	@Autowired
	private ProductService productService;
	@Autowired
	private EService eService;

	@ModelAttribute(FrontendService.KEY_CONTEXT_PATH)
	public String getContextPath(HttpServletRequest request) {
		return frontendService.getContextPath(request);
	}
	
	@ModelAttribute(FrontendService.KEY_HAZARD_DESCRIPTIONS)
	public Map<String,String> getHazardDescriptions() {
		return frontendService.getHazardDescriptions();
	}
	
	@ModelAttribute(FrontendService.KEY_CATEGORY_LIST)
	public List<ProductCategory> getCategoryList() {
		return frontendService.getCategoryList();
	}
	
	@ModelAttribute(FrontendService.KEY_CURRENT_USER)
	public User getCurrentUser() {
		return frontendService.getUserService().getCurrentUser();
	}
	
	@RequestMapping("/eList")
	public ModelMap getConservantList(HttpSession session, HttpServletRequest request, ModelMap m,
			@RequestParam(required=false, value="clear") String clear,
			@RequestParam(required=false, value="page") String page,
			@RequestParam(required=false, value="pageSize") String pageSize) throws InstantiationException, IllegalAccessException 
	{
		ESearchCriteria criteria = (ESearchCriteria) frontendService.getCriteria(session, ESearchCriteria.class);
		
		criteria.updatePage(page);
		criteria.updatePageSize(pageSize);
		m.addAttribute("conservants", eService.getList(criteria));
		m.addAttribute(KEY_PRODUCT, null);
		
		m.addAttribute("additives", Boolean.TRUE);
		
		frontendService.addCriteria(m, session, ESearchCriteria.class);
		
		return m;
	}
	
	@RequestMapping("e/sort")
	public String sortConservantList(HttpSession session, @RequestParam(required=true, value="orderBy") String orderBy) throws InstantiationException, IllegalAccessException {
		ESearchCriteria criteria = (ESearchCriteria) frontendService.getCriteria(session, ESearchCriteria.class);
		criteria.setOrderBy(orderBy);
		
		return "redirect:/spring/eList";
	}
	
	@RequestMapping("e/delete")
	public String deleteConservant(HttpServletResponse response, 
						@RequestParam(required=true, value="eid") String eid) 
		throws IOException 
	{
		if (! StringUtils.hasText(eid)) {
			logger.debug("No id specified to delete E!");
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return "redirect:/spring/404";
		} else {
			E e = eService.load(Long.parseLong(eid));
			if (null == e) {
				logger.debug("Conservant to delete not found: " + eid);
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return "redirect:/spring/404";
			} else {
				eService.delete(e);
			}
		}
		
		return "redirect:/spring/eList";
	}
	
	@RequestMapping("e/approve")
	public String approveConservant(HttpServletResponse response, @RequestParam(required=true, value="eid") String eid) throws IOException {
		if (! StringUtils.hasText(eid)) {
			logger.debug("No id specified to approve conservant!");
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return "redirect:/spring/404";
		} else {
			E e = eService.load(Long.parseLong(eid));
			if (null == e) {
				logger.debug("Conservant to approve not found: " + eid);
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return "redirect:/spring/404";
			} else {
				eService.approve(e);
			}
		}
		
		return "redirect:/spring/eList";
	}
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setFrontendService(FrontendService frontendService) {
		this.frontendService = frontendService;
	}

	public FrontendService getFrontendService() {
		return frontendService;
	}

	public void seteService(EService eService) {
		this.eService = eService;
	}

	public EService geteService() {
		return eService;
	}
}

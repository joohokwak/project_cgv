package com.project.cgv.service;

import java.util.HashMap;

public interface ManageService {

	public HashMap<String,Object> showConnectionList(int page, HashMap<String,Object> option);
	public boolean addConnection(HashMap<String,Object> params);
	public boolean removeConnection(int num);
	
}

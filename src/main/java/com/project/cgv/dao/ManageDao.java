package com.project.cgv.dao;

import java.util.HashMap;
import java.util.List;

public interface ManageDao {
	public List<HashMap<String,Object>> getConnectionList(HashMap<String,Object> params);
	public int getConnectionCount();
	public int insertConnection(HashMap<String,Object> params) throws Exception;
	public int deleteConnection(int num);
}

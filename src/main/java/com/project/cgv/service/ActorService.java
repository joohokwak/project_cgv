package com.project.cgv.service;

import java.util.HashMap;
import java.util.List;

public interface ActorService {
	public HashMap<String,Object> showActorList(int page);
	public HashMap<String,Object> showActor(int num);
	public boolean addActor(HashMap<String,Object> params);
	public boolean modifyActor(HashMap<String,Object> params);
	public boolean removeActor(int num);
	
}

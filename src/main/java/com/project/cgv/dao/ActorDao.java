package com.project.cgv.dao;

import java.util.HashMap;
import java.util.List;

public interface ActorDao {
	public List<HashMap<String,Object>> selectAllActor(HashMap<String,Object> params);
	public List<HashMap<String,Object>> getActorList();
	public HashMap<String,Object> selectActor(int num);
	public int getActorCount();
	public int insertActor(HashMap<String,Object> params);
	public int updateActor(HashMap<String,Object> params);
	public int deleteActor(int num);
	public void updateActorImage(HashMap<String,Object> inputData);
	public List<HashMap<String, Object>> getMovieActor(int m_num);
}

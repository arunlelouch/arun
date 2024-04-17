package com.chegus.geni.dao.impl;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chegus.geni.common.CommonDAOImpl;
import com.chegus.geni.dao.CustomerDAO;
import com.chegus.geni.domain.BaseDO;
import com.chegus.geni.domain.BranchDO;
import com.chegus.geni.domain.CustomerDO;
import com.chegus.geni.domain.MaxIdDO;
import com.chegus.geni.util.AdditionalFieldSetUtil;

@Repository
public class CustomerDAOImpl<E,ID> extends CommonDAOImpl<BaseDO,Integer> implements CustomerDAO<E, ID> {
	
	@Autowired 
	SessionFactory SessionFactory;
	
	@Override
	public MaxIdDO getCustomerMaxIntId(String customerType) {
		
		CriteriaBuilder criteriaBuilder = sessionFactory.getCurrentSession().getCriteriaBuilder();
        CriteriaQuery<MaxIdDO> criteriaQuery = criteriaBuilder.createQuery(MaxIdDO.class);
        Root<MaxIdDO> root = criteriaQuery.from(MaxIdDO.class);
		criteriaQuery.select(root);
		criteriaQuery.where( criteriaBuilder.equal(root.get("refType"), customerType) );
		
		Query<MaxIdDO> q= sessionFactory.getCurrentSession().createQuery(criteriaQuery).setMaxResults(1);
		MaxIdDO maxIdDO = q.uniqueResult();
		
		if(null!=maxIdDO)
		{
			Integer max = maxIdDO.getMaxId();
			maxIdDO.setMaxId(++max);
//			AdditionalFieldSetUtil.setAdditionalFields(baseDO);
			maxIdDO.setUserid(null);
			sessionFactory.getCurrentSession().saveOrUpdate(maxIdDO);
			return maxIdDO; 
		}
		else
		{
			MaxIdDO maxIdDO2 = new MaxIdDO();
			maxIdDO2.setRefType(customerType);
			maxIdDO2.setExtFld01("CUST");
			maxIdDO2.setMaxId(1);
			maxIdDO2.setUserid(null);
			sessionFactory.getCurrentSession().saveOrUpdate(maxIdDO2);
			return maxIdDO2; 
		}
	}

    @Override
    public Integer getBranchIdByName(String branchName) {
        try  
        {
        	CriteriaBuilder builder = sessionFactory.getCurrentSession().getCriteriaBuilder();            
            CriteriaQuery<Integer> query = builder.createQuery(Integer.class);
            Root<BranchDO> root = query.from(BranchDO.class);
            query.select(root.get("Id")).where(builder.equal(root.get("branchName"), branchName));
            return sessionFactory.getCurrentSession().createQuery(query).uniqueResult();
        } 
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
}

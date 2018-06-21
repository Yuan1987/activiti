package com.dynastech.system.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrganizationExample {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public OrganizationExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<Criterion>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andIdIsNull() {
			addCriterion("Id is null");
			return (Criteria) this;
		}

		public Criteria andIdIsNotNull() {
			addCriterion("Id is not null");
			return (Criteria) this;
		}

		public Criteria andIdEqualTo(String value) {
			addCriterion("Id =", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotEqualTo(String value) {
			addCriterion("Id <>", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThan(String value) {
			addCriterion("Id >", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThanOrEqualTo(String value) {
			addCriterion("Id >=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThan(String value) {
			addCriterion("Id <", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThanOrEqualTo(String value) {
			addCriterion("Id <=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLike(String value) {
			addCriterion("Id like", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotLike(String value) {
			addCriterion("Id not like", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdIn(List<String> values) {
			addCriterion("Id in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotIn(List<String> values) {
			addCriterion("Id not in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdBetween(String value1, String value2) {
			addCriterion("Id between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotBetween(String value1, String value2) {
			addCriterion("Id not between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedIsNull() {
			addCriterion("DateTimeCreated is null");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedIsNotNull() {
			addCriterion("DateTimeCreated is not null");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedEqualTo(Date value) {
			addCriterion("DateTimeCreated =", value, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedNotEqualTo(Date value) {
			addCriterion("DateTimeCreated <>", value, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedGreaterThan(Date value) {
			addCriterion("DateTimeCreated >", value, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedGreaterThanOrEqualTo(Date value) {
			addCriterion("DateTimeCreated >=", value, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedLessThan(Date value) {
			addCriterion("DateTimeCreated <", value, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedLessThanOrEqualTo(Date value) {
			addCriterion("DateTimeCreated <=", value, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedIn(List<Date> values) {
			addCriterion("DateTimeCreated in", values, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedNotIn(List<Date> values) {
			addCriterion("DateTimeCreated not in", values, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedBetween(Date value1, Date value2) {
			addCriterion("DateTimeCreated between", value1, value2, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimecreatedNotBetween(Date value1, Date value2) {
			addCriterion("DateTimeCreated not between", value1, value2, "datetimecreated");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedIsNull() {
			addCriterion("DateTimeModified is null");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedIsNotNull() {
			addCriterion("DateTimeModified is not null");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedEqualTo(Date value) {
			addCriterion("DateTimeModified =", value, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedNotEqualTo(Date value) {
			addCriterion("DateTimeModified <>", value, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedGreaterThan(Date value) {
			addCriterion("DateTimeModified >", value, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedGreaterThanOrEqualTo(Date value) {
			addCriterion("DateTimeModified >=", value, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedLessThan(Date value) {
			addCriterion("DateTimeModified <", value, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedLessThanOrEqualTo(Date value) {
			addCriterion("DateTimeModified <=", value, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedIn(List<Date> values) {
			addCriterion("DateTimeModified in", values, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedNotIn(List<Date> values) {
			addCriterion("DateTimeModified not in", values, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedBetween(Date value1, Date value2) {
			addCriterion("DateTimeModified between", value1, value2, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDatetimemodifiedNotBetween(Date value1, Date value2) {
			addCriterion("DateTimeModified not between", value1, value2, "datetimemodified");
			return (Criteria) this;
		}

		public Criteria andDepthIsNull() {
			addCriterion("Depth is null");
			return (Criteria) this;
		}

		public Criteria andDepthIsNotNull() {
			addCriterion("Depth is not null");
			return (Criteria) this;
		}

		public Criteria andDepthEqualTo(Integer value) {
			addCriterion("Depth =", value, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthNotEqualTo(Integer value) {
			addCriterion("Depth <>", value, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthGreaterThan(Integer value) {
			addCriterion("Depth >", value, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthGreaterThanOrEqualTo(Integer value) {
			addCriterion("Depth >=", value, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthLessThan(Integer value) {
			addCriterion("Depth <", value, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthLessThanOrEqualTo(Integer value) {
			addCriterion("Depth <=", value, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthIn(List<Integer> values) {
			addCriterion("Depth in", values, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthNotIn(List<Integer> values) {
			addCriterion("Depth not in", values, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthBetween(Integer value1, Integer value2) {
			addCriterion("Depth between", value1, value2, "depth");
			return (Criteria) this;
		}

		public Criteria andDepthNotBetween(Integer value1, Integer value2) {
			addCriterion("Depth not between", value1, value2, "depth");
			return (Criteria) this;
		}

		public Criteria andDescriptionIsNull() {
			addCriterion("Description is null");
			return (Criteria) this;
		}

		public Criteria andDescriptionIsNotNull() {
			addCriterion("Description is not null");
			return (Criteria) this;
		}

		public Criteria andDescriptionEqualTo(String value) {
			addCriterion("Description =", value, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionNotEqualTo(String value) {
			addCriterion("Description <>", value, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionGreaterThan(String value) {
			addCriterion("Description >", value, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionGreaterThanOrEqualTo(String value) {
			addCriterion("Description >=", value, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionLessThan(String value) {
			addCriterion("Description <", value, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionLessThanOrEqualTo(String value) {
			addCriterion("Description <=", value, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionLike(String value) {
			addCriterion("Description like", value, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionNotLike(String value) {
			addCriterion("Description not like", value, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionIn(List<String> values) {
			addCriterion("Description in", values, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionNotIn(List<String> values) {
			addCriterion("Description not in", values, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionBetween(String value1, String value2) {
			addCriterion("Description between", value1, value2, "description");
			return (Criteria) this;
		}

		public Criteria andDescriptionNotBetween(String value1, String value2) {
			addCriterion("Description not between", value1, value2, "description");
			return (Criteria) this;
		}

		public Criteria andDisplaynameIsNull() {
			addCriterion("DisplayName is null");
			return (Criteria) this;
		}

		public Criteria andDisplaynameIsNotNull() {
			addCriterion("DisplayName is not null");
			return (Criteria) this;
		}

		public Criteria andDisplaynameEqualTo(String value) {
			addCriterion("DisplayName =", value, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameNotEqualTo(String value) {
			addCriterion("DisplayName <>", value, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameGreaterThan(String value) {
			addCriterion("DisplayName >", value, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameGreaterThanOrEqualTo(String value) {
			addCriterion("DisplayName >=", value, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameLessThan(String value) {
			addCriterion("DisplayName <", value, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameLessThanOrEqualTo(String value) {
			addCriterion("DisplayName <=", value, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameLike(String value) {
			addCriterion("DisplayName like", value, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameNotLike(String value) {
			addCriterion("DisplayName not like", value, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameIn(List<String> values) {
			addCriterion("DisplayName in", values, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameNotIn(List<String> values) {
			addCriterion("DisplayName not in", values, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameBetween(String value1, String value2) {
			addCriterion("DisplayName between", value1, value2, "displayname");
			return (Criteria) this;
		}

		public Criteria andDisplaynameNotBetween(String value1, String value2) {
			addCriterion("DisplayName not between", value1, value2, "displayname");
			return (Criteria) this;
		}

		public Criteria andIsdeletedIsNull() {
			addCriterion("IsDeleted is null");
			return (Criteria) this;
		}

		public Criteria andIsdeletedIsNotNull() {
			addCriterion("IsDeleted is not null");
			return (Criteria) this;
		}

		public Criteria andIsdeletedEqualTo(Boolean value) {
			addCriterion("IsDeleted =", value, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedNotEqualTo(Boolean value) {
			addCriterion("IsDeleted <>", value, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedGreaterThan(Boolean value) {
			addCriterion("IsDeleted >", value, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedGreaterThanOrEqualTo(Boolean value) {
			addCriterion("IsDeleted >=", value, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedLessThan(Boolean value) {
			addCriterion("IsDeleted <", value, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedLessThanOrEqualTo(Boolean value) {
			addCriterion("IsDeleted <=", value, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedIn(List<Boolean> values) {
			addCriterion("IsDeleted in", values, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedNotIn(List<Boolean> values) {
			addCriterion("IsDeleted not in", values, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedBetween(Boolean value1, Boolean value2) {
			addCriterion("IsDeleted between", value1, value2, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andIsdeletedNotBetween(Boolean value1, Boolean value2) {
			addCriterion("IsDeleted not between", value1, value2, "isdeleted");
			return (Criteria) this;
		}

		public Criteria andNameIsNull() {
			addCriterion("Name is null");
			return (Criteria) this;
		}

		public Criteria andNameIsNotNull() {
			addCriterion("Name is not null");
			return (Criteria) this;
		}

		public Criteria andNameEqualTo(String value) {
			addCriterion("Name =", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameNotEqualTo(String value) {
			addCriterion("Name <>", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameGreaterThan(String value) {
			addCriterion("Name >", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameGreaterThanOrEqualTo(String value) {
			addCriterion("Name >=", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameLessThan(String value) {
			addCriterion("Name <", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameLessThanOrEqualTo(String value) {
			addCriterion("Name <=", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameLike(String value) {
			addCriterion("Name like", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameNotLike(String value) {
			addCriterion("Name not like", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameIn(List<String> values) {
			addCriterion("Name in", values, "name");
			return (Criteria) this;
		}

		public Criteria andNameNotIn(List<String> values) {
			addCriterion("Name not in", values, "name");
			return (Criteria) this;
		}

		public Criteria andNameBetween(String value1, String value2) {
			addCriterion("Name between", value1, value2, "name");
			return (Criteria) this;
		}

		public Criteria andNameNotBetween(String value1, String value2) {
			addCriterion("Name not between", value1, value2, "name");
			return (Criteria) this;
		}

		public Criteria andOrdinalIsNull() {
			addCriterion("Ordinal is null");
			return (Criteria) this;
		}

		public Criteria andOrdinalIsNotNull() {
			addCriterion("Ordinal is not null");
			return (Criteria) this;
		}

		public Criteria andOrdinalEqualTo(Integer value) {
			addCriterion("Ordinal =", value, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalNotEqualTo(Integer value) {
			addCriterion("Ordinal <>", value, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalGreaterThan(Integer value) {
			addCriterion("Ordinal >", value, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalGreaterThanOrEqualTo(Integer value) {
			addCriterion("Ordinal >=", value, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalLessThan(Integer value) {
			addCriterion("Ordinal <", value, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalLessThanOrEqualTo(Integer value) {
			addCriterion("Ordinal <=", value, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalIn(List<Integer> values) {
			addCriterion("Ordinal in", values, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalNotIn(List<Integer> values) {
			addCriterion("Ordinal not in", values, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalBetween(Integer value1, Integer value2) {
			addCriterion("Ordinal between", value1, value2, "ordinal");
			return (Criteria) this;
		}

		public Criteria andOrdinalNotBetween(Integer value1, Integer value2) {
			addCriterion("Ordinal not between", value1, value2, "ordinal");
			return (Criteria) this;
		}

		public Criteria andParentidIsNull() {
			addCriterion("ParentId is null");
			return (Criteria) this;
		}

		public Criteria andParentidIsNotNull() {
			addCriterion("ParentId is not null");
			return (Criteria) this;
		}

		public Criteria andParentidEqualTo(String value) {
			addCriterion("ParentId =", value, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidNotEqualTo(String value) {
			addCriterion("ParentId <>", value, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidGreaterThan(String value) {
			addCriterion("ParentId >", value, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidGreaterThanOrEqualTo(String value) {
			addCriterion("ParentId >=", value, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidLessThan(String value) {
			addCriterion("ParentId <", value, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidLessThanOrEqualTo(String value) {
			addCriterion("ParentId <=", value, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidLike(String value) {
			addCriterion("ParentId like", value, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidNotLike(String value) {
			addCriterion("ParentId not like", value, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidIn(List<String> values) {
			addCriterion("ParentId in", values, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidNotIn(List<String> values) {
			addCriterion("ParentId not in", values, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidBetween(String value1, String value2) {
			addCriterion("ParentId between", value1, value2, "parentid");
			return (Criteria) this;
		}

		public Criteria andParentidNotBetween(String value1, String value2) {
			addCriterion("ParentId not between", value1, value2, "parentid");
			return (Criteria) this;
		}

		public Criteria andPathIsNull() {
			addCriterion("Path is null");
			return (Criteria) this;
		}

		public Criteria andPathIsNotNull() {
			addCriterion("Path is not null");
			return (Criteria) this;
		}

		public Criteria andPathEqualTo(String value) {
			addCriterion("Path =", value, "path");
			return (Criteria) this;
		}

		public Criteria andPathNotEqualTo(String value) {
			addCriterion("Path <>", value, "path");
			return (Criteria) this;
		}

		public Criteria andPathGreaterThan(String value) {
			addCriterion("Path >", value, "path");
			return (Criteria) this;
		}

		public Criteria andPathGreaterThanOrEqualTo(String value) {
			addCriterion("Path >=", value, "path");
			return (Criteria) this;
		}

		public Criteria andPathLessThan(String value) {
			addCriterion("Path <", value, "path");
			return (Criteria) this;
		}

		public Criteria andPathLessThanOrEqualTo(String value) {
			addCriterion("Path <=", value, "path");
			return (Criteria) this;
		}

		public Criteria andPathLike(String value) {
			addCriterion("Path like", value, "path");
			return (Criteria) this;
		}

		public Criteria andPathNotLike(String value) {
			addCriterion("Path not like", value, "path");
			return (Criteria) this;
		}

		public Criteria andPathIn(List<String> values) {
			addCriterion("Path in", values, "path");
			return (Criteria) this;
		}

		public Criteria andPathNotIn(List<String> values) {
			addCriterion("Path not in", values, "path");
			return (Criteria) this;
		}

		public Criteria andPathBetween(String value1, String value2) {
			addCriterion("Path between", value1, value2, "path");
			return (Criteria) this;
		}

		public Criteria andPathNotBetween(String value1, String value2) {
			addCriterion("Path not between", value1, value2, "path");
			return (Criteria) this;
		}

		public Criteria andSnIsNull() {
			addCriterion("Sn is null");
			return (Criteria) this;
		}

		public Criteria andSnIsNotNull() {
			addCriterion("Sn is not null");
			return (Criteria) this;
		}

		public Criteria andSnEqualTo(Integer value) {
			addCriterion("Sn =", value, "sn");
			return (Criteria) this;
		}

		public Criteria andSnNotEqualTo(Integer value) {
			addCriterion("Sn <>", value, "sn");
			return (Criteria) this;
		}

		public Criteria andSnGreaterThan(Integer value) {
			addCriterion("Sn >", value, "sn");
			return (Criteria) this;
		}

		public Criteria andSnGreaterThanOrEqualTo(Integer value) {
			addCriterion("Sn >=", value, "sn");
			return (Criteria) this;
		}

		public Criteria andSnLessThan(Integer value) {
			addCriterion("Sn <", value, "sn");
			return (Criteria) this;
		}

		public Criteria andSnLessThanOrEqualTo(Integer value) {
			addCriterion("Sn <=", value, "sn");
			return (Criteria) this;
		}

		public Criteria andSnIn(List<Integer> values) {
			addCriterion("Sn in", values, "sn");
			return (Criteria) this;
		}

		public Criteria andSnNotIn(List<Integer> values) {
			addCriterion("Sn not in", values, "sn");
			return (Criteria) this;
		}

		public Criteria andSnBetween(Integer value1, Integer value2) {
			addCriterion("Sn between", value1, value2, "sn");
			return (Criteria) this;
		}

		public Criteria andSnNotBetween(Integer value1, Integer value2) {
			addCriterion("Sn not between", value1, value2, "sn");
			return (Criteria) this;
		}

		public Criteria andTypeidIsNull() {
			addCriterion("TypeId is null");
			return (Criteria) this;
		}

		public Criteria andTypeidIsNotNull() {
			addCriterion("TypeId is not null");
			return (Criteria) this;
		}

		public Criteria andTypeidEqualTo(String value) {
			addCriterion("TypeId =", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidNotEqualTo(String value) {
			addCriterion("TypeId <>", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidGreaterThan(String value) {
			addCriterion("TypeId >", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidGreaterThanOrEqualTo(String value) {
			addCriterion("TypeId >=", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidLessThan(String value) {
			addCriterion("TypeId <", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidLessThanOrEqualTo(String value) {
			addCriterion("TypeId <=", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidLike(String value) {
			addCriterion("TypeId like", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidNotLike(String value) {
			addCriterion("TypeId not like", value, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidIn(List<String> values) {
			addCriterion("TypeId in", values, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidNotIn(List<String> values) {
			addCriterion("TypeId not in", values, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidBetween(String value1, String value2) {
			addCriterion("TypeId between", value1, value2, "typeid");
			return (Criteria) this;
		}

		public Criteria andTypeidNotBetween(String value1, String value2) {
			addCriterion("TypeId not between", value1, value2, "typeid");
			return (Criteria) this;
		}

		public Criteria andExtensiondataIsNull() {
			addCriterion("ExtensionData is null");
			return (Criteria) this;
		}

		public Criteria andExtensiondataIsNotNull() {
			addCriterion("ExtensionData is not null");
			return (Criteria) this;
		}

		public Criteria andExtensiondataEqualTo(String value) {
			addCriterion("ExtensionData =", value, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataNotEqualTo(String value) {
			addCriterion("ExtensionData <>", value, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataGreaterThan(String value) {
			addCriterion("ExtensionData >", value, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataGreaterThanOrEqualTo(String value) {
			addCriterion("ExtensionData >=", value, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataLessThan(String value) {
			addCriterion("ExtensionData <", value, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataLessThanOrEqualTo(String value) {
			addCriterion("ExtensionData <=", value, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataLike(String value) {
			addCriterion("ExtensionData like", value, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataNotLike(String value) {
			addCriterion("ExtensionData not like", value, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataIn(List<String> values) {
			addCriterion("ExtensionData in", values, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataNotIn(List<String> values) {
			addCriterion("ExtensionData not in", values, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataBetween(String value1, String value2) {
			addCriterion("ExtensionData between", value1, value2, "extensiondata");
			return (Criteria) this;
		}

		public Criteria andExtensiondataNotBetween(String value1, String value2) {
			addCriterion("ExtensionData not between", value1, value2, "extensiondata");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table RS_Organization
	 * @mbggenerated  Fri Jul 28 13:39:34 CST 2017
	 */
	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}

	/**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table RS_Organization
     *
     * @mbggenerated do_not_delete_during_merge Wed Jul 26 15:56:19 CST 2017
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}
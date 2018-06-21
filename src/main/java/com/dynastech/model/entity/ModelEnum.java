package com.dynastech.model.entity;

public enum ModelEnum {
	STATUS_0("草稿"),STATUS_1("审核中"),STATUS_2("已通过"),STATUS_3("未通过"),
	LEADER_ROLE_ID("00000000-0000-0000-0000-000000000001"),//角色类型为领导
	flow_NODE1_NAME("本部门领导"),
	flow_NODE2_NAME("事业部"),
	flow_NODE3_NAME("序列小组"),
	
	EVALSTATUS_0("草稿"),EVALSTATUS_1("审核中"),EVALSTATUS_2("已通过"),EVALSTATUS_3("审核未通过"),EVALSTATUS_4("测评未通过"),
	
	efflow_NODE1_NAME("本部门领导"),
	efflow_NODE2_NAME("事业部"),
	efflow_NODE3_NAME("序列小组"),
	efflow_NODE4_NAME("评分人"),
	efflow_NODE5_NAME("汇总"),
	
	
	roleName_CPR("评分人")
	;
	
	
	
	
	// 成员变量
	private String name;

	// 构造方法
	private ModelEnum(String name) {
		this.name = name;
	}

	public String getValue() {
		return this.name;
	}
}

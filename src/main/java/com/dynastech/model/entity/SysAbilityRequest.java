package com.dynastech.model.entity;


import java.io.Serializable;

/**
 * Created by ganlu on 2017/9/19.
 */
public class SysAbilityRequest {
    private String id;
    private String name;
    private String serial;
    private String thelevel;
    private String typeid;
        private Long score;
   private String formula;
    private Long passmark;
    private String evidence;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }

    public String getThelevel() {
        return thelevel;
    }

    public void setThelevel(String thelevel) {
        this.thelevel = thelevel;
    }

    public String getTypeid() {
        return typeid;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid;
    }

        public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    public Long getPassmark() {
        return passmark;
    }

    public void setPassmark(Long passmark) {
        this.passmark = passmark;
    }

    public String getEvidence() {
        return evidence;
    }

    public void setEvidence(String evidence) {
        this.evidence = evidence;
    }
}

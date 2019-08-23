/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:13 AM                     *
 *************************************
 */

package model;

import java.sql.Date;

public class Category {
    private int id;
    private String nameCategories;
    private String creator;
    private Date dateCreated;
    private String finalEditor;
    private Date lastModifiedDate;

    public Category(){}

    public Category(int id){
        this.id = id;
    }
    public Category(int id, String nameCategories){
        this.id = id;
        this.nameCategories = nameCategories;
    }
    public Category(String nameCategories){
        this.nameCategories = nameCategories;
    }
    public Category(int id, String nameCategories,String creator, Date dateCreated, String finalEditor, Date lastModifiedDate){
        this.id = id;
        this.nameCategories = nameCategories;
        this.creator = creator;
        this.dateCreated = dateCreated;
        this.finalEditor = finalEditor;
        this.lastModifiedDate = lastModifiedDate;
    }
    public Category(int id, String nameCategories,String creator, String finalEditor){
        this.id = id;
        this.nameCategories = nameCategories;
        this.creator = creator;
        this.finalEditor = finalEditor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameCategories() {
        return nameCategories;
    }

    public void setNameCategories(String nameCategories) {
        this.nameCategories = nameCategories;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getFinalEditor() {
        return finalEditor;
    }

    public void setFinalEditor(String finalEditor) {
        this.finalEditor = finalEditor;
    }

    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
}

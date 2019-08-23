/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:14 AM                     *
 *************************************
 */

package model;

import java.sql.Date;

public class User {
    private int id;
    private String username;
    private String password;
    private String role;
    private String salt;
    private String image;
    private String creator;
    private Date dateCreated;
    private String finalEditor;
    private Date lastModifiedDate;

    public User(){

    }

    public User(int id) {
        this.id = id;
    }

    //vua them
    public User(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String salt) {
        this.username = username;
        this.password = password;
        this.salt = salt;
    }

    public User(int id, String username, String password, String role, String salt) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.salt = salt;
    }

    public User(int id, String username, String password, String role, String salt, String creator, Date dateCreated) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.salt = salt;
        this.creator = creator;
        this.dateCreated = dateCreated;
    }

    public User(int id, String username, String password, String salt) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.salt = salt;
    }

    public User(int id, String username, String password, String role, String salt, String image,
                String creator, Date dateCreated, String finalEditor, Date lastModifiedDate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.salt = salt;
        this.image = image;
        this.creator = creator;
        this.dateCreated = dateCreated;
        this.finalEditor = finalEditor;
        this.lastModifiedDate = lastModifiedDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

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

public class Comment {
    private int id;
    private String contents;
    private Date dateCreated;
    private Date lastModifiedDate;
    private int idUsers;
    private int idPosts;
    private String username;
    private String titlePost;

    public Comment() {
    }

    public Comment(int id) {
        this.id = id;
    }

    public Comment(String contents) {
        this.contents = contents;
    }

    public Comment(int id, String contents) {
        this.id = id;
        this.contents = contents;
    }

    public Comment(int id, String contents, int idUsers, int idPosts) {
        this.id = id;
        this.contents = contents;
        this.idUsers = idUsers;
        this.idPosts = idPosts;
    }

    public Comment(String contents, int idUsers, int idPosts) {
        this.contents = contents;
        this.idUsers = idUsers;
        this.idPosts = idPosts;
    }

    public Comment(int id, String contents, Date dateCreated, Date lastModifiedDate, int idUsers, int idPosts) {
        this.id = id;
        this.contents = contents;
        this.dateCreated = dateCreated;
        this.lastModifiedDate = lastModifiedDate;
        this.idUsers = idUsers;
        this.idPosts = idPosts;
    }
    public Comment(int id, String contents, Date dateCreated, Date lastModifiedDate, int idUsers, int idPosts, String username, String titlePost) {
        this.id = id;
        this.contents = contents;
        this.dateCreated = dateCreated;
        this.lastModifiedDate = lastModifiedDate;
        this.idUsers = idUsers;
        this.idPosts = idPosts;
        this.username = username;
        this.titlePost = titlePost;
    }
    public Comment(int id, String contents, Date dateCreated, Date lastModifiedDate, int idUsers, int idPosts, String username) {
        this.id = id;
        this.contents = contents;
        this.dateCreated = dateCreated;
        this.lastModifiedDate = lastModifiedDate;
        this.idUsers = idUsers;
        this.idPosts = idPosts;
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public int getIdUsers() {
        return idUsers;
    }

    public void setIdUsers(int idUsers) {
        this.idUsers = idUsers;
    }

    public int getIdPosts() {
        return idPosts;
    }

    public void setIdPosts(int idPosts) {
        this.idPosts = idPosts;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitlePost() {
        return titlePost;
    }

    public void setTitlePost(String title) {
        this.titlePost = title;
    }
}

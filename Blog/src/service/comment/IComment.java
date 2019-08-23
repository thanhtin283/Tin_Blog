/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:15 AM                     *
 *************************************
 */

package service.comment;

import model.Comment;
import model.User;

import java.util.List;

public interface IComment {
    public boolean createComment(Comment comment);

    public Comment getCommentById(int id);

    public List<Comment> getAllComment();

    public List<Comment> getAllCommentOfPost(int idPosts);

    public List<Comment> getAllCommentOfPost_Username(int idPosts);

    public List<Comment> getAllCommentOfUser(int idUser);

    public boolean updateComment(Comment comment);

    public boolean deleteComment(Comment comment);
}

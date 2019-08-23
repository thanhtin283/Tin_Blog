/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 9:15 AM                     *
 *************************************
 */

package service.post;

import model.Post;

import java.util.List;

public interface IPost {

    public void createPost(Post post);

    public Post getPostById(int id);

    public List<Post> getAllPosts();

    public List<Post> getAllPostsByCategory(int idCategory);

    public List<Post> getSearchResults(String keyword);

    public Post getLatestPostByCategory(int idCategory);

    public void updatePost(int id, Post post);

    public void deletePost(Post post);
}

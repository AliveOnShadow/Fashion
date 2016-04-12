﻿using Fashion.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Fashion.Code.DAL
{
    public class PostComment_dal
    {
        /// <summary>
        /// 获取评论数据
        /// </summary>
        /// 这里还没有分条数，即这里全部取出来
        /// <param name="postId">帖子的id</param>
        /// <param name="postType">帖子类型</param>
        /// <returns></returns>
        public List<PostComment_model> GetPostComment(int postId,int postType)
        {
            string sqlStr = @"select PC.Comment_Id 'commentId',PC.Comment_Content 'content',PC.Comment_PostId 'postId',
                                                    PC.Conment_PostType 'postType',PC.Conment_SupportCount 'supportCount',PC.Conment_Date 'datetime',
                                                    Commenter.[User_Id] 'commenterId',Commenter.[User_Name] 'commenterName',Commenter.User_TouXiangUrl 'commenterTouXiang',
	                                                BeCommenter.[User_Id] 'beCommenterId',BeCommenter.[User_Name] 'beCommenterName',BeCommenter.User_TouXiangUrl 'beCommenterTouXiang'
                                          from (tb_PostComment PC left join tb_User Commenter on PC.Comment_CommenterId=Commenter.User_Id)
                                                left join tb_User BeCommenter on PC.Comment_BeCommenterId=BeCommenter.User_Id
	                                      where PC.Comment_PostId=@postId and PC.Conment_PostType=@postType";
            SqlParameter[] parameters = new SqlParameter[] { 
                new SqlParameter("@postId",postId),
                new SqlParameter("@postType",postType)
            };
            DataTable dataTable = SqlHelper.ExecuteDataTable(sqlStr, parameters);
            List<PostComment_model> postComment_modelList = new List<PostComment_model>();
            foreach (DataRow row in dataTable.Rows)
            {
                postComment_modelList.Add(ToModel(row));
            }
            return postComment_modelList;
        }

        public PostComment_model ToModel(DataRow row)
        {
      
                PostComment_model postComment_model = new PostComment_model();
                postComment_model.postCommentId = (int)row["commentId"];
                postComment_model.postCommentContent = row["content"].ToString();
                postComment_model.postCommentPostId = (int)row["postId"];
                postComment_model.postType = (int)row["postType"];
                postComment_model.postCommentSupportCount = (int)row["supportCount"];
                postComment_model.postCommentDate = (DateTime)row["datetime"];

                postComment_model.Commenter.userId = (int)row["commenterId"];
                postComment_model.Commenter.userName = row["commenterName"].ToString();
                postComment_model.Commenter.touXiangUrl = row["commenterTouXiang"].ToString();

                postComment_model.BeCommenter.userId = (int)row["beCommenterId"];
                postComment_model.BeCommenter.userName = row["beCommenterName"].ToString();
                postComment_model.BeCommenter.touXiangUrl = row["beCommenterTouXiang"].ToString();
                return postComment_model;
           
            
        }
    }
}
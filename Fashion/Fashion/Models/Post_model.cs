﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fashion.Models
{
    public class Post_model
    {
        //帖子信息
        public int postId;//帖子编码
        public string postCaption;//帖子标题
        public string postContent;//帖子内容
        public string postSender;//发布者
        public int postModuleId;//模块编码
        public int postThemeId;//板块编码
        public int postSupportCount;//点赞数
        public DateTime postDate;//发帖日期
    }
}
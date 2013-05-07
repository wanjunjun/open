package com.wjj.jbpm.service;


import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.wjj.cwz.core.db.DbUtil;
import com.wjj.jbpm.entity.TaskVo;

public class JbpmTaskService {



    public TaskVo getTaskByWorkItemId(Long workItemId, Long processId) {
        try {
            ResultSetHandler<List<TaskVo>> h = new BeanListHandler<TaskVo>(TaskVo.class);
            QueryRunner run = new QueryRunner(DbUtil.getDs());
            List<TaskVo> list = run.query("select t.id as taskId,t.status as status from task t where  t.workItemId =? and t.processinstanceid = ?", h, workItemId, processId);
            if (null != list && list.size() > 0) {
                return list.get(list.size() - 1);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }

    //工作流申请的时候，查询TASK的方法
    public TaskVo getApplyTask(String userId, Long processInstanceId) {
        try {
            ResultSetHandler<List<TaskVo>> h = new BeanListHandler<TaskVo>(TaskVo.class);
            QueryRunner run = new QueryRunner(DbUtil.getDs());
            List<TaskVo> list = run.query("select t.id as taskId,t.status as status from task t where  t.createdBy_id =? and t.processinstanceid = ? and t.status in ('Created' , 'Ready' , 'Reserved' , 'InProgress' , 'Suspended')", h, userId, processInstanceId);
            if (null != list && list.size() > 0) {
                return list.get(list.size() - 1);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        new JbpmTaskService().getTaskByWorkItemId(1913l, 1913l);
    }
}

package com.modules;

public class Task {
    private int taskId;
    private String project;
    private String taskDate;
    private String startTime;
    private String endTime;
    private String category;
    private String description;

    public Task() {
    }

    public Task(String project, String taskDate, String startTime, String endTime, String category, String description) {
        this.project = project;
        this.taskDate = taskDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.category = category;
        this.description = description;
    }

    public Task(int taskId, String project, String taskDate, String startTime, String endTime, String category, String description) {
        this.taskId = taskId;
        this.project = project;
        this.taskDate = taskDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.category = category;
        this.description = description;
    }

    // Getters and Setters
    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getTaskDate() {
        return taskDate;
    }

    public void setTaskDate(String taskDate) {
        this.taskDate = taskDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

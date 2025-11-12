package com.lms.DTO;

public class PageDTO {


    private Integer firstLessonId;

    private Integer lastLessonId;

    public Integer getFirstLessonId() {
        return firstLessonId;
    }

    public void setFirstLessonId(Integer firstLessonId) {
        this.firstLessonId = firstLessonId;
    }

    public Integer getLastLessonId() {
        return lastLessonId;
    }

    public void setLastLessonId(Integer lastLessonId) {
        this.lastLessonId = lastLessonId;
    }

    @Override
    public String toString() {
        return "PageDTO{" +
                "firstLessonId='" + firstLessonId + '\'' +
                ", lastLessonId='" + lastLessonId + '\'' +
                '}';
    }
}

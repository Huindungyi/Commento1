package com.devfun.vo;

public class MovieVO {
    private String title;
    private String director;
    private int year;

    public MovieVO() {}

    public MovieVO(String title, String director, int year) {
        this.title = title;
        this.director = director;
        this.year = year;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    // toString
    @Override
    public String toString() {
        return "MovieVO [title=" + title + ", director=" + director + ", year=" + year + "]";
    }
}
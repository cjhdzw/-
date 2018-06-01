package model;

public class book {
    String bookname;
    String author;
    String press;
    public void book(String bookname,String author,String press){
        this.bookname=bookname;
        this.author=author;
        this.press=press;
    }

    public String getAuthor() {
        return author;
    }

    public String getBookname() {
        return bookname;
    }

    public String getPress() {
        return press;
    }
}


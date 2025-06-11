package model;

import java.time.LocalDateTime;

public class Message {
    private int id;
    private int senderId;
    private String senderName;
    private int receiverId;
    private Integer postId;
    private String content;
    private LocalDateTime createdAt;
    private boolean isRead;

    // Constructor
    public Message(int id, int senderId, String senderName, int receiverId, 
                  Integer postId, String content, LocalDateTime createdAt, boolean isRead) {
        this.id = id;
        this.senderId = senderId;
        this.senderName = senderName;
        this.receiverId = receiverId;
        this.postId = postId;
        this.content = content;
        this.createdAt = createdAt;
        this.isRead = isRead;
    }

    // Getters and setters
    public int getId() { return id; }
    public int getSenderId() { return senderId; }
    public String getSenderName() { return senderName; }
    public int getReceiverId() { return receiverId; }
    public Integer getPostId() { return postId; }
    public String getContent() { return content; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public boolean isRead() { return isRead; }
    
    // Setters if needed
    public void setRead(boolean read) { isRead = read; }
}
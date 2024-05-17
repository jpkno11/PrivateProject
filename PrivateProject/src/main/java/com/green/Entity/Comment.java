package com.green.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
 @Id
 @GeneratedValue(strategy = GenerationType.AUTO)
 private Long id; //대표키
 @ManyToOne
 @JoinColumn(name="article_id")
 private Article article;
 @Column
 private String nickname;
 @Column
 private String body;
}

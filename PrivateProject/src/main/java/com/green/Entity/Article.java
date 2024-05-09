package com.green.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Getter
public class Article {
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Long id;
@Column
private String title;
@Column
private String content;


}



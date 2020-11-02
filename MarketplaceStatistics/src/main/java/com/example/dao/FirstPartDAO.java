package com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.FirstPart;

@Repository
public interface FirstPartDAO extends JpaRepository<FirstPart, Integer>{

}

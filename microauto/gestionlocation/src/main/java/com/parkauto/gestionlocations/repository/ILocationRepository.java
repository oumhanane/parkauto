package com.parkauto.gestionlocations.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.parkauto.gestionlocations.entity.Location;

@Repository
public interface ILocationRepository extends JpaRepository<Location, Long> {


  
}

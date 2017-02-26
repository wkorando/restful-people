package com.khs.restful.people.repo;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.khs.restful.people.model.Person;

@RepositoryRestResource(collectionResourceRel = "people", path = "people")
public interface PersonRepo extends PagingAndSortingRepository<Person, Long> {

}

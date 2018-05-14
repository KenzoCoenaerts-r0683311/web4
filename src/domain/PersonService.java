package domain;

import java.util.List;

import db.PersonRepository;
import db.PersonRepositoryStub;


public class PersonService {
	private PersonRepository personRepository = new PersonRepositoryStub();
	private Chat chatApp = new Chat();

	public void addMessage(String p1, String p2, String messages){
		chatApp.addMessage(p1, p2, messages);
	}

	public List<String> getMessages(String p1, String p2) {
		return chatApp.getMessages(p1, p2);
	}

	public PersonService(){
	}

	public Person getPerson(String personId)  {
		return getPersonRepository().get(personId);
	}

	public List<Person> getPersons() {
		return getPersonRepository().getAll();
	}

	public void addPerson(Person person) {
		getPersonRepository().add(person);
	}

	public void updatePersons(Person person) {
		getPersonRepository().update(person);
	}

	public void deletePerson(String id) {
		getPersonRepository().delete(id);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		return getPersonRepository().getAuthenticatedUser(email, password);
	}

	private PersonRepository getPersonRepository() {
		return personRepository;
	}

	public boolean personExsits(String personId){
		return getPersonRepository().personExsits(personId);
	};


}

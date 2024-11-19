import 'observer.dart';

class JobPost {
  final String title;
  JobPost(this.title);

  String getTitle() => title;
}

abstract class Observer002 {
  void onJobPosted(JobPost job);
}

class JobSeeker implements Observer002 {
  final String name;
  JobSeeker(this.name);
  @override
  void onJobPosted(JobPost job) {
    print("Hi $name! New job posted: ${job.getTitle()}");
  }
}

abstract class Observable {
  void attach(Observer002 observer);
  void detach(Observer002 observer);
  void notify(JobPost job);
}

class EmploymentAgency implements Observable {
  final List<Observer002> _observers = [];
  @override
  void attach(Observer002 observer) {
    _observers.add(observer);
  }

  @override
  void detach(Observer002 observer) {
    _observers.remove(observer);
  }

  @override
  void notify(JobPost job) {
    for (var observer in _observers) {
      observer.onJobPosted(job);
    }
  }

  void addJob(JobPost jobPosting) {
    notify(jobPosting);
  }
}

void main() {
  var johnDoe = JobSeeker('Jhon Doe');
  var janeDoe = JobSeeker('Jane Doe');
  var adrianFerreiro = JobSeeker('Adrian Ferreiro');

  var jobPostings = EmploymentAgency();
  jobPostings.attach(johnDoe);
  jobPostings.attach(janeDoe);
  jobPostings.attach(adrianFerreiro);

  jobPostings.addJob(JobPost('Flutter developer'));

  jobPostings.detach(johnDoe);
  jobPostings.addJob(JobPost('MobDev'));
}

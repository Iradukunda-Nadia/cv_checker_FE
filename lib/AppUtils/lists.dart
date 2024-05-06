import 'package:flutter/material.dart';

class Lists{

  static List<String> randomImages = [
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
  ];

static List categories = [
  "IT", "Healthcare", "Agriculture", "Media",
  "Finance", "Education", "Manufacturing", "Retail"
];

static List experience = [
  "Entry Level", "Mid- Level", "Senior Level", "Expert"
];

static List education = [
  "PHD", "Masters", "Bachelors"
];

static List candidates = [
  {
    "id": "1",
    "name": "Jane Doe",
    "jobInterest": "IOS Developer",
    "email": "janedoe@gmail.com",
    "image": "https://picsum.photos/seed/536/600",
    "experience": "Expert",
    "yrs": "3",
    "Education": [{
      "level": "Bachelors",
      "courseTitle": "Bsc. Computer Science",
      "startDate": "01/01/2021",
      "endDate": "01/01/2021"
    },
      {
        "level": "Masters",
        "courseTitle": "Msc. Computer Science",
        "startDate": "01/01/2021",
        "endDate": "01/01/2021"
      }
    ],
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "2",
    "jobInterest":"Android Developer",
    "name": "Ann Smith",
    "email": "annsmith@gmail.com",
    "image": "https://picsum.photos/seed/536/600",
    "experience": "Entry Level",
    "yrs": "3",
    "Education": [{
      "level": "Bachelors",
      "courseTitle": "Bsc. Computer Science",
      "startDate": "01/01/2021",
      "endDate": "01/01/2021"
    },
      {
        "level": "Masters",
        "courseTitle": "Msc. Computer Science",
        "startDate": "01/01/2021",
        "endDate": "01/01/2021"
      }
    ],
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "3",
    "jobInterest":"Web Developer",
    "name": "Jim Jones",
    "email": "jimjones@gmail.com",
    "image": "https://picsum.photos/seed/536/600",
    "experience": "Mid-level",
    "yrs": "1",
    "Education": [
      {
      "level": "Bachelors",
      "courseTitle": "Bsc. Computer Science",
      "startDate": "01/01/2021",
      "endDate": "01/01/2021"
    },
      {
        "level": "Masters",
        "courseTitle": "Msc. Computer Science",
        "startDate": "01/01/2021",
        "endDate": "01/01/2021"
      }
    ],
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "1",
    "name": "Jane Doe",
    "jobInterest": "IOS Developer",
    "email": "janedoe@gmail.com",
    "image": "https://picsum.photos/seed/536/600",
    "experience": "Expert",
    "yrs": "1",
    "Education": [{
      "level": "Bachelors",
      "courseTitle": "Bsc. Computer Science",
      "startDate": "01/01/2021",
      "endDate": "01/01/2021"
    },
      {
        "level": "Masters",
        "courseTitle": "Msc. Computer Science",
        "startDate": "01/01/2021",
        "endDate": "01/01/2021"
      }
    ],
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "2",
    "jobInterest":"Android Developer",
    "name": "Ann Smith",
    "email": "annsmith@gmail.com",
    "image": "https://picsum.photos/seed/536/600",
    "experience": "Entry Level",
    "yrs": "2",
    "Education": [{
      "level": "Bachelors",
      "courseTitle": "Bsc. Computer Science",
      "startDate": "01/01/2021",
      "endDate": "01/01/2021"
    },
      {
        "level": "Masters",
        "courseTitle": "Msc. Computer Science",
        "startDate": "01/01/2021",
        "endDate": "01/01/2021"
      }
    ],
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "3",
    "jobInterest":"Web Developer",
    "name": "Jim Jones",
    "email": "jimjones@gmail.com",
    "image": "https://picsum.photos/seed/536/600",
    "experience": "Mid-level",
    "yrs": "3",
    "Education": [
      {
        "level": "Bachelors",
        "courseTitle": "Bsc. Computer Science",
        "startDate": "01/01/2021",
        "endDate": "01/01/2021"
      },
      {
        "level": "Masters",
        "courseTitle": "Msc. Computer Science",
        "startDate": "01/01/2021",
        "endDate": "01/01/2021"
      }
    ],
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
];

static List jobs = [
  {
    "id": "1",
    "title": "Web developer",
    "location": "oxford, England, United Kingdom ",
    "experienceLevel": "Entry-level",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam suscipit tempor dui, nec volutpat neque iaculis in. Suspendisse vitae augue in libero suscipit iaculis auctor eget massa. Maecenas consectetur mollis malesuada. Quisque luctus, lectus at lacinia ornare, erat risus sollicitudin dui, a ultrices purus metus non metus. Suspendisse finibus porta tortor, in cursus orci euismod eget. Vestibulum at rhoncus ipsum, ut gravida risus. Phasellus dui enim, rutrum sit amet vehicula eget, finibus ut libero. Duis sodales ultrices lorem quis pulvinar. Nullam ut lorem luctus, rutrum tellus mattis, rhoncus purus. Aliquam interdum erat augue, quis posuere purus dictum et. Nam quam orci, tristique sit amet congue a, gravida et risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    "company": "Abc Corp",
    "webLink": "google.com",
    "yrs": "3",
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "1",
    "title": "IOS developer",
    "location": "oxford, England, United Kingdom ",
    "experienceLevel": "Entry-level",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam suscipit tempor dui, nec volutpat neque iaculis in. Suspendisse vitae augue in libero suscipit iaculis auctor eget massa. Maecenas consectetur mollis malesuada. Quisque luctus, lectus at lacinia ornare, erat risus sollicitudin dui, a ultrices purus metus non metus. Suspendisse finibus porta tortor, in cursus orci euismod eget. Vestibulum at rhoncus ipsum, ut gravida risus. Phasellus dui enim, rutrum sit amet vehicula eget, finibus ut libero. Duis sodales ultrices lorem quis pulvinar. Nullam ut lorem luctus, rutrum tellus mattis, rhoncus purus. Aliquam interdum erat augue, quis posuere purus dictum et. Nam quam orci, tristique sit amet congue a, gravida et risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    "company": "Abc Corp",
    "webLink": "google.com",
    "yrs": "3",
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "1",
    "title": "Software Engineering intern",
    "location": "oxford, England, United Kingdom ",
    "experienceLevel": "Entry-level",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam suscipit tempor dui, nec volutpat neque iaculis in. Suspendisse vitae augue in libero suscipit iaculis auctor eget massa. Maecenas consectetur mollis malesuada. Quisque luctus, lectus at lacinia ornare, erat risus sollicitudin dui, a ultrices purus metus non metus. Suspendisse finibus porta tortor, in cursus orci euismod eget. Vestibulum at rhoncus ipsum, ut gravida risus. Phasellus dui enim, rutrum sit amet vehicula eget, finibus ut libero. Duis sodales ultrices lorem quis pulvinar. Nullam ut lorem luctus, rutrum tellus mattis, rhoncus purus. Aliquam interdum erat augue, quis posuere purus dictum et. Nam quam orci, tristique sit amet congue a, gravida et risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    "company": "Abc Corp",
    "webLink": "google.com",
    "yrs": "3",
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "1",
    "title": "Backend developer",
    "location": "oxford, England, United Kingdom ",
    "experienceLevel": "Entry-level",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam suscipit tempor dui, nec volutpat neque iaculis in. Suspendisse vitae augue in libero suscipit iaculis auctor eget massa. Maecenas consectetur mollis malesuada. Quisque luctus, lectus at lacinia ornare, erat risus sollicitudin dui, a ultrices purus metus non metus. Suspendisse finibus porta tortor, in cursus orci euismod eget. Vestibulum at rhoncus ipsum, ut gravida risus. Phasellus dui enim, rutrum sit amet vehicula eget, finibus ut libero. Duis sodales ultrices lorem quis pulvinar. Nullam ut lorem luctus, rutrum tellus mattis, rhoncus purus. Aliquam interdum erat augue, quis posuere purus dictum et. Nam quam orci, tristique sit amet congue a, gravida et risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    "company": "Abc Corp",
    "webLink": "google.com",
    "yrs": "3",
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
  {
    "id": "1",
    "title": "Web developer",
    "location": "oxford, England, United Kingdom ",
    "experienceLevel": "Entry-level",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam suscipit tempor dui, nec volutpat neque iaculis in. Suspendisse vitae augue in libero suscipit iaculis auctor eget massa. Maecenas consectetur mollis malesuada. Quisque luctus, lectus at lacinia ornare, erat risus sollicitudin dui, a ultrices purus metus non metus. Suspendisse finibus porta tortor, in cursus orci euismod eget. Vestibulum at rhoncus ipsum, ut gravida risus. Phasellus dui enim, rutrum sit amet vehicula eget, finibus ut libero. Duis sodales ultrices lorem quis pulvinar. Nullam ut lorem luctus, rutrum tellus mattis, rhoncus purus. Aliquam interdum erat augue, quis posuere purus dictum et. Nam quam orci, tristique sit amet congue a, gravida et risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
    "company": "Abc Corp",
    "webLink": "google.com",
    "yrs": "3",
    "skills": ["java", "C#", "C++", "MATLAB",]
  },
];

}
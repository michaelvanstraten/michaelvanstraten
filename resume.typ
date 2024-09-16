#import "@preview/modern-cv:0.6.0": *

#show: resume.with(
  author: (
    firstname: "Michael", lastname: "van Straten", email: "michael@vanstraten.de", github: "michaelvanstraten", birth: "June 9, 2004", positions: ("Systems Architect", "Full-stack Software Engineer",),
  ), date: datetime.today().display(), colored-headers: false, show-footer: true,
)

= Experience

#resume-entry(
  title: "Storage Infrastructure Student Worker", location: "Berlin, Germany", date: "October 2023 - Present", description: "Mozilla Corp.", title-link: "https://phabricator.services.mozilla.com/p/mvanstraten/",
)

#resume-item[
  - Leading a project to implement a new tracing system in the Gecko Browser engine
  - Worked extensively on mission-critical, low-level C++17 components
  - Gained expertise in designing and implementing highly performant, multi-process
    systems
]

#resume-entry(
  title: "Independent Software Engineer", location: "Remote", date: "July 2022 - October 2023", description: "Specialized in Machine Learning and IoT/Mobile Development",
)

#resume-item[
  - Advised clients on implementing fundamental machine learning algorithms
  - Developed IoT applications using ESP-IDF in C
  - Built mobile applications in Flutter with Bluetooth Low Energy integration
  - Developed full-stack web applications
]

#resume-entry(
  title: "Web Designer/Developer", location: "Falkensee, Germany", date: "October 2018 - July 2021", description: "msFaktura", title-link: "https://www.msfaktura.de/",
)

#resume-item[
  - Enhanced internally developed software solutions
  - Designed and developed numerous WordPress applications using PHP
]

#resume-entry(
  title: "Full-stack Web Developer", location: "Remote", date: "2016 - Present", description: "The Family of Music",
)

#resume-item[
  - Site Reliability Engineer (SRE) for various services, including WordPress and
    custom Go applications
  - Designed and integrated a large e-commerce platform with over 6,000 products
  - Developed custom Go applications for email marketing strategies
]

= Projects

#resume-entry(
  title: "SwiftyRedis", location: [#github-link("michaelvanstraten/swifty-redis")], date: "Summer 2022",
)

#resume-item[
  - Developed a robust, versatile asynchronous Redis library for Swift, officially
    listed as a Redis Client
]

#resume-entry(
  title: "Actix Web JWT Authentication Library", location: [#github-link("michaelvanstraten/actix-jwt-auth-middleware")], date: "April 2022",
)

#resume-item[
  - Created a popular JSON Web Token (JWT) authentication library for the Actix Web
    framework
]

#resume-entry(
  title: "Simple Neural Network Framework (No Dependencies)", location: [#github-link("michaelvanstraten/simple-net")], date: "Winter 2019",
)

#resume-item[
  - Developed a custom neural network framework to understand the underlying
    mathematics and implementation
  - Supports multiple feedforward layers with a custom gradient descent algorithm
]

= Skills

#resume-skill-item(
  "Languages", (
    strong("Rust"), strong("Python"), strong("Swift"), "Nix", "C++", "Go", "PHP", "TypeScript", "JavaScript",
  ),
)

#resume-skill-item(
  "Technologies", (
    strong("Git"), strong("Redis"), strong("NixOS"), "Machine Learning", "Kubernetes", "WebAssembly",
  ),
)

= Education

#resume-entry(
  title: "Humboldt-Universität zu Berlin", location: "Berlin, Germany", date: "October 2023 - Present", description: "Bachelor of Science in Mathematics",
)

#resume-entry(
  title: "Gesamtschule Immanuel Kant", location: "Falkensee, Germany", date: "September 2020 - April 2023", description: "Allgemeine Hochschulreife (High School Diploma)",
)


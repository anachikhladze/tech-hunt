//
//  Job.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.01.24.
//

import UIKit

struct Job: Codable, Identifiable {
    var id: String
    var title: String
    var company: String
    var description: String
    var type: String
    var category: String
    
    static let techJobVacancies: [Job] = [
        Job(id: "1",
            title: "Senior Software Engineer - Backend",
            company: "InnovateTech Solutions",
            description: """
            Join our high-performance team as a Senior Software Engineer specializing in backend development. As a key member of our engineering department, you will be responsible for designing and implementing robust and scalable server-side solutions. The ideal candidate should have extensive experience with technologies such as Java, Spring, and relational databases. If you thrive in a fast-paced environment and love tackling complex challenges, we want you on board!
            """,
            type: "Full-Time",
            category: "Development"),

        Job(id: "2",
            title: "Lead UX/UI Designer",
            company: "CreativeUX Studio",
            description: """
            We are on the lookout for a visionary Lead UX/UI Designer to lead our design team. In this role, you will drive the creation of innovative and user-centric interfaces across web and mobile platforms. The successful candidate will have a proven track record of designing intuitive and visually stunning experiences. If you are passionate about pushing the boundaries of design, we invite you to bring your creativity to our dynamic team.
            """,
            type: "Full-Time",
            category: "Design"),

        Job(id: "3",
            title: "Machine Learning Engineer",
            company: "DataInsights Innovations",
            description: """
            Exciting opportunity for a Machine Learning Engineer to join our data science team. As part of this role, you will work on developing and deploying machine learning models to extract valuable insights from large datasets. The ideal candidate should have a strong foundation in machine learning algorithms, proficiency in programming languages like Python, and experience with frameworks such as TensorFlow or PyTorch. If you are enthusiastic about harnessing the power of data, we want you on our team!
            """,
            type: "Full-Time",
            category: "Data Science"),

        Job(id: "4",
            title: "Frontend Developer - React.js",
            company: "WebCrafters Co.",
            description: """
            Are you a passionate Frontend Developer with expertise in React.js? Join our dynamic team and contribute to the development of modern and responsive web applications. As a key player in our frontend development team, you will collaborate with designers and backend developers to deliver seamless user experiences. If you have a strong portfolio showcasing your React.js skills and a love for creating visually appealing interfaces, we want to hear from you!
            """,
            type: "Full-Time",
            category: "Development"),

        Job(id: "5",
            title: "DevOps Engineer",
            company: "CloudOps Innovations",
            description: """
            We are seeking a talented DevOps Engineer to join our operations team. In this role, you will be responsible for designing and implementing automated deployment pipelines, ensuring the scalability and reliability of our infrastructure. The ideal candidate should have expertise in containerization technologies (e.g., Docker, Kubernetes), CI/CD tools, and cloud platforms. If you are passionate about streamlining development workflows and optimizing system performance, apply now!
            """,
            type: "Full-Time",
            category: "Infrastructure"),

        Job(id: "6",
            title: "Senior Mobile App Developer - Flutter",
            company: "MobileTech Solutions",
            description: """
            Join our mobile development team as a Senior Mobile App Developer specializing in Flutter. In this role, you will lead the development of cross-platform mobile applications, ensuring a consistent and high-quality user experience. The ideal candidate should have a strong background in mobile app development, expertise in Flutter, and a passion for staying updated on the latest mobile technologies. If you are ready to shape the future of mobile apps, we want to hear from you!
            """,
            type: "Full-Time",
            category: "Development"),

        Job(id: "7",
            title: "Data Engineer",
            company: "InsightfulData Co.",
            description: """
            Exciting opportunity for a Data Engineer to join our data analytics team. As a Data Engineer, you will play a crucial role in designing and implementing data pipelines, ensuring the efficient flow of data from source to destination. The ideal candidate should have experience with big data technologies, ETL processes, and proficiency in programming languages such as Python or Scala. If you are passionate about building robust data infrastructure, apply now!
            """,
            type: "Full-Time",
            category: "Data Engineering"),

        Job(id: "8",
            title: "Full Stack Developer - Node.js & React",
            company: "CodeCrafters Ltd.",
            description: """
            We are looking for a Full Stack Developer with expertise in both Node.js and React.js to join our development team. As a Full Stack Developer, you will be involved in designing and implementing features across the entire software stack. The ideal candidate should have a strong background in both frontend and backend technologies, along with a passion for building scalable and maintainable software solutions. If you are ready to take on a versatile role, we want you on our team!
            """,
            type: "Full-Time",
            category: "Development"),

        Job(id: "9",
            title: "Senior UI/UX Researcher",
            company: "UserInsights Research",
            description: """
            We are seeking an experienced UI/UX Researcher to lead our user research initiatives. In this role, you will conduct user studies, gather insights, and collaborate with the design team to enhance user experiences. The ideal candidate should have a strong background in qualitative and quantitative research methods, along with excellent communication skills. If you are passionate about understanding user behavior and shaping product design, we invite you to join our innovative team!
            """,
            type: "Full-Time",
            category: "Design"),

        Job(id: "10",
            title: "Cloud Solutions Architect",
            company: "CloudVision Architects",
            description: """
            Exciting opportunity for a Cloud Solutions Architect to join our architecture team. As a Cloud Solutions Architect, you will be responsible for designing and implementing cloud-based solutions, ensuring scalability, security, and reliability. The ideal candidate should have expertise in cloud platforms (e.g., AWS, Azure, GCP), a deep understanding of cloud architecture best practices, and hands-on experience with infrastructure as code (IaC). If you are ready to shape the future of cloud computing, we want you on board!
            """,
            type: "Full-Time",
            category: "Architecture"),

        Job(id: "11",
            title: "Senior Android Developer",
            company: "MobileInnovate Tech",
            description: """
            Join our mobile development team as a Senior Android Developer and contribute to the creation of cutting-edge Android applications. We are seeking an experienced developer with a deep understanding of Kotlin and Android development, along with a passion for creating seamless and performant mobile experiences. If you thrive in a collaborative environment and have a strong portfolio showcasing your Android development skills, we want you on our team!
            """,
            type: "Full-Time",
            category: "Development"),

        Job(id: "12",
            title: "AI/ML Product Manager",
            company: "InnoVision AI",
            description: """
            Are you passionate about AI and machine learning? We are looking for an AI/ML Product Manager to drive the development of innovative AI-powered products. In this role, you will work closely with cross-functional teams to define product strategies, prioritize features, and ensure successful product launches. The ideal candidate should have a strong technical background, excellent project management skills, and a deep understanding of AI/ML technologies. If you are ready to shape the future of intelligent products, apply now!
            """,
            type: "Full-Time",
            category: "Product Management"),

        Job(id: "13",
            title: "Blockchain Developer",
            company: "CryptoTech Innovations",
            description: """
            Exciting opportunity for a Blockchain Developer to join our blockchain development team. As a key player in our team, you will be responsible for designing and implementing blockchain solutions, ensuring security and scalability. The ideal candidate should have hands-on experience with blockchain technologies (e.g., Ethereum, Hyperledger), smart contract development, and a passion for decentralized technologies. If you are ready to revolutionize the blockchain space, we want you on board!
            """,
            type: "Full-Time",
            category: "Development"),

        Job(id: "14",
            title: "Senior Data Scientist - Computer Vision",
            company: "Visionary Insights",
            description: """
            Join our data science team as a Senior Data Scientist specializing in computer vision. In this role, you will work on projects that leverage computer vision algorithms to extract meaningful insights from visual data. The ideal candidate should have a strong background in computer vision, machine learning, and proficiency in programming languages such as Python. If you are passionate about the intersection of data science and computer vision, we want to hear from you!
            """,
            type: "Full-Time",
            category: "Data Science"),

        Job(id: "15",
            title: "UI/UX Design Lead",
            company: "PixelCraft Studios",
            description: """
            We are looking for a talented UI/UX Design Lead to lead our design team and elevate our product experiences. As the Design Lead, you will be responsible for setting the design direction, mentoring designers, and collaborating with cross-functional teams to deliver exceptional user interfaces. The ideal candidate should have a strong portfolio showcasing design leadership and a deep understanding of design systems. If you are ready to make a significant impact on product design, we invite you to bring your creativity to our passionate team!
            """,
            type: "Full-Time",
            category: "Design"),

        Job(id: "16",
            title: "Senior Frontend Developer - Angular",
            company: "AngularCraft Innovations",
            description: """
            Are you an expert in Angular? We are seeking a Senior Frontend Developer to join our team and contribute to the development of complex and feature-rich web applications. As a key member of our frontend development team, you will work on implementing user interfaces, collaborating with designers, and ensuring the overall quality of the frontend codebase. If you have a passion for building responsive and scalable web applications with Angular, we want you on board!
            """,
            type: "Full-Time",
            category: "Development"),

        Job(id: "17",
            title: "Senior Cloud Security Engineer",
            company: "SecureCloud Innovations",
            description: """
            We are looking for a Senior Cloud Security Engineer to join our security team. In this role, you will be responsible for designing and implementing security measures to protect our cloud infrastructure. The ideal candidate should have expertise in cloud security, experience with security frameworks, and a strong understanding of cybersecurity best practices. If you are passionate about securing cloud environments, apply now!
            """,
            type: "Full-Time",
            category: "Security"),

        Job(id: "18",
            title: "AR/VR Software Engineer",
            company: "ImmersiveTech Solutions",
            description: """
            Exciting opportunity for an AR/VR Software Engineer to join our team and work on cutting-edge augmented and virtual reality projects. In this role, you will be responsible for developing immersive and interactive experiences using AR and VR technologies. The ideal candidate should have hands-on experience with AR/VR development frameworks and a passion for pushing the boundaries of immersive technology. If you are ready to shape the future of AR and VR, we want you on our team!
            """,
            type: "Full-Time",
            category: "Development"),

        Job(id: "19",
            title: "Lead Data Engineer",
            company: "DataMinds Innovations",
            description: """
            We are seeking a visionary Lead Data Engineer to lead our data engineering team. In this role, you will be responsible for designing and implementing scalable data architectures, leading data integration projects, and ensuring the reliability of our data infrastructure. The ideal candidate should have a strong background in data engineering, proficiency in big data technologies, and experience with cloud-based data solutions. If you are ready to lead and innovate in the world of data engineering, apply now!
            """,
            type: "Full-Time",
            category: "Data Engineering"),

        Job(id: "20",
            title: "Senior Backend Developer - Python",
            company: "PythonCraft Innovations",
            description: """
            Join our backend development team as a Senior Backend Developer specializing in Python. In this role, you will be responsible for designing and implementing scalable server-side solutions using Python and related technologies. The ideal candidate should have expertise in Python development, experience with frameworks such as Django or Flask, and a passion for building robust and efficient backend systems. If you are ready to make a significant impact in backend development, we want you on our team!
            """,
            type: "Full-Time",
            category: "Development")
    ]
}

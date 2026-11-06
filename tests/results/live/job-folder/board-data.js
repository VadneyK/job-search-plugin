window.BOARD = {
  updated: "2026-11-06 10:14 AM",
  items: [
    {
      id: "northwind-operations-coordinator-submit",
      type: "submit",
      urgent: false,
      company: "Northwind Health Partners",
      role: "Operations Coordinator",
      do: "Open the filled application, answer How did you hear, the Gender, Veteran and Disability questions and the robot check yourself, review it, then click Submit application.",
      link: "http://127.0.0.1:8765/northwind/",
      where: "Chrome tab: Operations Coordinator at Northwind Health Partners",
      file: "applications/northwind-operations-coordinator/applied.md",
      then: "I submitted the Northwind application"
    },
    {
      id: "gitlab-tech-operations-specialist-decide",
      type: "decide",
      urgent: false,
      company: "GitLab",
      role: "Tech Operations Specialist",
      do: "Decide whether to go for this remote AI-tooling operations role (pay fits, work is a stretch) or skip it.",
      link: "https://job-boards.greenhouse.io/gitlab/jobs/8638246002",
      file: "applications/gitlab-tech-operations-specialist/fit-check.md",
      then: "Go for it on GitLab Tech Operations Specialist"
    }
  ]
};

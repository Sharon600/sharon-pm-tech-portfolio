# Weekly Task Summary Automation

## Resume-style summary
Project Operations Automation | Power Automate Workflow

Designed and deployed a weekly reporting workflow that pulls current-week project tasks from an Excel tracker, compiles them into a polished Outlook email, and sends the summary with supporting attachments. This automation replaces a repetitive manual reporting routine and is estimated to save approximately 20–30 minutes of administrative work each week while improving consistency and timeliness of communication.

## Business problem solved
The team previously had to manually gather weekly task updates, filter the correct records, format the summary, attach supporting documents, and send the report. That process was repetitive, easy to overlook, and dependent on remembering to complete it every week. This flow standardizes the weekly update and ensures the right information reaches stakeholders reliably.

## Flow structure
### Trigger
- Recurrence — runs weekly on Monday at 04:30 (India Standard Time)

### Steps
1. Determine the current week number from the date.
2. Read the weekly task tracker from Excel Online Business.
3. Filter the rows to include only entries for the current week.
4. Build the email body by looping through each matching task and adding task details, instructions, and links.
5. Calculate the Monday–Friday reporting window for the subject line.
6. Retrieve supporting documents from SharePoint and attach them to the email.
7. Send the completed report through Outlook.

### Action
- Deliver a formatted weekly task summary email to the intended recipient(s).

## How the flow works
The flow starts on a weekly schedule, uses the current date to identify the reporting week, and then pulls task data from the Excel tracker. Each task is formatted into the email body with links and instructions, and the workflow then attaches the relevant compliance and guidance files before sending a single consolidated email.

## Impact and time saved
- Estimated time saved: about 20–30 minutes per week
- What this replaces: manual collection of task items, formatting the report, attaching files, and sending the update email

## Notes
- The workflow is configured as a weekly Monday cadence.
- It is designed to make reporting more reliable, repeatable, and easier to maintain.

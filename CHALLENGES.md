# Challenges Roadmap: Volunteer Management System

This document outlines a list of potential tasks (challenges) for the Volunteer Management System. The challenges are categorized by difficulty and include multiple solution paths.

## Basic Challenges

### 1. Weekly Dashboard
**Goal:** Provide a high-level view of volunteer engagement and impact.
*   **Scenario:** The Program Director needs a weekly summary of total volunteer hours, active volunteers per city, and upcoming shifts.
*   **Solution Paths:**
    *   **Native (Low Code):** Create a standard Salesforce Dashboard with Reports (e.g., "Hours by City", "New Volunteers this Week"). Subscribe the director to a weekly email refresh.
    *   **External (API/BI):** Connect Salesforce to Tableau or PowerBI or use the REST API to build a dashboard App

### 2. Volunteer Sign Up & Documentation
**Goal:** Streamline the intake process and ensure legal compliance.
*   **Scenario:** New volunteers must sign the "Volunteer Handbook" and "Safety Waiver" before joining.
*   **Solution Paths:**
    *   **Native (Flow):** Build a Screen Flow exposed on a public Experience Cloud site. Use a checkbox for "I Agree" or a simple signature component (LWC) to capture a signature image.
    *   **External (Integration):** Use a form tool (FormAssembly, Typeform, or create an external App) and integrate with DocuSign/PandaDoc or similar.

### 3. Volunteer Shift Creation & Sign Up
**Goal:** Manage volunteer schedules and allow self-signup.
*   **Scenario:** Coordinators need to post shifts for upcoming events, and volunteers need to sign up for them.
*   **Solution Paths:**
    *   **Native (Custom Objects):** Create a `Shift__c` object. Build a Flow for volunteers to view available shifts and create a `Shift_Assignment__c` record.
    *   **Manual (Low Tech):** Coordinators send email blasts. Volunteers reply. Admin manually enters data. (The "Challenge" here is to automate this away).

Condsider what kind of connections would make sense for these shifts - ideally volunteer hours would always be part of shift? Shifts are local. And possible repeating (weekly?) 

## Advanced Challenges

### 4. Member Journey Flow
**Goal:** Automate the lifecycle of a volunteer.
*   **Scenario:** Move a volunteer from "Applied" -> "Induction Pending" -> "Active" -> "Alumni" based on criteria (e.g., completed training, logged first hour).
*   **Solution Paths:**
    *   **Native (Flow):** Record-Triggered Flows that update status based on `Volunteer_Hours__c` creation or `Training` completion.
    *   **External (Marketing):** Marketing Cloud Journey Builder. Send emails at each stage ("Welcome!", "Don't forget your training", "Thanks for your first shift!").

### 5. Data Imports from Non-Integrated Systems
**Goal:** Ingest data from partner organizations.
*   **Scenario:** A partner org sends a monthly Excel sheet of volunteer activities.
*   **Solution Paths:**
    *   **Native (Wizard):** Use the Data Import Wizard manually each month.
    *   **External (ETL):** Set up a "Drop Folder" (Dropbox/S3). Use a tool like MuleSoft or Jitterbit to watch the folder, parse the Excel, and upsert to Salesforce.

## Bonus / AI Challenges

### 6. Volunteer Self-Reporting Hours
**Goal:** Capture accurate volunteer hours without admin data entry.
*   **Scenario:** Volunteers often work remotely or ad-hoc and need to log their hours.
*   **Solution Paths:**
    *   **Native (Experience Cloud):** Create a "My Hours" portal page where logged-in users can enter Date, Hours, and Description.
    *   **External (Mobile/API):** Build a simple mobile-friendly web app (React/Node) that hits a Salesforce Apex REST endpoint to insert `Volunteer_Hours__c` records.
    *   **AI (Email Bot):** Set up an Email Service. Volunteers email `hours@nonprofit.org` saying "I worked 3 hours today on the garden." An LLM parses the email intent and entities (Duration: 3h, Date: Today, Task: Garden) and inserts the record.

### 7. Data Clean Up
**Goal:** Improve data quality.
*   **Scenario:** The system has duplicate volunteers (e.g., "Rob Smith" and "Robert Smith" with the same email).
*   **Solution Paths:**
    *   **Native (Rules):** Configure Standard Duplicate Rules and Matching Rules.
    *   **AI (Fuzzy Logic):** Write a script using an LLM to compare records and identify likely duplicates that standard rules miss (e.g., different emails but same phone and similar name).

### 8. AI Document Processing
**Goal:** Automate document verification.
*   **Scenario:** Volunteers upload a photo of a physically signed document.
*   **Solution Paths:**
    *   **AI (Processing):** Use an AI service (e.g., Einstein Vision or external OCR) to verify the document is signed and extract the volunteer's name to auto-create the record.

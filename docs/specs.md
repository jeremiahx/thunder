# Code Challenge

## Rails 7

 

## Introduction

The Code Challenge is meant to simulate a complete real-world task that you would
commonly encounter when working in the codebase.

At this company, we have a culture of completeness for the code we ship. This means that the code
should be well tested, documented, and should match the look and feel of the provided Figma
designs.

Please take up to 4 hours to complete the challenge. 

## Setup

Bootstrap a Rails 7 application with the following configuration:
- CSS: Tailwind
- Testing: Rspec

If using the Rails defaults, this will create an application with Hotwire (Turbo, Stimulus)
configured.

## Instructions

As an engineer at Company, you are tasked with building the User Management portion of the
application. You are given the following story cards and a Figma file for reference:

### Card 101:

Add the ability to create new Users in the Tropic Platform

 - A user can contain: first name, last name, email 
 - Email is required
 - Email must be valid
 - Email must be unique
 - Email cannot have the gmail, hotmail, or yahoo domain

### Card 102:

Add the index view of users

Provide a list of all users in the system with the following columns: Name, Email, Date Created.
If the user has a first name or last name, display that as the user's name. If the user does not
have a first or last name, display the capitalized first two letters of their email address.

### Card 103:

Send an invitation email to User upon creation

Add a checkbox to the New User form with “Send Invitation” label. If the checkbox is checked,
send the user an invitation email.

Note: If the email fails to send the user record should not be persisted in the database
Technical Notes: Tropic has not yet decided on an email delivery service. For now, let's stub out
the email delivery by creating a generic class we can call that will do the work of sending the
email. The class can take the following inputs: `to_address`, `subject` `body`, and it will return a
success or failure. The actual sending of the email can be left unimplemented for now.

Bonus
If time allows, consider moving the user creation flow into a modal
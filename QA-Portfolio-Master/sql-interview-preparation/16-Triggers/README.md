# 16-Triggers
Triggers

Triggers automatically execute when specific database events occur.

Types
AFTER Trigger
INSTEAD OF Trigger
BEFORE Trigger (supported in some databases)

Example

CREATE TRIGGER trg_InsertEmployee

ON Employee

AFTER INSERT

AS

BEGIN

PRINT 'Employee Added';

END;

Uses

Audit logging
Data validation
Automatic updates
Business rule enforcement
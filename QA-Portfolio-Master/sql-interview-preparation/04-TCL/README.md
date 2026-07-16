# 04-TCL
TCL (Transaction Control Language)
What is TCL?

TCL manages database transactions to ensure data consistency.

Transaction Properties (ACID)
Atomicity
Consistency
Isolation
Durability
Commands
BEGIN TRANSACTION

Starts a transaction.

BEGIN TRANSACTION;
COMMIT

Saves changes permanently.

COMMIT;
ROLLBACK

Undoes changes.

ROLLBACK;
SAVEPOINT

Creates a checkpoint.

SAVEPOINT Save1;
Example
BEGIN TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 500
WHERE ID = 1;

UPDATE Accounts
SET Balance = Balance + 500
WHERE ID = 2;

COMMIT;
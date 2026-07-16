# 14-Indexes
Indexes

Indexes improve query performance by reducing the time needed to locate rows.

Types
Clustered Index
Non-Clustered Index
Unique Index
Composite Index

Create

CREATE INDEX idx_name
ON Employee(Name);

Advantages

Faster SELECT queries
Improved search performance

Disadvantages

Additional storage
Slower INSERT, UPDATE, and DELETE operations because indexes must also be maintained
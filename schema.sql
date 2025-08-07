IF NOT EXISTS (
    SELECT 1 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[USER]') 
      AND type = N'U'
)
BEGIN
    CREATE TABLE [USER] (
        user_id      INT            IDENTITY(1,1) PRIMARY KEY,
        username     NVARCHAR(50)   NOT NULL UNIQUE,                        
        insert_date  DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME(),      
        state        TINYINT        NOT NULL DEFAULT 1 
                      CHECK (state BETWEEN 1 AND 3),
        comment      NVARCHAR(500)  NULL
    );
END
GO

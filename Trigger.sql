CREATE TRIGGER CheckCommunityNameLength
ON communities
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE LEN(name) < 5
    )
    BEGIN
        RAISERROR ('Длина названия сообщества должна быть не менее 5 символов.', 16, 1);
        ROLLBACK;
    END
END;

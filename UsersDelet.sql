CREATE PROCEDURE UsersDelete
    @userId INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY
        DELETE FROM messages WHERE from_user_id = @userId OR to_user_id = @userId;
        DELETE FROM media WHERE user_id = @userId;
        DELETE FROM likes WHERE user_id = @userId;
        DELETE FROM friend_requests WHERE initiator_user_id = @userId OR target_user_id = @userId;
        DELETE FROM users WHERE id = @userId;

        COMMIT;
        SELECT @userId AS DeletedUserId;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END;

EXEC UsersDelete @userId = 12;



CREATE PROCEDURE DeleteUsers
    @userId INT
AS
BEGIN
    DELETE FROM messages WHERE from_user_id = @userId OR to_user_id = @userId;
    DELETE FROM media WHERE user_id = @userId;
    DELETE FROM likes WHERE user_id = @userId;
    DELETE FROM friend_requests WHERE initiator_user_id = @userId OR target_user_id = @userId;
    DELETE FROM users WHERE id = @userId;
    SELECT @userId AS DeletedUserId;
END;

EXEC dbo.DeleteUsers @userId = 1;






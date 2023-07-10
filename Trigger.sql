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
        RAISERROR ('����� �������� ���������� ������ ���� �� ����� 5 ��������.', 16, 1);
        ROLLBACK;
    END
END;

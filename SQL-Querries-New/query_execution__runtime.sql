-- QUERY EXECUTION RUNTIME
DECLARE @starttime datetime
DECLARE @endtime datetime
SET @starttime = GETDATE()   
  -- execute my query here
  --
  --
SET @endtime = GETDATE()
--
SELECT(DATEDIFF(millisecond,@starttime,@endtime));
SELECT(DATEDIFF(second,@starttime,@endtime));
SELECT(DATEDIFF(minute,@starttime,@endtime));
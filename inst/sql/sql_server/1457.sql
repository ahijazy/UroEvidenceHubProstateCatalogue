CREATE TABLE #Codesets (
  codeset_id int NOT NULL,
  concept_id bigint NOT NULL
)
;

INSERT INTO #Codesets (codeset_id, concept_id)
SELECT 14 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (2003970,2003983,2110032,2110033,2110034,2110037,2110038,2110039,2110044,2780477,2780478,2780479,2780480,2800799,2806171,2826265,2826266,2831622,2846301,2880669,2899589,2899590,3168445,3169517,4021570,4071665,4071666,4071791,4073008,4073695,4078386,4096783,4102465,4187904,4194172,4211496,4212360,4219099,4235738,4243467,4263480,4276520,4338373,35916452,35916914,35917083,44808725,44809585,46270921,4119924,4216658,4021570,4341384,4341893,2110036,2110035,4147673,4078386)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (2003970,2003983,2110032,2110033,2110034,2110037,2110038,2110039,2110044,2780477,2780478,2780479,2780480,2800799,2806171,2826265,2826266,2831622,2846301,2880669,2899589,2899590,3168445,3169517,4021570,4071665,4071666,4071791,4073008,4073695,4078386,4096783,4102465,4187904,4194172,4211496,4212360,4219099,4235738,4243467,4263480,4276520,4338373,35916452,35916914,35917083,44808725,44809585,46270921,4119924,4216658,4021570,4341384,4341893,2110036,2110035,4147673,4078386)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (709928,759648,1524039,1531629,1781260,2003966,2004009,2101059,2108724,2108725,2110046,2777697,2777698,2777699,2777700,2777701,2777702,2777703,2777704,2777705,2777706,2780458,2780459,2780460,2780461,2780462,2789830,2789845,2789846,2789847,2789848,2789849,2789850,2789851,2789852,2789853,2789854,2789855,2789856,2790073,2790076,2800723,2808714,2813574,2813575,2820952,2820953,2834168,2834169,2841378,2841379,2841383,2851543,2853800,2862315,2880755,2893637,3187777,3655889,4028898,4041984,4054558,4061656,4071668,4073125,4073126,4073700,4141157,4141808,4142107,4144009,4147880,4147881,4149620,4176312,4193061,4234536,4235364,4267449,4287859,4306299,4312089,4318947,4336248,4338661,4343105,35916939,36676820,36685525,37111533,37204192,40487861,40489892,40490346,42537594,42639412,42733763,42733764,42872523,43533205,44512377,44512406,44783041,44783043,44791407,44806386,44806650,44812239,46270669,4239543,2110031,35916757,3169517,44808725,4071665,2003970,2003983,4211496,4235738,2110036,2110035,35916452,4194172,4212360,4147673,4078386,4263480)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (709928,759648,1524039,1531629,1781260,2003966,2004009,2101059,2108724,2108725,2110046,2777697,2777698,2777699,2777700,2777701,2777702,2777703,2777704,2777705,2777706,2780458,2780459,2780460,2780461,2780462,2789830,2789845,2789846,2789847,2789848,2789849,2789850,2789851,2789852,2789853,2789854,2789855,2789856,2790073,2790076,2800723,2808714,2813574,2813575,2820952,2820953,2834168,2834169,2841378,2841379,2841383,2851543,2853800,2862315,2880755,2893637,3187777,3655889,4028898,4041984,4054558,4061656,4071668,4073125,4073126,4073700,4141157,4141808,4142107,4144009,4147880,4147881,4149620,4176312,4193061,4234536,4235364,4267449,4287859,4306299,4312089,4318947,4336248,4338661,4343105,35916939,36676820,36685525,37111533,37204192,40487861,40489892,40490346,42537594,42639412,42733763,42733764,42872523,43533205,44512377,44512406,44783041,44783043,44791407,44806386,44806650,44812239,46270669,4239543,2110031,35916757)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C
;

SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, visit_occurrence_id
INTO #qualified_events
FROM 
(
  select pe.event_id, pe.person_id, pe.start_date, pe.end_date, pe.op_start_date, pe.op_end_date, row_number() over (partition by pe.person_id order by pe.start_date ASC) as ordinal, cast(pe.visit_occurrence_id as bigint) as visit_occurrence_id
  FROM (-- Begin Primary Events
select P.ordinal as event_id, P.person_id, P.start_date, P.end_date, op_start_date, op_end_date, cast(P.visit_occurrence_id as bigint) as visit_occurrence_id
FROM
(
  select E.person_id, E.start_date, E.end_date,
         row_number() OVER (PARTITION BY E.person_id ORDER BY E.sort_date ASC, E.event_id) ordinal,
         OP.observation_period_start_date as op_start_date, OP.observation_period_end_date as op_end_date, cast(E.visit_occurrence_id as bigint) as visit_occurrence_id
  FROM 
  (
  -- Begin Procedure Occurrence Criteria
select C.person_id, C.procedure_occurrence_id as event_id, C.procedure_date as start_date, DATEADD(d,1,C.procedure_date) as END_DATE,
       C.visit_occurrence_id, C.procedure_date as sort_date
from 
(
  select po.* 
  FROM @cdm_database_schema.PROCEDURE_OCCURRENCE po
JOIN #Codesets cs on (po.procedure_concept_id = cs.concept_id and cs.codeset_id = 14)
) C


-- End Procedure Occurrence Criteria

  ) E
	JOIN @cdm_database_schema.observation_period OP on E.person_id = OP.person_id and E.start_date >=  OP.observation_period_start_date and E.start_date <= op.observation_period_end_date
  WHERE DATEADD(day,0,OP.OBSERVATION_PERIOD_START_DATE) <= E.START_DATE AND DATEADD(day,0,E.START_DATE) <= OP.OBSERVATION_PERIOD_END_DATE
) P
WHERE P.ordinal = 1
-- End Primary Events
) pe
  
) QE

;

--- Inclusion Rule Inserts

create table #inclusion_events (inclusion_rule_id bigint,
	person_id bigint,
	event_id bigint
);

select event_id, person_id, start_date, end_date, op_start_date, op_end_date
into #included_events
FROM (
  SELECT event_id, person_id, start_date, end_date, op_start_date, op_end_date, row_number() over (partition by person_id order by start_date ASC) as ordinal
  from
  (
    select Q.event_id, Q.person_id, Q.start_date, Q.end_date, Q.op_start_date, Q.op_end_date, SUM(coalesce(POWER(cast(2 as bigint), I.inclusion_rule_id), 0)) as inclusion_rule_mask
    from #qualified_events Q
    LEFT JOIN #inclusion_events I on I.person_id = Q.person_id and I.event_id = Q.event_id
    GROUP BY Q.event_id, Q.person_id, Q.start_date, Q.end_date, Q.op_start_date, Q.op_end_date
  ) MG -- matching groups

) Results
WHERE Results.ordinal = 1
;



-- generate cohort periods into #final_cohort
select person_id, start_date, end_date
INTO #cohort_rows
from ( -- first_ends
	select F.person_id, F.start_date, F.end_date
	FROM (
	  select I.event_id, I.person_id, I.start_date, CE.end_date, row_number() over (partition by I.person_id, I.event_id order by CE.end_date) as ordinal
	  from #included_events I
	  join ( -- cohort_ends
-- cohort exit dates
-- By default, cohort exit at the event's op end date
select event_id, person_id, op_end_date as end_date from #included_events
    ) CE on I.event_id = CE.event_id and I.person_id = CE.person_id and CE.end_date >= I.start_date
	) F
	WHERE F.ordinal = 1
) FE;

select person_id, min(start_date) as start_date, end_date
into #final_cohort
from ( --cteEnds
	SELECT
		 c.person_id
		, c.start_date
		, MIN(ed.end_date) AS end_date
	FROM #cohort_rows c
	JOIN ( -- cteEndDates
    SELECT
      person_id
      , DATEADD(day,-1 * 0, event_date)  as end_date
    FROM
    (
      SELECT
        person_id
        , event_date
        , event_type
        , SUM(event_type) OVER (PARTITION BY person_id ORDER BY event_date, event_type ROWS UNBOUNDED PRECEDING) AS interval_status
      FROM
      (
        SELECT
          person_id
          , start_date AS event_date
          , -1 AS event_type
        FROM #cohort_rows

        UNION ALL


        SELECT
          person_id
          , DATEADD(day,0,end_date) as end_date
          , 1 AS event_type
        FROM #cohort_rows
      ) RAWDATA
    ) e
    WHERE interval_status = 0
  ) ed ON c.person_id = ed.person_id AND ed.end_date >= c.start_date
	GROUP BY c.person_id, c.start_date
) e
group by person_id, end_date
;

DELETE FROM @target_database_schema.@target_cohort_table where cohort_definition_id = @target_cohort_id;
INSERT INTO @target_database_schema.@target_cohort_table (cohort_definition_id, subject_id, cohort_start_date, cohort_end_date)
select @target_cohort_id as cohort_definition_id, person_id, start_date, end_date 
FROM #final_cohort CO
;






TRUNCATE TABLE #cohort_rows;
DROP TABLE #cohort_rows;

TRUNCATE TABLE #final_cohort;
DROP TABLE #final_cohort;

TRUNCATE TABLE #inclusion_events;
DROP TABLE #inclusion_events;

TRUNCATE TABLE #qualified_events;
DROP TABLE #qualified_events;

TRUNCATE TABLE #included_events;
DROP TABLE #included_events;

TRUNCATE TABLE #Codesets;
DROP TABLE #Codesets;

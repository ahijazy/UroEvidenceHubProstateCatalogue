CREATE TABLE #Codesets (
  codeset_id int NOT NULL,
  concept_id bigint NOT NULL
)
;

INSERT INTO #Codesets (codeset_id, concept_id)
SELECT 23 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (443392,4312326)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (443392,4312326)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (432851,4112752,4111921,200962,4163261,42512800,42511869,42512038,42511724,42511824,42511643,42512747,42512286,42512532,42512028,40483217,42514272,42514300,42514189,42514287,42514069,42514264,42513173,42513168,42514220,42514355,42514250,42514252,42514087,42514379,42514157,42514198,42514109,42514206,42514341,42514251,42514168,42514350,42514129,42514156,42514102,42514291,42514378,42514367,42514217,42514372,42514165,42514202,42514326,42514143,42514304,42514373,42514103,42514334,42514256,42514182,42514239,42514278,42514362,42514093,42514097,42514376,42514163,42514297,42514363,42514369,42514178,42514307,42514214,42514288,42514208,42514263,42514201,42514303,42514290,42514100,42514327,42514329,42514254,42514294,42514170,42514147,42514104,42514126,42514374,42514199,42514338,42514315,42514173,42514225,42514277,42514231,42514108,42514091,42514232,42514260,42514302,42514191,42514365,42514136,42514237,42514325,42514337,42514359,42514110,42514324,42514228,42514048,42514098,42514137,42514218,42514125,42514080,42514209,42514357,42514348,42514335,42514305,42512152,42512981,42511959,42512883,42512099,42512086,42512566,42512846,42512691,36403050,36403028,36403071,36402997,36403059,36403077,36403012,36402991,36403070,36403044,36403007,36403014,36403066,36403006,36403031,36403020,36403061,36403004,36403009,36403056,36403010,36403042,36403046,36403036,36403026,36403058,36402982,36402269,36403149,36403081,36403143,36403115,36403083,36403138,36403141,36403128,36403152,36403107,36403090,36403132,36403091,36403142,36403134,36403148,36403120,36403095,36403112,36403093,36403139,36403145,36403109,36403034,36402992,36403054,36403041,36403043,36403073,36403030,36403024,36403117,36403102,36402628,36403078,36402440,36403047,36403129,36403013,36403049,36403017,36403027,36403025,36402993,36403064,36403029,36403032,36403075,36402451,36402490,36402587,36402471,36403151,36403082,36403123,36403080,36402645,36403076,36403068,36403039,36403048,36403033,36403057,36403001,36403069,36403072,36403003,36403086,36403154,36402417,36402373,36402391,36402644,4183913,4283614,4289246,4283740,4280897,4289379,36554157,4164333,4179980)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (432851,4112752,4111921,200962,4163261,42512800,42511869,42512038,42511724,42511824,42511643,42512747,42512286,42512532,42512028,40483217,42514272,42514300,42514189,42514287,42514069,42514264,42513173,42513168,42514220,42514355,42514250,42514252,42514087,42514379,42514157,42514198,42514109,42514206,42514341,42514251,42514168,42514350,42514129,42514156,42514102,42514291,42514378,42514367,42514217,42514372,42514165,42514202,42514326,42514143,42514304,42514373,42514103,42514334,42514256,42514182,42514239,42514278,42514362,42514093,42514097,42514376,42514163,42514297,42514363,42514369,42514178,42514307,42514214,42514288,42514208,42514263,42514201,42514303,42514290,42514100,42514327,42514329,42514254,42514294,42514170,42514147,42514104,42514126,42514374,42514199,42514338,42514315,42514173,42514225,42514277,42514231,42514108,42514091,42514232,42514260,42514302,42514191,42514365,42514136,42514237,42514325,42514337,42514359,42514110,42514324,42514228,42514048,42514098,42514137,42514218,42514125,42514080,42514209,42514357,42514348,42514335,42514305,42512152,42512981,42511959,42512883,42512099,42512086,42512566,42512846,42512691,36403050,36403028,36403071,36402997,36403059,36403077,36403012,36402991,36403070,36403044,36403007,36403014,36403066,36403006,36403031,36403020,36403061,36403004,36403009,36403056,36403010,36403042,36403046,36403036,36403026,36403058,36402982,36402269,36403149,36403081,36403143,36403115,36403083,36403138,36403141,36403128,36403152,36403107,36403090,36403132,36403091,36403142,36403134,36403148,36403120,36403095,36403112,36403093,36403139,36403145,36403109,36403034,36402992,36403054,36403041,36403043,36403073,36403030,36403024,36403117,36403102,36402628,36403078,36402440,36403047,36403129,36403013,36403049,36403017,36403027,36403025,36402993,36403064,36403029,36403032,36403075,36402451,36402490,36402587,36402471,36403151,36403082,36403123,36403080,36402645,36403076,36403068,36403039,36403048,36403033,36403057,36403001,36403069,36403072,36403003,36403086,36403154,36402417,36402373,36402391,36402644,4183913,4283614,4289246,4283740,4280897,4289379,36554157,4164333,4179980)
  and c.invalid_reason is null

) E ON I.concept_id = E.concept_id
WHERE E.concept_id is null
) C UNION ALL 
SELECT 24 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (35929528,35919074,35919867,35919162,35919406,35919739,35919904,35919201,1538674,35923557,35936402,35936214,35932686,35927221,35923016,35935237,1539231,1538566,1538629,1538375,1538474)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (35929528,35919074,35919867,35919162,35919406,35919739,35919904,35919201,1538674,35923557,35936402,35936214,35932686,35927221,35923016,35935237,1539231,1538566,1538629,1538375,1538474)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 25 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4294589,4298748,4129917,4127611,4129127,762887,763136,763137,4297944,4297945,4241309,4241547)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4294589,4298748,4129917,4127611,4129127,762887,763136,763137,4297944,4297945,4241309,4241547)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 26 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4163261,44502000,200962)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4163261,44502000,200962)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (4314337,36559535,36536835,4283738,4147164,4173971,4003834,37018875,36563396,36543289,434300,4162276,36556846)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4314337,4147164,4173971,4003834,37018875,36563396,36543289,434300,4162276)
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
  -- Begin Condition Occurrence Criteria
SELECT C.person_id, C.condition_occurrence_id as event_id, C.condition_start_date as start_date, COALESCE(C.condition_end_date, DATEADD(day,1,C.condition_start_date)) as end_date,
  C.visit_occurrence_id, C.condition_start_date as sort_date
FROM 
(
  SELECT co.* , row_number() over (PARTITION BY co.person_id ORDER BY co.condition_start_date, co.condition_occurrence_id) as ordinal
  FROM @cdm_database_schema.CONDITION_OCCURRENCE co
  JOIN #Codesets cs on (co.condition_concept_id = cs.concept_id and cs.codeset_id = 26)
) C

WHERE C.ordinal = 1
-- End Condition Occurrence Criteria

UNION ALL
-- Begin Condition Occurrence Criteria
SELECT C.person_id, C.condition_occurrence_id as event_id, C.condition_start_date as start_date, COALESCE(C.condition_end_date, DATEADD(day,1,C.condition_start_date)) as end_date,
  C.visit_occurrence_id, C.condition_start_date as sort_date
FROM 
(
  SELECT co.* 
  FROM @cdm_database_schema.CONDITION_OCCURRENCE co
  JOIN #Codesets cs on (co.condition_concept_id = cs.concept_id and cs.codeset_id = 25)
) C


-- End Condition Occurrence Criteria

UNION ALL
-- Begin Measurement Criteria
select C.person_id, C.measurement_id as event_id, C.measurement_date as start_date, DATEADD(d,1,C.measurement_date) as END_DATE,
       C.visit_occurrence_id, C.measurement_date as sort_date
from 
(
  select m.* 
  FROM @cdm_database_schema.MEASUREMENT m
JOIN #Codesets cs on (m.measurement_concept_id = cs.concept_id and cs.codeset_id = 24)
) C


-- End Measurement Criteria

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

select 0 as inclusion_rule_id, person_id, event_id
INTO #Inclusion_0
FROM 
(
  select pe.person_id, pe.event_id
  FROM #qualified_events pe
  
JOIN (
-- Begin Criteria Group
select 0 as index_id, person_id, event_id
FROM
(
  select E.person_id, E.event_id 
  FROM #qualified_events E
  INNER JOIN
  (
    -- Begin Demographic Criteria
SELECT 0 as index_id, e.person_id, e.event_id
FROM #qualified_events E
JOIN @cdm_database_schema.PERSON P ON P.PERSON_ID = E.PERSON_ID
WHERE YEAR(E.start_date) - P.year_of_birth >= 18
GROUP BY e.person_id, e.event_id
-- End Demographic Criteria

  ) CQ on E.person_id = CQ.person_id and E.event_id = CQ.event_id
  GROUP BY E.person_id, E.event_id
  HAVING COUNT(index_id) = 1
) G
-- End Criteria Group
) AC on AC.person_id = pe.person_id AND AC.event_id = pe.event_id
) Results
;

select 1 as inclusion_rule_id, person_id, event_id
INTO #Inclusion_1
FROM 
(
  select pe.person_id, pe.event_id
  FROM #qualified_events pe
  
JOIN (
-- Begin Criteria Group
select 0 as index_id, person_id, event_id
FROM
(
  select E.person_id, E.event_id 
  FROM #qualified_events E
  INNER JOIN
  (
    -- Begin Demographic Criteria
SELECT 0 as index_id, e.person_id, e.event_id
FROM #qualified_events E
JOIN @cdm_database_schema.PERSON P ON P.PERSON_ID = E.PERSON_ID
WHERE P.gender_concept_id in (8507)
GROUP BY e.person_id, e.event_id
-- End Demographic Criteria

  ) CQ on E.person_id = CQ.person_id and E.event_id = CQ.event_id
  GROUP BY E.person_id, E.event_id
  HAVING COUNT(index_id) = 1
) G
-- End Criteria Group
) AC on AC.person_id = pe.person_id AND AC.event_id = pe.event_id
) Results
;

SELECT inclusion_rule_id, person_id, event_id
INTO #inclusion_events
FROM (select inclusion_rule_id, person_id, event_id from #Inclusion_0
UNION ALL
select inclusion_rule_id, person_id, event_id from #Inclusion_1) I;
TRUNCATE TABLE #Inclusion_0;
DROP TABLE #Inclusion_0;

TRUNCATE TABLE #Inclusion_1;
DROP TABLE #Inclusion_1;


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

  -- the matching group with all bits set ( POWER(2,# of inclusion rules) - 1 = inclusion_rule_mask
  WHERE (MG.inclusion_rule_mask = POWER(cast(2 as bigint),2)-1)

) Results

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
UNION ALL
-- Censor Events
select i.event_id, i.person_id, MIN(c.start_date) as end_date
FROM #included_events i
JOIN
(
-- Begin Death Criteria
select C.person_id, C.person_id as event_id, C.death_date as start_date, DATEADD(d,1,C.death_date) as end_date,
  CAST(NULL as bigint) as visit_occurrence_id, C.death_date as sort_date
from 
(
  select d.*
  FROM @cdm_database_schema.DEATH d

) C


-- End Death Criteria


) C on C.person_id = I.person_id and C.start_date >= I.start_date and C.START_DATE <= I.op_end_date
GROUP BY i.event_id, i.person_id

UNION ALL
select i.event_id, i.person_id, MIN(c.start_date) as end_date
FROM #included_events i
JOIN
(
-- Begin Condition Occurrence Criteria
SELECT C.person_id, C.condition_occurrence_id as event_id, C.condition_start_date as start_date, COALESCE(C.condition_end_date, DATEADD(day,1,C.condition_start_date)) as end_date,
  C.visit_occurrence_id, C.condition_start_date as sort_date
FROM 
(
  SELECT co.* 
  FROM @cdm_database_schema.CONDITION_OCCURRENCE co
  JOIN #Codesets cs on (co.condition_concept_id = cs.concept_id and cs.codeset_id = 23)
) C


-- End Condition Occurrence Criteria

) C on C.person_id = I.person_id and C.start_date >= I.start_date and C.START_DATE <= I.op_end_date
GROUP BY i.event_id, i.person_id


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

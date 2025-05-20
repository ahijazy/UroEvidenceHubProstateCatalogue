CREATE TABLE #Codesets (
  codeset_id int NOT NULL,
  concept_id bigint NOT NULL
)
;

INSERT INTO #Codesets (codeset_id, concept_id)
SELECT 1 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (432851,4205430,4201930,4264861,4264288,4246703,763131)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (432851,4205430,4201930)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 6 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (36769180,1635142)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (36769180,1635142)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 7 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (3006575)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (3006575)
  and c.invalid_reason is null

) I
) C UNION ALL 
SELECT 8 as codeset_id, c.concept_id FROM (select distinct I.concept_id FROM
( 
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (432851,4205430,4201930)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (432851,4205430,4201930)
  and c.invalid_reason is null

) I
LEFT JOIN
(
  select concept_id from @vocabulary_database_schema.CONCEPT where concept_id in (45767695,4312395,36715103,35624616,4230544,4199641,4126118,4197152,4307000,4301780,4297353,4300784,4299154,4299153,4299143,4301665,193429,196650,442095,439269,132570,439268,318989,4080741,759938,37018661,4183632,4182918,4183744,4182919,4183914,4182920,4183339,4289377,4281017,4283615,4289098,4283737,4289378,4281034,4289687,4283751,4283752,4182921,4289516,4283753,4281036,4281037,4283880,4289692,4289823,4289521,4289381,4289248,4283612,4289093,4289094,4283613,4289095,4289686,4283877,4289690,4289519,4281035,4283878,4283879,4281160,4289824,4281161,4289825,4289826,4289523,4289382,4283741,4289252,4280898,4283743,4289386,4281162,4283744,4283881,4283882,4289524,4283883,4281164,4283884,4281165,4281166,4283885,4283886,4283888,4183628,4183335,4183629,4183630,4183336,759823,4200893,4196260,4196263,4196259,4198446,4201020,4201623,4201014,4196264,4198445,4198444,4201617,4196266,4201621,4201015,4201618,4200894,4196258,4201620,4201622,4196267,4196261,4112489,4112779,4110133,36684950,36684946,36674609,36684948,3181040,40481908,4292389,36716609,36716630,4230394,4230395,4234267,4084147,765459,45772700,4189478,3192209,3186659,36684857,36684949,36684951,45773365,3178803,37016150,37018877,4307838,4119610,192269,4246350,4246352,4312938,4247943,4312296,4311881,4312957,140960,201240,4248064,4248066,4248067,4281024,4312546,36713026,4248184,199752,4313912,4311210,4289680,4281030,4315674,4314072,4314189,4313223,4314495,4313225,4313226,761027,4298848,4312667,4241553,4240561,4241554,4184075,4310595,759939,764957,4291148,40480137,36684913,3662037,4146018,3181145)
UNION  select c.concept_id
  from @vocabulary_database_schema.CONCEPT c
  join @vocabulary_database_schema.CONCEPT_ANCESTOR ca on c.concept_id = ca.descendant_concept_id
  and ca.ancestor_concept_id in (4312395,36715103,35624616,4230544,4199641,4126118,4197152,4307000,4301780,4297353,4300784,4299154,4299153,4299143,4301665,193429,196650,442095,439269,132570,439268,318989,4080741,759938,37018661,4183632,4182918,4183744,4182919,4183914,4182920,4183339,4289377,4281017,4283615,4289098,4283737,4289378,4281034,4289687,4283751,4283752,4182921,4289516,4283753,4281036,4281037,4283880,4289692,4289823,4289521,4289381,4289248,4283612,4289093,4289094,4283613,4289095,4289686,4283877,4289690,4289519,4281035,4283878,4283879,4281160,4289824,4281161,4289825,4289826,4289523,4289382,4283741,4289252,4280898,4283743,4289386,4281162,4283744,4283881,4283882,4289524,4283883,4281164,4283884,4281165,4281166,4283885,4283886,4283888,4183628,4183335,4183629,4183630,4183336,759823,4200893,4196260,4196263,4196259,4198446,4201020,4201623,4201014,4196264,4198445,4198444,4201617,4196266,4201621,4201015,4201618,4200894,4196258,4201620,4201622,4196267,4196261,4112489,4112779,4110133,36684950,36684946,36674609,36684948,3181040,40481908,4292389,36716609,36716630,4230394,4230395,4234267,4084147,765459,45772700,4189478,3192209,3186659,36684857,36684949,36684951,45773365,3178803,37016150,37018877,4307838,4119610,192269,4246350,4246352,4312938,4247943,4312296,4311881,4312957,140960,201240,4248064,4248066,4248067,4281024,4312546,36713026,4248184,199752,4313912,4311210,4289680,4281030,4315674,4314072,4314189,4313223,4314495,4313225,4313226,761027,4298848,4312667,4241553,4240561,4241554,4184075,4310595,759939,764957,4291148,40480137,36684913,3662037,4146018,3181145)
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
  JOIN #Codesets cs on (co.condition_concept_id = cs.concept_id and cs.codeset_id = 8)
) C

WHERE C.ordinal = 1
-- End Condition Occurrence Criteria

UNION ALL
-- Begin Measurement Criteria
select C.person_id, C.measurement_id as event_id, C.measurement_date as start_date, DATEADD(d,1,C.measurement_date) as END_DATE,
       C.visit_occurrence_id, C.measurement_date as sort_date
from 
(
  select m.* , row_number() over (PARTITION BY m.person_id ORDER BY m.measurement_date, m.measurement_id) as ordinal
  FROM @cdm_database_schema.MEASUREMENT m
JOIN #Codesets cs on (m.measurement_concept_id = cs.concept_id and cs.codeset_id = 7)
) C

WHERE C.value_as_concept_id in (45878386,45881618,45882500,45876322)
AND C.ordinal = 1
-- End Measurement Criteria

UNION ALL
-- Begin Measurement Criteria
select C.person_id, C.measurement_id as event_id, C.measurement_date as start_date, DATEADD(d,1,C.measurement_date) as END_DATE,
       C.visit_occurrence_id, C.measurement_date as sort_date
from 
(
  select m.* , row_number() over (PARTITION BY m.person_id ORDER BY m.measurement_date, m.measurement_id) as ordinal
  FROM @cdm_database_schema.MEASUREMENT m
JOIN #Codesets cs on (m.measurement_concept_id = cs.concept_id and cs.codeset_id = 6)
) C

WHERE C.ordinal = 1
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

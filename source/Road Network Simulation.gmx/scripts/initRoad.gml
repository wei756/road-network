///initRoad(instance)
var _inst = argument0;

/* road's name */
_inst.name = generateRoadName();

/*
 * road's type
 * 
 * 0 일반
 * 1 고가도로
 * 2 지하도로
 * 3 현수교
 */
_inst.type = 0;

/* road's lanes */
_inst.lane = ds_list_create();

/*
 * soundproof wall
 *
 * 0 없음
 * 1 벽형
 * 2 천장형
 */
_inst.wall = 0;

/*
 * 가드레일
 * 
 * 0 없음
 * 1 레일형
 * 2 봉형
 */
_inst.guardrail = 0;

/* 평균 주행속도 */
_inst.avgSpeed = 50;

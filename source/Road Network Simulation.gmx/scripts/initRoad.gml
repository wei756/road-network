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

/* 도로 전체 폭 */
_inst.width = 0;

/* road's lanes */
_inst.lane = ds_list_create();
var _laneCount = choose(1, 2, 3);
var _lane = ds_list_create();
ds_list_add(_lane, 0, DOWN, 7, INTERSECTION, 0, 1, 1, 1, 1, 0, 60, 1);
addLane(_inst, _lane);
_lane[| LANE_TEXTURE] = 1;
for(var i = 0; i < _laneCount; i++)
    addLane(_inst, _lane);
_lane[| LANE_UPDOWN] = UP;
for(var i = 0; i < _laneCount; i++)
    addLane(_inst, _lane);
_lane[| LANE_TEXTURE] = 0;
addLane(_inst, _lane);


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

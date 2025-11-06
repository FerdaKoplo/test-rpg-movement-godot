extends Node


enum MovementState {
	IDLE,
	MOVING_UP,
	MOVING_DOWN,
	MOVING_RIGHT,
	MOVING_LEFT,
}

enum AttackState {
	ATTACK_UP,
	ATTACK_DOWN,
	ATTACK_LEFT,
	ATTACK_RIGHT
}

enum CrawlingState{
	CRAWL_UP,
	CRAWL_DOWN,
	CRAWL_LEFT,
	CRAWL_RIGHT
}

const ANIMATIONS = {
	"movement": {
		MovementState.IDLE: "idle",
		MovementState.MOVING_UP: "moving_up",
		MovementState.MOVING_DOWN: "moving_down",
		MovementState.MOVING_LEFT: "moving_left",
		MovementState.MOVING_RIGHT: "moving_right",
	},
	"attack": {
		AttackState.ATTACK_UP: "attack_up",
		AttackState.ATTACK_DOWN: "attack_down",
		AttackState.ATTACK_LEFT: "attack_left",
		AttackState.ATTACK_RIGHT: "attack_right",
	},
	"crawl": {
		CrawlingState.CRAWL_UP: "crawl_up",
		CrawlingState.CRAWL_DOWN: "crawl_down",
		CrawlingState.CRAWL_LEFT: "crawl_left",
		CrawlingState.CRAWL_RIGHT: "crawl_right",
	}
}

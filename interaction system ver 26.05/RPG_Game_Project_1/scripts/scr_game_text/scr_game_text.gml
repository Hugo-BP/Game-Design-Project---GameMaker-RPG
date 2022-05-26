///@_text_id
function scr_game_text(_text_id){

	switch (_text_id) {

	case "npc 1":
		scr_text ("gostas de DJ?");
			scr_option ("Yeah", "npc 1 - yes");
			scr_option ("No", "npc 1 - no");
			scr_option ("EWwwww, not at all", "npc 1 - noo");
			scr_option ("Its possible to like DJ?", "npc 1 - noo");
			
		break;
		case "npc 1 - yes":
			scr_text("How is that even possible???");
			break;
		
		case "npc 1 - no":
		scr_text("Yeah me neither");
		break;
		case "npc 1 - noo":
		scr_text("I feel you bro");
		break;
		
		
		
	case "npc 2":
		scr_text("Isto é o 2");
		break;
	case "npc 3":
	
		break;
				
	}
}
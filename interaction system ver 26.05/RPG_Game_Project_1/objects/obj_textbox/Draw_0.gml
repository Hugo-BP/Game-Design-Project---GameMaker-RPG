/// @description Insert description here
// You can write your code in this editor

 accept_key = keyboard_check_pressed(vk_enter);
 textbox_x = camera_get_view_x(view_camera[0]);
 textbox_y = camera_get_view_y(view_camera[0]) + 120;
 text_x_offset[page] = 10;
 
 if (setup == false)
 {
	 setup = true; 
 
 //Loop para páginas 
 
	for ( var p = 0; p <page_number;p++) {
	//caracteres em cada pagina e guarda numero no text_lengh
 	text_length[p] = string_length(text[p]);
 
	 //x pos for textbox
	//no caracter
	text_x_offset[p] = 15;
	}
 
 }

if (draw_char < text_length[page]){

draw_char += text_speed;
draw_char = clamp(draw_char, 0, text_length[page]); 

}

//mudar página
if (accept_key) {
	
//type done
	if draw_char == text_length[page] {
	
		if (page < page_number-1) {
		
		page++;
		draw_char = 0;
		}
	else {
		
		//link for options
		if (option_number > 0) {
		create_textbox(option_link_id[option_pos]);
		
		}
		instance_destroy();
		}
	
	}
 else {
 draw_char = text_length[page];
 }

}
	
	







//draw textbox
var _textb_x = textbox_x + text_x_offset[page];
var  _textb_y = textbox_y;
textBox_spr_w = sprite_get_width(textBox_spr);
textBox_spr_h = sprite_get_height(textBox_spr);


//draw_sprite_ext(s_textbox,txt_img,textbox_x,textbox_y +yBuffer, textbox_width/textBox_spr_w, textbox_height/textBox_spr_h,0,c_white,1);
draw_sprite(s_textbox,txt_img,textbox_x,textbox_y +yBuffer);





// -------options

 
if ( draw_char == text_length[page] && page == page_number -1)
	{
		//select option		
		option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
		option_pos = clamp(option_pos, 0, option_number-1);
		
		
		//desenhar opcçoes
		var _op_space = 20;
		var _op_bord = 4;
		for (var op = 0; op < option_number; op++)
		{
		//optionbox
		 var _o_w = string_width(option[op]) +_op_bord*2;
		 draw_sprite_ext(textBox_spr,0, _textb_x+15,_textb_y - _op_space*option_number+_op_space*op,_o_w/textBox_spr_w, (_op_space-1)/textBox_spr_h,0,c_white,1);
			//arrow
			if (option_pos == op)
			{
				draw_sprite(s_arrow,0,_textb_x,_textb_y - _op_space*option_number+_op_space*op); 
			}
			
			//optionstext
			draw_text(_textb_x + 15 + _op_bord, _textb_y - _op_space*option_number+_op_space*op+ 2, option[op]);
		
		
		}

 
	}








var _drawtext  = string_copy(text[page], 1, draw_char);
var _drawid  = name;

draw_text_ext(textbox_x+xBuffer+text_x_offset[page]+border ,textbox_y+yBuffer,_drawid,line_sep, line_width);
draw_text_ext(textbox_x+xBuffer+text_x_offset[page]+border ,textbox_y+yBuffer,_drawtext,line_sep, line_width);

draw_text(textbox_x+(xBuffer/2),textbox_y+yBuffer,name); //nome da personagem
//texto
//draw_text_ext(textbox_y+xBuffer,textbox_y+StringHeight+yBuffer, textPart, StringHeight,boxWidth);

	 
 


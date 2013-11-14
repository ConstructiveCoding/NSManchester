#include "pebble_os.h"
#include "pebble_app.h"
#include "pebble_fonts.h"


#define MY_UUID { 0x3D, 0xCC, 0x58, 0x91, 0xF7, 0x97, 0x45, 0xA9, 0xB2, 0x48, 0x3A, 0xBC, 0xF8, 0x7E, 0xA6, 0x70 }
PBL_APP_INFO(MY_UUID,
             "Hello World", "Your Company",
             1, 0, /* App version */
             DEFAULT_MENU_ICON,
             APP_INFO_STANDARD_APP);

Window window;
TextLayer hello_layer;

void handle_init(AppContextRef ctx) {
  window_init(&window, "Window Name");
  window_stack_push(&window, true /* Animated */);

  text_layer_init(&hello_layer, GRect(0, 65, 144, 30));
  text_layer_set_text_alignment(&hello_layer, GTextAlignmentCenter);
  text_layer_set_text(&hello_layer, "Hello World!");
  text_layer_set_font(&hello_layer, fonts_get_system_font(FONT_KEY_ROBOTO_CONDENSED_21));
  layer_add_child(&window.layer, &hello_layer.layer);
}

static void my_in_rcv_handler(DictionaryIterator *received, void *context){
  Tuple *message = dict_find(received, 0x01);
  text_layer_set_text(&hello_layer, message->value->cstring);

  vibes_double_pulse();
}

static void my_in_drp_handler(void *context, AppMessageResult reason){
  text_layer_set_text(&hello_layer, "Message dropped");

  vibes_long_pulse();
}

void pbl_main(void *params) {
  PebbleAppHandlers handlers = {
    .init_handler = &handle_init,
    .messaging_info = {
      .buffer_sizes = {
        .inbound = 43,
        .outbound = 0,
      },
      .default_callbacks.callbacks = {
        .in_received = my_in_rcv_handler,
        .in_dropped = my_in_drp_handler,
      },
    },
  };
  app_event_loop(params, &handlers);
}
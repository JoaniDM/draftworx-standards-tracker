#[tauri::command]
fn get_exe_dir() -> Result<String, String> {
  let exe = std::env::current_exe();
  eprintln!("[get_exe_dir] std::env::current_exe() = {:?}", exe);
  exe
    .map_err(|e| {
      eprintln!("[get_exe_dir] error: {}", e);
      e.to_string()
    })
    .and_then(|p| p.parent().map(|d| d.to_string_lossy().into_owned()).ok_or_else(|| {
      eprintln!("[get_exe_dir] error: no parent");
      "no parent".to_string()
    }))
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
  tauri::Builder::default()
    .plugin(tauri_plugin_fs::init())
    .invoke_handler(tauri::generate_handler![get_exe_dir])
    .setup(|app| {
      if cfg!(debug_assertions) {
        app.handle().plugin(
          tauri_plugin_log::Builder::default()
            .level(log::LevelFilter::Info)
            .build(),
        )?;
      }
      Ok(())
    })
    .run(tauri::generate_context!())
    .expect("error while running tauri application");
}

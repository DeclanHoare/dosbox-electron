const electron = require("electron");

electron.app.on("ready", function ()
{
	var win = new electron.BrowserWindow({width: 640, height: 400, resizable: false});
	electron.app.on("window-all-closed", electron.app.quit);
	electron.ipcMain.on("resize", function (event, width, height)
	{
		win.setSize(width, height);
	});
	win.setMenu(null);
	win.loadFile("index.html");
});

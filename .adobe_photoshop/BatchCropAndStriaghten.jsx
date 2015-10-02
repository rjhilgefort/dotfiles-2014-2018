#target Photoshop
app.bringToFront;

var inFolder = Folder.selectDialog("Please select folder to process");
if (inFolder != null) {
    var fileList = inFolder.getFiles(/.(jpg|tif|psd|)$/i);
    var outfolder = new Folder(decodeURI(inFolder) + "/Edited");
    if (outfolder.exists == false) outfolder.create();
    for (var a = 0; a < fileList.length; a++) {
        if (fileList[a] instanceof File) {
            var doc = open(fileList[a]);
            doc.flatten();
            var docname = fileList[a].name.slice(0, -4);
            CropStraighten();
            doc.close(SaveOptions.DONOTSAVECHANGES);
            var count = 1;
            while (app.documents.length) {
                var saveFile = new File(decodeURI(outfolder) + "/" + docname + "#" + zeroPad(count, 3) + ".jpg");
                SaveJPEG(saveFile, 12);
                activeDocument.close(SaveOptions.DONOTSAVECHANGES);
                count++;
            }
        }
    }
};

function CropStraighten() {
    executeAction(stringIDToTypeID('CropPhotosAuto0001'), undefined, DialogModes.NO);
};

function SaveJPEG(saveFile, jpegQuality) {
    jpgSaveOptions = new JPEGSaveOptions();
    jpgSaveOptions.embedColorProfile = true;
    jpgSaveOptions.formatOptions = FormatOptions.STANDARDBASELINE;
    jpgSaveOptions.matte = MatteType.NONE;
    jpgSaveOptions.quality = jpegQuality;
    activeDocument.saveAs(saveFile, jpgSaveOptions, true, Extension.LOWERCASE);
}

function zeroPad(n, s) {
    n = n.toString();
    while (n.length < s) n = '0' + n;
    return n;
};

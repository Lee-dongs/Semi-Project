package com.kh.common;

import java.io.File;

import com.kh.board.model.vo.Board;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		String originName = originFile.getName();
		
		String title = "게시글"+ String.valueOf(new Board().getBoardNo())+"번 파일";

		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = title+ext;
		return new File(originFile.getParent(),changeName);
	}

}

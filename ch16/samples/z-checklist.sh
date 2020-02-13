#! /bin/bash
zenity --list \
	--checklist \
	--height=400 --width=600 \
	--timeout=35 \
	--title="請選擇您要觀看的程式臭虫？" \
	--column "選取" --column="臭虫編號" --column="嚴重程度" --column="說明" \
		TRUE  1234561 一般 "執行 View 時會當掉" \
		FALSE 5678901 高 "無法正確處理目錄檔案" \
		TRUE 8901234 緊急 "伺服器 port 1234 有安全漏洞"

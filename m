Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7D6D0D
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 18:14:35 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id s15so2723494edd.4
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 11:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UBnStJVt45cTAjhC4EKrrJE26aOExYNYx9iIn/5oiDo=;
        b=ScRAg4b5Y86C+5rwhTCSRpuzx54P92D3Kas4YYGOru0zupPhT6QQihvTGGd9NJ9LGa
         oX2hW4Aql3nw7fjsczkf1Kfw2NNXlZYqOUUbz4NkXo55h+4AHg7rpgc188v4iLdagYoK
         z8OjYl00qmaTsmOa8XZrWu4Va0VN+4MTrTIzHsllNfWk2kKjR8f5siEicalOeEzVZHKe
         ZGTFMqDto8W4vTCavnIrZg7TAip6MV8HU/WAudXebeKEK+X4yyZiYS0CT2t/B3nig4wq
         tWQ0rMjixwJeZ149IYVFryqi4YWHfQFtBXMNzl6Jqn7dG/PNkU1haydYK6jlY2yNfXAo
         B7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UBnStJVt45cTAjhC4EKrrJE26aOExYNYx9iIn/5oiDo=;
        b=ilvBycGFQIbAlCkU76TWNSug+5Y9Nq/8B+bC49Lo00tKy9mfYCHykbC+qO0JFggB99
         G16hTk8gRRw2ErYANe+BL4TDpvaOF07I/SuY5fq9w7C4mFsxaEL/SNv1+Kf0oK00Kfjn
         osI9i+UYeC3eYsPdra0mBBP8wkIc6bH0L+MISMoBUltW5Tllf0ZQjofG69IFgNTs3dUW
         VOds6hMZr7PKhBu5ooQEJyo7ap3svv3b912IzP+RwfBCBL0Ze9RhI0kMK1nhWryEknIe
         g+gP67VArru50SAuIHcuZiUc0ttDWg+8Frw++utLMHphmqgEezbrzIG7KgHoXVWOuAq0
         KD6A==
X-Gm-Message-State: AOAM533uJMFOqslD6teVAV6hyBF3iCMVl6hB9G8X2Gw9DZtvccNpNJp3
	qjCSPlDuZa8HKp8H7KQsLd0=
X-Google-Smtp-Source: ABdhPJwLWl54V/TB6+CjqyBdhnA/2Xr9GtklE6O6wdnpyzkEJEchPdisZbOv15L5POMT6b5grrzP7g==
X-Received: by 2002:a05:6402:229a:: with SMTP id cw26mr13270091edb.266.1617732874034;
        Tue, 06 Apr 2021 11:14:34 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id eo22sm11463976ejc.0.2021.04.06.11.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:14:33 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Add spaces around operators in hal_btcoex.c
Date: Tue,  6 Apr 2021 20:14:28 +0200
Message-Id: <20210406181428.15097-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added spaces around operators. Issue detected by checkpatch.pl.
Spaces around operators are preferred to improve readibility.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 30 +++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index d42cc24c7535..2cb5eedddde3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -721,7 +721,7 @@ static void halbtcoutsrc_BitMaskWrite1Byte(void *pBtcContext, u32 regAddr, u8 bi
 		originalValue = rtw_read8(padapter, regAddr);
 
 		for (i = 0; i <= 7; i++) {
-			if ((bitMask>>i)&0x1)
+			if ((bitMask >> i) & 0x1)
 				break;
 		}
 		bitShift = i;
@@ -1482,8 +1482,8 @@ u32 hal_btcoex_GetRaMask(struct adapter *padapter)
 void hal_btcoex_RecordPwrMode(struct adapter *padapter, u8 *pCmdBuf, u8 cmdLen)
 {
 	BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_TRACE_FW_EXEC, ("[BTCoex], FW write pwrModeCmd = 0x%04x%08x\n",
-		pCmdBuf[0]<<8|pCmdBuf[1],
-		pCmdBuf[2]<<24|pCmdBuf[3]<<16|pCmdBuf[4]<<8|pCmdBuf[5]));
+		pCmdBuf[0] << 8 | pCmdBuf[1],
+		pCmdBuf[2] << 24 | pCmdBuf[3] << 16 | pCmdBuf[4] << 8 | pCmdBuf[5]));
 
 	memcpy(GLBtCoexist.pwrModeVal, pCmdBuf, cmdLen);
 }
@@ -1552,13 +1552,13 @@ u32 hal_btcoex_GetDBG(struct adapter *padapter, u8 *pStrBuf, u32 bufSize)
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[0]=%d for INTF_INIT\n",
-		(GLBtcDbgType[BTC_MSG_INTERFACE]&INTF_INIT)?1:0);
+		(GLBtcDbgType[BTC_MSG_INTERFACE] & INTF_INIT) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[2]=%d for INTF_NOTIFY\n\n",
-		(GLBtcDbgType[BTC_MSG_INTERFACE]&INTF_NOTIFY)?1:0);
+		(GLBtcDbgType[BTC_MSG_INTERFACE] & INTF_NOTIFY) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
@@ -1570,61 +1570,61 @@ u32 hal_btcoex_GetDBG(struct adapter *padapter, u8 *pStrBuf, u32 bufSize)
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[0]=%d for BT_RSSI_STATE\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_BT_RSSI_STATE)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_BT_RSSI_STATE) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[1]=%d for WIFI_RSSI_STATE\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_WIFI_RSSI_STATE)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_WIFI_RSSI_STATE) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[2]=%d for BT_MONITOR\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_BT_MONITOR)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_BT_MONITOR) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[3]=%d for TRACE\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_TRACE)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[4]=%d for TRACE_FW\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_TRACE_FW)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_FW) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[5]=%d for TRACE_FW_DETAIL\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_TRACE_FW_DETAIL)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_FW_DETAIL) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[6]=%d for TRACE_FW_EXEC\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_TRACE_FW_EXEC)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_FW_EXEC) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[7]=%d for TRACE_SW\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_TRACE_SW)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_SW) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[8]=%d for TRACE_SW_DETAIL\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_TRACE_SW_DETAIL)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_SW_DETAIL) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
 	leftSize -= count;
 	count = rtw_sprintf(pstr, leftSize, "\tbit[9]=%d for TRACE_SW_EXEC\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM]&ALGO_TRACE_SW_EXEC)?1:0);
+		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_SW_EXEC) ? 1 : 0);
 	if ((count < 0) || (count >= leftSize))
 		goto exit;
 	pstr += count;
-- 
2.30.2


Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6F6D0D
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 17:00:19 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id r9so551647ejj.3
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rsQrfeO3uLE2PA252oecwt7Lh6zPwtoyCDmolD0D4nk=;
        b=YeAM0Hajfpu73qo95J6l1tgCfjESwU1aXYDpqInX5kVF5SROGZmPtgf9EixKnNB5Pa
         DQOn5DuZblwz5F/HhXRawjj476W3gjzQ40A9IhYjEebyyfSzcJ+YQedUHTMJIHHhNRmO
         yA+FpoADyW3Hd2IP7jm9X8annb5sdTwwuzDtzb/DSOzzwV7mOpsS6rnaHepMj29t9oM6
         G7CkgWbB401L43MXx//Em81/Frogr13cY42L4cfrVJKIt5wm0HBjI+Vtj5x8pVIvkriz
         LK8v8ivQWOWcZtRYQOAPaJZ2v4ghzYdQX4pmoEhiVI9y2M5hLgPaZK1JtHncFtSK5yjD
         dObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rsQrfeO3uLE2PA252oecwt7Lh6zPwtoyCDmolD0D4nk=;
        b=G80yNDWZZoKDGBXwvMtjJYqkPtgnf7ZRrDpCdvzUZRQvpfZKs7pU1h/enA/sxEbcL5
         sL8JQyX3DW4UqPi83Hw4WxvYpVzTFh5c3JJuMFRQauiVeciHQv5svoltqHXC3IBDotY8
         HlHrlhV8yh0GKTwewuv8iv65SU2DTfa8TkzU+27PhzsF4bXKzHUXYA2CGeBDfvnUU+ob
         koT/L1fdRzhbzWpE+CK9vZXTUJxSSj/DePx39aaRrGtHn0HtbhgwGIgYpVwqIVIgZnii
         vBFFwQjrXXmhCCMPEs5AiIGXWhxv+yFl/MrRDlmsrOeXbf8qJZUidbfxho2uDeSbr5oQ
         LsMg==
X-Gm-Message-State: AOAM531W9eWvpm7WHmhrr6qwIdbiIXu8Uu4yngej6co7qqwQhTI5OWJs
	s3n6eaUe4d7iu7vRGsSoDs1aepagswGYJU2H
X-Google-Smtp-Source: ABdhPJxCPrCcnpKdvnfkLu7dpMrA72Erb2CBDWxaJUImNYtuJrJ4lmO7U2TcvquproKk1mKARhsRTw==
X-Received: by 2002:a17:907:e8f:: with SMTP id ho15mr35740739ejc.541.1617728418413;
        Tue, 06 Apr 2021 10:00:18 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id rh6sm4819338ejb.39.2021.04.06.10.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 10:00:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Add spaces around operators in HalBtc8723b2Ant.c
Date: Tue,  6 Apr 2021 19:00:11 +0200
Message-Id: <20210406170011.20753-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Added spaces around operators in file HalBtc8723b2Ant.c. Issue detected
by checkpatch.pl. Spaces are preferred to improve readibility.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 78 +++++++++----------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 6edaefa47af1..4b570ec75e67 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -44,7 +44,7 @@ static u8 halbtc8723b2ant_BtRssiState(
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh+BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
 				btRssiState = BTC_RSSI_STATE_HIGH;
 				BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_BT_RSSI_STATE, ("[BTCoex], BT Rssi state switch to High\n"));
 			} else {
@@ -70,7 +70,7 @@ static u8 halbtc8723b2ant_BtRssiState(
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh+BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
 				BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_BT_RSSI_STATE, ("[BTCoex], BT Rssi state switch to Medium\n"));
 			} else {
@@ -81,7 +81,7 @@ static u8 halbtc8723b2ant_BtRssiState(
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (btRssi >= (rssiThresh1+BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
 				btRssiState = BTC_RSSI_STATE_HIGH;
 				BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_BT_RSSI_STATE, ("[BTCoex], BT Rssi state switch to High\n"));
 			} else if (btRssi < rssiThresh) {
@@ -125,7 +125,7 @@ static u8 halbtc8723b2ant_WifiRssiState(
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh+BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
 				BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_WIFI_RSSI_STATE, ("[BTCoex], wifi RSSI state switch to High\n"));
 			} else {
@@ -151,7 +151,7 @@ static u8 halbtc8723b2ant_WifiRssiState(
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh+BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
 				BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_WIFI_RSSI_STATE, ("[BTCoex], wifi RSSI state switch to Medium\n"));
 			} else {
@@ -162,7 +162,7 @@ static u8 halbtc8723b2ant_WifiRssiState(
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (wifiRssi >= (rssiThresh1+BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
 				BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_WIFI_RSSI_STATE, ("[BTCoex], wifi RSSI state switch to High\n"));
 			} else if (wifiRssi < rssiThresh) {
@@ -222,11 +222,11 @@ static void halbtc8723b2ant_MonitorBtCtr(struct btc_coexist *pBtCoexist)
 
 	u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, regHPTxRx);
 	regHPTx = u4Tmp & bMaskLWord;
-	regHPRx = (u4Tmp & bMaskHWord)>>16;
+	regHPRx = (u4Tmp & bMaskHWord) >> 16;
 
 	u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, regLPTxRx);
 	regLPTx = u4Tmp & bMaskLWord;
-	regLPRx = (u4Tmp & bMaskHWord)>>16;
+	regLPRx = (u4Tmp & bMaskHWord) >> 16;
 
 	pCoexSta->highPriorityTx = regHPTx;
 	pCoexSta->highPriorityRx = regHPRx;
@@ -1173,9 +1173,9 @@ static void halbtc8723b2ant_SetFwPstdma(
 		(
 			"[BTCoex], FW write 0x60(5bytes) = 0x%x%08x\n",
 			H2C_Parameter[0],
-			H2C_Parameter[1]<<24|
-			H2C_Parameter[2]<<16|
-			H2C_Parameter[3]<<8|
+			H2C_Parameter[1] << 24 |
+			H2C_Parameter[2] << 16 |
+			H2C_Parameter[3] << 8 |
 			H2C_Parameter[4]
 		)
 	);
@@ -1691,7 +1691,7 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 				if (m >= 20) /* m 最大值 = 20 ' 最大120秒 recheck是否調整 WiFi duration. */
 					m = 20;
 
-				n = 3*m;
+				n = 3 * m;
 				up = 0;
 				dn = 0;
 				WaitCount = 0;
@@ -1707,7 +1707,7 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 			if (m >= 20) /* m 最大值 = 20 ' 最大120秒 recheck是否調整 WiFi duration. */
 				m = 20;
 
-			n = 3*m;
+			n = 3 * m;
 			up = 0;
 			dn = 0;
 			WaitCount = 0;
@@ -2824,7 +2824,7 @@ void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 
 	/*  enable BB, REG_SYS_FUNC_EN such that we can write 0x948 correctly. */
 	u2Tmp = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0x2);
-	pBtCoexist->fBtcWrite2Byte(pBtCoexist, 0x2, u2Tmp|BIT0|BIT1);
+	pBtCoexist->fBtcWrite2Byte(pBtCoexist, 0x2, u2Tmp | BIT0 | BIT1);
 
 	/*  set GRAN_BT = 1 */
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
@@ -3019,7 +3019,7 @@ void EXhalbtc8723b2ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		cliBuf,
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = %s", "BT Info A2DP rate", \
-		(btInfoExt&BIT0) ? "Basic rate" : "EDR rate"
+		(btInfoExt & BIT0) ? "Basic rate" : "EDR rate"
 	);
 	CL_PRINTF(cliBuf);
 
@@ -3126,7 +3126,7 @@ void EXhalbtc8723b2ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = 0x%x/ 0x%x", "0x778/0x880[29:25]", \
 		u1Tmp[0],
-		(u4Tmp[0]&0x3e000000) >> 25
+		(u4Tmp[0] & 0x3e000000) >> 25
 	);
 	CL_PRINTF(cliBuf);
 
@@ -3139,7 +3139,7 @@ void EXhalbtc8723b2ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = 0x%x/ 0x%x/ 0x%x", "0x948/ 0x67[5] / 0x765", \
 		u4Tmp[0],
-		((u1Tmp[0]&0x20)>>5),
+		((u1Tmp[0] & 0x20) >> 5),
 		u1Tmp[1]
 	);
 	CL_PRINTF(cliBuf);
@@ -3151,9 +3151,9 @@ void EXhalbtc8723b2ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		cliBuf,
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = 0x%x/ 0x%x/ 0x%x", "0x92c[1:0]/ 0x930[7:0]/0x944[1:0]", \
-		u4Tmp[0]&0x3,
-		u4Tmp[1]&0xff,
-		u4Tmp[2]&0x3
+		u4Tmp[0] & 0x3,
+		u4Tmp[1] & 0xff,
+		u4Tmp[2] & 0x3
 	);
 	CL_PRINTF(cliBuf);
 
@@ -3166,10 +3166,10 @@ void EXhalbtc8723b2ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		cliBuf,
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = 0x%x/ 0x%x/ 0x%x/ 0x%x", "0x38[11]/0x40/0x4c[24:23]/0x64[0]", \
-		((u1Tmp[0] & 0x8)>>3),
+		((u1Tmp[0] & 0x8) >> 3),
 		u1Tmp[1],
-		((u4Tmp[0]&0x01800000)>>23),
-		u1Tmp[2]&0x1
+		((u4Tmp[0] & 0x01800000) >> 23),
+		u1Tmp[2] & 0x1
 	);
 	CL_PRINTF(cliBuf);
 
@@ -3190,7 +3190,7 @@ void EXhalbtc8723b2ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		cliBuf,
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = 0x%x/ 0x%x", "0xc50(dig)/0x49c(null-drop)", \
-		u4Tmp[0]&0xff,
+		u4Tmp[0] & 0xff,
 		u1Tmp[0]
 	);
 	CL_PRINTF(cliBuf);
@@ -3204,10 +3204,10 @@ void EXhalbtc8723b2ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 	u1Tmp[1] = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0xa5c);
 
 	faOfdm =
-		((u4Tmp[0]&0xffff0000) >> 16) +
-		((u4Tmp[1]&0xffff0000) >> 16) +
+		((u4Tmp[0] & 0xffff0000) >> 16) +
+		((u4Tmp[1] & 0xffff0000) >> 16) +
 		(u4Tmp[1] & 0xffff) +  (u4Tmp[2] & 0xffff) + \
-		((u4Tmp[3]&0xffff0000) >> 16) +
+		((u4Tmp[3] & 0xffff0000) >> 16) +
 		(u4Tmp[3] & 0xffff);
 
 	faCck = (u1Tmp[0] << 8) + u1Tmp[1];
@@ -3216,7 +3216,7 @@ void EXhalbtc8723b2ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		cliBuf,
 		BT_TMP_BUF_SIZE,
 		"\r\n %-35s = 0x%x/ 0x%x/ 0x%x", "OFDM-CCA/OFDM-FA/CCK-FA", \
-		u4Tmp[0]&0xffff,
+		u4Tmp[0] & 0xffff,
 		faOfdm,
 		faCck
 	);
@@ -3344,7 +3344,7 @@ void EXhalbtc8723b2ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 		ALGO_TRACE_FW_EXEC,
 		(
 			"[BTCoex], FW write 0x66 = 0x%x\n",
-			H2C_Parameter[0]<<16|H2C_Parameter[1]<<8|H2C_Parameter[2]
+			H2C_Parameter[0] << 16 | H2C_Parameter[1] << 8 | H2C_Parameter[2]
 		)
 	);
 
@@ -3369,7 +3369,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 
 	pCoexSta->bC2hBtInfoReqSent = false;
 
-	rspSource = tmpBuf[0]&0xf;
+	rspSource = tmpBuf[0] & 0xf;
 	if (rspSource >= BT_INFO_SRC_8723B_2ANT_MAX)
 		rspSource = BT_INFO_SRC_8723B_2ANT_WIFI_FW;
 
@@ -3381,7 +3381,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		if (i == 1)
 			btInfo = tmpBuf[i];
 
-		if (i == length-1) {
+		if (i == length - 1) {
 			BTC_PRINT(BTC_MSG_INTERFACE, INTF_NOTIFY, ("0x%02x]\n", tmpBuf[i]));
 		} else {
 			BTC_PRINT(BTC_MSG_INTERFACE, INTF_NOTIFY, ("0x%02x, ", tmpBuf[i]));
@@ -3394,13 +3394,13 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 	}
 
 	if (BT_INFO_SRC_8723B_2ANT_WIFI_FW != rspSource) {
-		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2]&0xf; /* [3:0] */
+		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [3:0] */
 
-		pCoexSta->btRssi = pCoexSta->btInfoC2h[rspSource][3]*2+10;
+		pCoexSta->btRssi = pCoexSta->btInfoC2h[rspSource][3] * 2 + 10;
 
 		pCoexSta->btInfoExt = pCoexSta->btInfoC2h[rspSource][4];
 
-		pCoexSta->bBtTxRxMask = (pCoexSta->btInfoC2h[rspSource][2]&0x40);
+		pCoexSta->bBtTxRxMask = (pCoexSta->btInfoC2h[rspSource][2] & 0x40);
 		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_BT_TX_RX_MASK, &pCoexSta->bBtTxRxMask);
 		if (pCoexSta->bBtTxRxMask) {
 			/* BT into is responded by BT FW and BT RF REG 0x3C != 0x01 => Need to switch BT TRx Mask */
@@ -3435,7 +3435,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		pCoexSta->bC2hBtInquiryPage = false;
 
 	/*  set link exist status */
-	if (!(btInfo&BT_INFO_8723B_2ANT_B_CONNECTION)) {
+	if (!(btInfo & BT_INFO_8723B_2ANT_B_CONNECTION)) {
 		pCoexSta->bBtLinkExist = false;
 		pCoexSta->bPanExist = false;
 		pCoexSta->bA2dpExist = false;
@@ -3463,19 +3463,19 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 
 	halbtc8723b2ant_UpdateBtLinkInfo(pBtCoexist);
 
-	if (!(btInfo&BT_INFO_8723B_2ANT_B_CONNECTION)) {
+	if (!(btInfo & BT_INFO_8723B_2ANT_B_CONNECTION)) {
 		pCoexDm->btStatus = BT_8723B_2ANT_BT_STATUS_NON_CONNECTED_IDLE;
 		BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_TRACE, ("[BTCoex], BtInfoNotify(), BT Non-Connected idle!!!\n"));
 	} else if (btInfo == BT_INFO_8723B_2ANT_B_CONNECTION)	{ /*  connection exists but no busy */
 		pCoexDm->btStatus = BT_8723B_2ANT_BT_STATUS_CONNECTED_IDLE;
 		BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_TRACE, ("[BTCoex], BtInfoNotify(), BT Connected-idle!!!\n"));
 	} else if (
-		(btInfo&BT_INFO_8723B_2ANT_B_SCO_ESCO) ||
-		(btInfo&BT_INFO_8723B_2ANT_B_SCO_BUSY)
+		(btInfo & BT_INFO_8723B_2ANT_B_SCO_ESCO) ||
+		(btInfo & BT_INFO_8723B_2ANT_B_SCO_BUSY)
 	) {
 		pCoexDm->btStatus = BT_8723B_2ANT_BT_STATUS_SCO_BUSY;
 		BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_TRACE, ("[BTCoex], BtInfoNotify(), BT SCO busy!!!\n"));
-	} else if (btInfo&BT_INFO_8723B_2ANT_B_ACL_BUSY) {
+	} else if (btInfo & BT_INFO_8723B_2ANT_B_ACL_BUSY) {
 		pCoexDm->btStatus = BT_8723B_2ANT_BT_STATUS_ACL_BUSY;
 		BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_TRACE, ("[BTCoex], BtInfoNotify(), BT ACL busy!!!\n"));
 	} else {
-- 
2.30.2


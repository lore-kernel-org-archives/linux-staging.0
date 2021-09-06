Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CD33FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id x11so15206915ejv.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GTL2Te0GA3sqj8xGGoR0eNa7aAZ7h2sRppnQiOL2FNY=;
        b=oPa3ACs2tZ97BmYmIBnrSgEcEM6PCGH2Ug7rcifIpQaDJO1V2KLbvSV2boUgaLKSfu
         AUj3DQtJWXzZHu8jRWzD/v2NvkZTdlo+I+h2Xb2MQdyOybjnd7H7k2wHn0i9q6/Ndodw
         wCo3vHLWD3BPHmO6pkDiaB57siIAo1qtfKBx/BxBhFFUTER1dwD86S8jT40Dx/xeK2i2
         MZ2XJwZIL3hrz1fnFx1xJWpYMWXnWV/7xEL/Rrsy6EZ4eCZL6kWIc/v/bvIBsv60jkd0
         99gutWZJZqogn/ZIypzdjffTSojD39bfi8TPZUh5dUjPs4ihKK7DUtjnlmo7NjS0MaC1
         8Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GTL2Te0GA3sqj8xGGoR0eNa7aAZ7h2sRppnQiOL2FNY=;
        b=Q3BisMYBGY2UEQTk/K/rhYdui8ZPJKmbg+t3fHL6WGtGSdKPM50m+MTjZR8nOW9OxR
         cWN1lWEXPqD6wuBBASLpph8C1aAINOdxS248jjsW8qoreP/2NR/Iuznt9lrJ5cWFkuY8
         RcXC/ftjMNxu6FTCFGLuuki+LIsORSywT/7sh15Bb+Nfk/TDRloYg9qEBorWQRU8YXfN
         977yIeE3miXTwPucoZZnBekB8kggIGmVlAPpSwmvrWLhGld7kDQrC+UrNaZUpbId5ixm
         mt1YYNh41im/ag8D1otOBH9VjRqnSRPoGjYrdj9f51QJPaWTyz7Gtjxhqi1d+NNt1kwP
         9fAA==
X-Gm-Message-State: AOAM532THwz/JwuaMN84LWHnfpE+k3jMhABpY4npSnHOiYOPldz+anQQ
	/OdCVvjwwhFiVJLQ9GamF3M=
X-Google-Smtp-Source: ABdhPJxh6FI8ghnIi5O3YxDR7NwQLwio+CGOyvO2rWGtvD246C8DKWDv932qESpfki2hiqp8V+xUjw==
X-Received: by 2002:a17:906:4bd6:: with SMTP id x22mr15161126ejv.270.1630954987563;
        Mon, 06 Sep 2021 12:03:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 30/40] staging: r8188eu: remove Efuse_WordEnableDataWrite from hal_ops
Date: Mon,  6 Sep 2021 21:02:13 +0200
Message-Id: <20210906190223.11396-31-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Efuse_WordEnableDataWrite from hal_ops and remove its wrapper
Efuse_WordEnableDataWrite(). Call rtl8188e_Efuse_WordEnableDataWrite()
directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c        | 9 ---------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 9 +++------
 drivers/staging/r8188eu/include/hal_intf.h      | 4 ----
 drivers/staging/r8188eu/include/rtw_efuse.h     | 2 --
 4 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 25c1e545313f..47c4d8bf5daf 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -284,15 +284,6 @@ void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata)
 	}
 }
 
-u8 Efuse_WordEnableDataWrite(struct adapter *pAdapter, u16 efuse_addr, u8 word_en, u8 *data, bool pseudo)
-{
-	u8 ret = 0;
-
-	ret =  pAdapter->HalFunc.Efuse_WordEnableDataWrite(pAdapter, efuse_addr, word_en, data, pseudo);
-
-	return ret;
-}
-
 static u8 efuse_read8(struct adapter *padapter, u16 address, u8 *value)
 {
 	return efuse_OneByteRead(padapter, address, value, false);
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 24009e9cc099..eb30a6fcd8d0 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1315,7 +1315,7 @@ static bool hal_EfuseFixHeaderProcess(struct adapter *pAdapter, u8 efuseType, st
 
 	if (rtl8188e_Efuse_PgPacketRead(pAdapter, pFixPkt->offset, originaldata, bPseudoTest)) {
 		/* check if data exist */
-		badworden = Efuse_WordEnableDataWrite(pAdapter, efuse_addr + 1, pFixPkt->word_en, originaldata, bPseudoTest);
+		badworden = rtl8188e_Efuse_WordEnableDataWrite(pAdapter, efuse_addr + 1, pFixPkt->word_en, originaldata, bPseudoTest);
 
 		if (badworden != 0xf) {	/*  write fail */
 			PgWriteSuccess = rtl8188e_Efuse_PgPacketWrite(pAdapter, pFixPkt->offset, badworden, originaldata, bPseudoTest);
@@ -1442,7 +1442,7 @@ static bool hal_EfusePgPacketWriteData(struct adapter *pAdapter, u8 efuseType, u
 	u32	PgWriteSuccess = 0;
 
 	badworden = 0x0f;
-	badworden = Efuse_WordEnableDataWrite(pAdapter, efuse_addr + 1, pTargetPkt->word_en, pTargetPkt->data, bPseudoTest);
+	badworden = rtl8188e_Efuse_WordEnableDataWrite(pAdapter, efuse_addr + 1, pTargetPkt->word_en, pTargetPkt->data, bPseudoTest);
 	if (badworden == 0x0F) {
 		/*  write ok */
 		return true;
@@ -1569,7 +1569,7 @@ static bool hal_EfusePartialWriteCheck(struct adapter *pAdapter, u8 efuseType, u
 			    (!hal_EfuseCheckIfDatafollowed(pAdapter, curPkt.word_cnts, startAddr + 1, bPseudoTest)) &&
 			    wordEnMatched(pTargetPkt, &curPkt, &matched_wden)) {
 				/*  Here to write partial data */
-				badworden = Efuse_WordEnableDataWrite(pAdapter, startAddr + 1, matched_wden, pTargetPkt->data, bPseudoTest);
+				badworden = rtl8188e_Efuse_WordEnableDataWrite(pAdapter, startAddr + 1, matched_wden, pTargetPkt->data, bPseudoTest);
 				if (badworden != 0x0F) {
 					u32	PgWriteSuccess = 0;
 					/*  if write fail on some words, write these bad words again */
@@ -1781,9 +1781,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->read_rfreg = &rtl8188e_PHY_QueryRFReg;
 	pHalFunc->write_rfreg = &rtl8188e_PHY_SetRFReg;
 
-	/*  Efuse related function */
-	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
-
 	pHalFunc->IOL_exec_cmds_sync = &rtl8188e_IOL_exec_cmds_sync;
 
 	pHalFunc->hal_notch_filter = &hal_notch_filter_8188e;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 748c809b1adc..4b937bd2c63c 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -177,10 +177,6 @@ struct hal_ops {
 			       enum rf_radio_path eRFPath, u32 RegAddr,
 			       u32 BitMask, u32 Data);
 
-	u8	(*Efuse_WordEnableDataWrite)(struct adapter *padapter,
-					     u16 efuse_addr, u8 word_en,
-					     u8 *data, bool bPseudoTest);
-
 	int (*IOL_exec_cmds_sync)(struct adapter *padapter,
 				  struct xmit_frame *frame, u32 max_wait,
 				  u32 bndy_cnt);
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index b10798354a6b..2dd74c9c691d 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -117,8 +117,6 @@ u8 efuse_OneByteRead(struct adapter *adapter, u16 addr, u8 *data, bool test);
 u8 efuse_OneByteWrite(struct adapter *adapter, u16 addr, u8 data, bool	test);
 
 void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
-u8 Efuse_WordEnableDataWrite(struct adapter *adapter, u16 efuse_addr,
-			     u8 word_en, u8 *data, bool test);
 
 u8 EFUSE_Read1Byte(struct adapter *adapter, u16 address);
 void EFUSE_ShadowMapUpdate(struct adapter *adapter, u8 efusetype, bool test);
-- 
2.33.0


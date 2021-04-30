Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DF2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:56 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c22so17866839edn.7
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vUdMFn0pzx+qCKX4tOp46p2P1z+8kq23wVz0Evq/QVQ=;
        b=PNjPaoDBzfbnZKuYSYtUDG2oRGshZrqGSMVYCPdiF9tTUX3RxxaBcxvpZ0i4/XuBXO
         IIR8SM3OHKudaubAA3nnfVJAt7JLYN+eHMtAlvi8X6wdSZBrFzjCylrSgHISVHLl8hwa
         +Z72rebzTYZ09BmLpIQmO3zM8t6Nik6jrOleug5AOKqcOmDcu/TyfgcoIC44ADGSkhuu
         kQoHFEMgSFQC1pNhCF4PzrMv2LoqWHNSjm6I+foJBWGJ7GxxMMHvs2p2Ix5SKDLhp5bq
         ugWanh1gVoZmIwZDwe3szyOwauVX1VIGJ7f7jXYxAM/oLFGWtEMFYjFREUBtjkHlPiUw
         PfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vUdMFn0pzx+qCKX4tOp46p2P1z+8kq23wVz0Evq/QVQ=;
        b=hXlzAN4NYEojcGZN2Klyf3WWSUlVWDBD0fvQMEQ8qS2L6vPR0VX2LuDI+0qiNnoR6M
         +VyWjzVeGEY0XTnsb6kFa1G3DryXmqTakQ0ThtUwgiOi7cEguj90RFKAb2lVj4nDqu9d
         YmXKuPtzo5KcHxtQnMbMidnnZsnqU1FDvZ+yQYcs2BVyDTnoGiYHsUuXYFVu5JClPIjm
         w0GaNxsx9ck3ZIN7IyrVFK0dZCFDAlL397IBZBr6fVALHouazaBMYr7FIfJ51BA4rJVi
         OiJKbky475BcZ/9m7xHNU/O7cwP1PfN1IDH5fPVP+zkfkDktoC5IO5rHi9cqd0Tlgw63
         yJ5g==
X-Gm-Message-State: AOAM532FX9F5Qyf0sih4woOpRIVonJbuhhJVJ1tPbdYQ/1eO6nFyzKZE
	MuJ2T5Qx67JIWnS6gLUV7xUHkYwt9YqLiw==
X-Google-Smtp-Source: ABdhPJxfJU3tz/p4oMifg2GMmyqH5A/3RLiPMbPqzbcjcJuDPgY490iE4fixKn6z3FDhj60gMbEQvg==
X-Received: by 2002:a05:6402:51cd:: with SMTP id r13mr4191751edd.116.1619768695113;
        Fri, 30 Apr 2021 00:44:55 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id i4sm1429496ejv.58.2021.04.30.00.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 30/43] staging: rtl8723bs: remove hal_btcoex_GetDBG() function
Date: Fri, 30 Apr 2021 09:43:48 +0200
Message-Id: <f9bb3f1f0735f1f97c23da0db1a4c242459206f3.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused hal_btcoex_GetDBG() function definition and
prototype.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 123 ------------------
 .../staging/rtl8723bs/include/hal_btcoex.h    |   1 -
 2 files changed, 124 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index cac2d6077403..02d9997094f2 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1492,126 +1492,3 @@ void hal_btcoex_DisplayBtCoexInfo(struct adapter *padapter, u8 *pbuf, u32 bufsiz
 	DBG_BT_INFO_INIT(pinfo, NULL, 0);
 }
 
-u32 hal_btcoex_GetDBG(struct adapter *padapter, u8 *pStrBuf, u32 bufSize)
-{
-	s32 count;
-	u8 *pstr;
-	u32 leftSize;
-
-
-	if (!pStrBuf || bufSize == 0)
-		return 0;
-
-	pstr = pStrBuf;
-	leftSize = bufSize;
-
-	count = rtw_sprintf(pstr, leftSize, "#define DBG\t%d\n", DBG);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-
-	count = rtw_sprintf(pstr, leftSize, "BTCOEX Debug Setting:\n");
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-
-	count = rtw_sprintf(pstr, leftSize,
-		"INTERFACE / ALGORITHM: 0x%08X / 0x%08X\n\n",
-		GLBtcDbgType[BTC_MSG_INTERFACE],
-		GLBtcDbgType[BTC_MSG_ALGORITHM]);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-
-	count = rtw_sprintf(pstr, leftSize, "INTERFACE Debug Setting Definition:\n");
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[0]=%d for INTF_INIT\n",
-		(GLBtcDbgType[BTC_MSG_INTERFACE] & INTF_INIT) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[2]=%d for INTF_NOTIFY\n\n",
-		(GLBtcDbgType[BTC_MSG_INTERFACE] & INTF_NOTIFY) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-
-	count = rtw_sprintf(pstr, leftSize, "ALGORITHM Debug Setting Definition:\n");
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[0]=%d for BT_RSSI_STATE\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_BT_RSSI_STATE) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[1]=%d for WIFI_RSSI_STATE\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_WIFI_RSSI_STATE) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[2]=%d for BT_MONITOR\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_BT_MONITOR) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[3]=%d for TRACE\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[4]=%d for TRACE_FW\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_FW) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[5]=%d for TRACE_FW_DETAIL\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_FW_DETAIL) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[6]=%d for TRACE_FW_EXEC\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_FW_EXEC) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[7]=%d for TRACE_SW\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_SW) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[8]=%d for TRACE_SW_DETAIL\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_SW_DETAIL) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-	count = rtw_sprintf(pstr, leftSize, "\tbit[9]=%d for TRACE_SW_EXEC\n",
-		(GLBtcDbgType[BTC_MSG_ALGORITHM] & ALGO_TRACE_SW_EXEC) ? 1 : 0);
-	if ((count < 0) || (count >= leftSize))
-		goto exit;
-	pstr += count;
-	leftSize -= count;
-
-exit:
-	count = pstr - pStrBuf;
-
-	return count;
-}
diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index 9048499e756a..eb9d0ba861a5 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -53,6 +53,5 @@ u8 hal_btcoex_LpsVal(struct adapter *);
 u32 hal_btcoex_GetRaMask(struct adapter *);
 void hal_btcoex_RecordPwrMode(struct adapter *padapter, u8 *pCmdBuf, u8 cmdLen);
 void hal_btcoex_DisplayBtCoexInfo(struct adapter *, u8 *pbuf, u32 bufsize);
-u32 hal_btcoex_GetDBG(struct adapter *, u8 *pStrBuf, u32 bufSize);
 
 #endif /*  !__HAL_BTCOEX_H__ */
-- 
2.20.1


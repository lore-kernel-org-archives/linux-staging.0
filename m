Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A2D2D060C
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776596601; cv=none; b=NwbwAw/XQT1T5RZIYVvtseUHLspr6ZCQsR13GX6IrSS8kW8u1VbZWH9TA9/Yh3g8d9R2SaeaWOWjepwPF1vYl57sFy0yeX9jMh5vn6sMJ1s2cSmJfXOeQduRobdjBZ0m/0cD/zxL7CnO52eGLp68aTWQAXTqs/I3PqS8KG0vGo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776596601; c=relaxed/simple;
	bh=Y2jFS2e4hsvPPvqD1llQ+++gbNlrNH+shBFJ1oRBgx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AUn4gx7mRdpPU35+Ca7jZLlpDjvuRSpS1pUa2vqy/oiUp8fNEkJeYWsnxt4bgCTYe+T0CR/xPodbHPweGJkbExvelG2D3qUb803SNJojhzGWTRK8nDNQwxdmHdUrGvXN6t5KU0iUIhYVWvKspsGNgAJaWiAhSrnI3rzztGjbwp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF1L1gZT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF1L1gZT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so12253745e9.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776596598; x=1777201398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yTJ50WOsh17wvz7VDqY4cHRPZbseei9tGOgF4VjQLEs=;
        b=EF1L1gZTu2dxDZfrSJq6HAO22YeMtFlnhVSNnjbtPDER6TMACHaZ1tMZsAWUMjkJ3R
         I3Nmgx8WB5+20TsGxz6Kq4GVr+fHKj2hlGS8hyDbjtSLETjwXLiiVc/bZhdP9CmSvWNr
         8wuHC4TXtHuIS7hvkgFQDC1QGBi2Xr7jPpld8hKUi51RDq8PlV0SWyyp7hjR5cvKtDLt
         pJig+yZr36ZZFIO9zEPSK5kmP1pZSPlMENs8vJ5K8dTnDv+2C6KmGN5nuzdXTLfcC09Q
         cCz3DBPhqOpd4CLNvDYLlKhgJIdAvb1K/wnOG6pow7U5oHpqNff11GRs6PZor16/Bnq0
         7hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776596598; x=1777201398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTJ50WOsh17wvz7VDqY4cHRPZbseei9tGOgF4VjQLEs=;
        b=b3xoFsC2aDz8obreHsusefScmzusbXUramNaGkCuAuCGhAjzOdMWWtPFO/GjBXfvzl
         QU+ERmSb5dI7knPQ3QllymT0DOUUQsJ9hstzeNGwDtep7n95EXQAYB3cITZkidUnemB2
         l8dkn2lPcHklkRv6hE3T8KuTDhn4LF51mSkHVDgcAKjjLKSumu+BGN4bw2hfCmPnPuP+
         qGBDfcknnROzm3mIFvgUNLlMQqDf6wXmPhLezKWuTqnIXbskAkDGU58nhXjmhWR6TQeq
         FgJ1uqo3DdVyQ4h8e8/DSu08PxEgsUrnBcmbnnjxZXy7PHT4nuS3LvZYrrTiRy+fwPsP
         gV4g==
X-Gm-Message-State: AOJu0Yz/nF//y/9fJZaakWPbYbi6DRDGpntnbzftKoEFlgXdyYphxp5x
	10hH77nGEM0RAaZ7xfhk0Jq+G+l4I3niLtCdpVPWDSmFzjqWFrfyykT2hNIIzD7/eOpfwQ==
X-Gm-Gg: AeBDiev/RQsQdiRqtnpoLm5tfWe01w0TGtvtFmqIr6VP+LjY8bULdZjZi/LVIMo9P84
	bdXQQayu+LKfOV47GDoI1mdneHYNVAGQpgNm7dJ7v1da7amCpmrP9crutD/573Be4Rtu/9Q+LrH
	cgJLLpWYxgVCH4gVKfRQ3WClnjJkffe1II3NLBW8URot2exFW5eKZa0GBVZK+Jk8CcfHg+YGzmq
	Y46CFWittA3lLa9d5FJ9RVs2Kk32oQd3yA/wY+7hJ4xPnMdthKpgEFRYc6hb2HtfPuSqCVFBwi5
	Yo4jDLsnRR/rFyJZTUN8OOpCnuqGjuZ7U1syKBVMRGv+ifOAUrmx4sC0RkskfnUr7n2qtwK5Fw4
	NR1Up7AdfvOcKSkfj7NHD8b7iR7CnRKsIWK3sULUK0In6r18VM+ysNvDuNCXKOA+uU+7kiWKEZn
	RZ9h1RI9KHoYvom3xHWFLHkv7g4YofTYbygMma2tykDwL8
X-Received: by 2002:a05:600c:6211:b0:488:afb5:6a21 with SMTP id 5b1f17b1804b1-488fb77d0ccmr122246745e9.15.1776596597743;
        Sun, 19 Apr 2026 04:03:17 -0700 (PDT)
Received: from localhost.localdomain ([62.4.56.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm214548165e9.2.2026.04.19.04.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 04:03:17 -0700 (PDT)
From: Vasilije Knezevic <vasilijeknezevic.dev@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Vasilije Knezevic <vasilijeknezevic.dev@gmail.com>
Subject: [PATCH] rtl8723bs: improve readability in cmd filter and traffic watchdog
Date: Sun, 19 Apr 2026 13:01:51 +0200
Message-ID: <20260419110151.5689-1-vasilijeknezevic.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - Rename bAllow to allow_pre_init_cmd
 - Convert traffic flags to bool where appropriate
 - Improve comments for traffic detection logic

 No functional change.

Signed-off-by: Vasilije Knezevic <vasilijeknezevic.dev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..e0c57652e0f5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -298,12 +298,13 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
-	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
+	/* set to true to allow enqueuing cmd when hw_init_completed is false */
+	bool allow_pre_init_cmd = false;
 
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
-		bAllow = true;
+		allow_pre_init_cmd = true;
 
-	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
+	if ((!pcmdpriv->padapter->hw_init_completed && !allow_pre_init_cmd) ||
 	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
 		return _FAIL;
 
@@ -1127,12 +1128,16 @@ static void collect_traffic_statistics(struct adapter *padapter)
 
 u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 {
-	u8 bEnterPS = false;
+	bool bEnterPS = false;
 	u16 BusyThresholdHigh = 25;
 	u16 BusyThresholdLow = 10;
 	u16 BusyThreshold = BusyThresholdHigh;
-	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
-	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
+	u8 bBusyTraffic = false;
+	u8 bTxBusyTraffic = false;
+	u8 bRxBusyTraffic = false;
+	u8 bHigherBusyTraffic = false;
+	u8 bHigherBusyRxTraffic = false;
+	u8 bHigherBusyTxTraffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
@@ -1156,7 +1161,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 				bTxBusyTraffic = true;
 		}
 
-		/*  Higher Tx/Rx data. */
+		/*  Detect high Tx/Rx traffic load. */
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
 		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
 			bHigherBusyTraffic = true;
@@ -1191,7 +1196,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 				bEnterPS = true;
 		}
 
-		/*  LeisurePS only work in infra mode. */
+		/*  LeisurePS based on traffic state (infra mode only) */
 		if (bEnterPS) {
 			if (!from_timer)
 				LPS_Enter(padapter, "TRAFFIC_IDLE");
-- 
2.47.3


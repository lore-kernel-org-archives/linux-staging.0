Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9075C344021
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 05:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768541497; cv=none; b=fd0UAcqhl8MKkTloasTsBFUAKE/jlN0IeHamKkIoM7T0ZFYyy1g6Ui2NG0U1kRPtnCy56zOwSA5nF32X7EEwENuQ57iIVVBbckGH4Ple2bQGB+NsCQDPAVPKn3MKa7JNrtLkeyzVGuRx41j8++PRLA4ly4FzX9z3DSlAx3E5cmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768541497; c=relaxed/simple;
	bh=w1QjQXCOv1bfh9W5mkRQD18AYg09Hk0JoLaQD5X8oHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMsIs9+IeiYWf7Gkfk1KnmfpLpy3tP/hdcNAhhv04vgKd2Aueb5A/OssZ0tS7ivtiCvJMmrt6d7rUzUZ9CY13kMzFvI0jFOm82M89TqJuSSUiPnbdsZxMN4FxHuYa28foDJ1jjO0Fr+XpbDNxI5k42VHUpU6tcG3MAS9pBBcc5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRS/K1Ah; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRS/K1Ah"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c20ee83dso14675635ad.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 21:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768541495; x=1769146295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQw+sLTbJBvLuB3MJyj+YsJX6wofShLbCUqa2/jMmFQ=;
        b=fRS/K1AhJrnfrr+O2rg34mZfYPsiQged68bFg6GROpr1SrihXL4FdO/f00n7qPQDUF
         rn9XVPb75P9dt1c/4EUwmrtPSEI90LXu6AtxZArhK5AOSe4fxGRcAJy1BmKWkcfTxl2Q
         TdHJxBZSr6K5TtvFewsPYsl/KzqF/hFPsQo9OxCc7kIOS0zate7W+HWedNyVT8/3cWWI
         4/7xRV3ZwEdXGyTtCNo8TsJtIwL3i2oCQSXue6Rhg4Lk9FOxNnPIODw6rqp3dx3BU/qr
         kLpdIc+xFwRU7inefEWOAwv3AanxqGISlTsLqoUULcJvPoo/e1n/VWjaQo6Jc6RExqb8
         Ih/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768541495; x=1769146295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KQw+sLTbJBvLuB3MJyj+YsJX6wofShLbCUqa2/jMmFQ=;
        b=TDJSuUOhBO6T2YdLFNea+Y2hI0cbk7ZnNU8oB7Xg3yFiAyyUGcswRNnl4cE7q7KOj6
         K3B/DXXHwSvSLueKt94refn2CRw8IgdO3zZuDwNbn46y8nKqi8ypI1k40Q1TgvhrvhH1
         4YHhOWV2fV4fkGOfFaEfYJ1Rmk9evwXyjCgpFNNUrYQbgHQhm04l11eskmMHtmHW6bYY
         FIU3GBgkKAnB1Tc4+JTLRhbZgqCt+JcaRUb5/WDDSaNsHp55xxR5sNku71CwIHjpUUts
         gC+RvbYmVwAik7yAyq2xs/b2fXieJrbPWJEK4UNB14ywTQKTm9QmgnCJ8OMaRMIjPoFJ
         3vfA==
X-Forwarded-Encrypted: i=1; AJvYcCX0QkjSEnQr0DEg2SusGuDgRsh2hDcmrkbhd+w4MRHKi2geuK6ShPNf4zNMGrkR8o43kMA2uqa7kS42njzA@lists.linux.dev
X-Gm-Message-State: AOJu0YzjUjxp3BbkHb/HvuqtJIoaXMCUGKz/B+VgKPBFCi9CcowBlGKh
	h3/G8xPmrLamPk8v4uRHIU+suMzy4q1UEmfqMK7A03aX6tKa4NVuVYIj
X-Gm-Gg: AY/fxX4FoWVKlLICy4sl3SuTs3DGavn7oyoIEKWHmoosXItqkWiXHVU3mLCTiabD5Z5
	JOaKoV0388UdQuQynH6Dg5rJy0CKz3yC/xEXfAb1Nb+9V+bF171aj4u3iYnzh867rKkoqvZ+ErV
	QRr7VQinvhM+VzLY05gF/3+VNcgx0Cp3GvIWEHhK0crFu9uQwyaTksc6lwanpXapNJy9EIARDht
	H47HM/N/megO5nrsjLtbbOQVhoWPc6HiOdiRMn0r4nKcezkUBfbYVMmLn4CCwjAnPwX2ekedeLM
	hSHXzi06Mgbh45ptX9VhPwdF1N0v1tF/6ZAK16ORGEmv9cKytsCxBHMzC46dVp4MmFbZvUaRjwC
	gMSWVQfo+rwAkzB/hgSIYrGAE53QtBR3cIl/vGrymOBk+ywei3ZtmtFp5JJ4b4dqVt5L1g+zvc4
	uQeZ/ce4kNVzB76rBsdw==
X-Received: by 2002:a17:902:d2d0:b0:2a0:9656:a218 with SMTP id d9443c01a7336-2a7175a331fmr19155465ad.28.1768541494729;
        Thu, 15 Jan 2026 21:31:34 -0800 (PST)
Received: from snowman ([2401:4900:4ffd:9a9f:7003:5e9c:3fa9:4130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35274445a03sm297321a91.7.2026.01.15.21.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 21:31:34 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 3/4] staging: rtl8723bs: rename CamelCase identifiers to snake_case
Date: Fri, 16 Jan 2026 11:00:51 +0530
Message-ID: <20260116053052.4198-4-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116053052.4198-1-khushalchitturi@gmail.com>
References: <20260116053052.4198-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename several CamelCase identifiers across the driver
to follow kernel naming conventions.

The following identifiers were renamed:
1) UserPriority to user_priority
2) NumTxOkInPeriod to tx_ok_in_period
3) HTOpMode to ht_op_mode

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

---
Changelog:
v2 -> v3: Resubmitted as a versioned series.
v1 -> v2: Corrected commit messages.

 drivers/staging/rtl8723bs/core/rtw_cmd.c     | 17 ++++++++++-------
 drivers/staging/rtl8723bs/core/rtw_mlme.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 17 +++++++++--------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h |  6 +++---
 5 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..005e6737e1af 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1148,10 +1148,11 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 			BusyThreshold = BusyThresholdLow;
 
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
+			pmlmepriv->LinkDetectInfo.tx_ok_in_period > BusyThreshold) {
 			bBusyTraffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
+			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod >
+			    pmlmepriv->LinkDetectInfo.tx_ok_in_period)
 				bRxBusyTraffic = true;
 			else
 				bTxBusyTraffic = true;
@@ -1159,18 +1160,20 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 
 		/*  Higher Tx/Rx data. */
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
+			pmlmepriv->LinkDetectInfo.tx_ok_in_period > 4000) {
 			bHigherBusyTraffic = true;
 
-			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
+			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod >
+			    pmlmepriv->LinkDetectInfo.tx_ok_in_period)
 				bHigherBusyRxTraffic = true;
 			else
 				bHigherBusyTxTraffic = true;
 		}
 
 		/*  check traffic for  powersaving. */
-		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
-			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
+		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod +
+		      pmlmepriv->LinkDetectInfo.tx_ok_in_period) > 8) ||
+		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
 			bEnterPS = false;
 
 			if (bBusyTraffic) {
@@ -1214,7 +1217,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	}
 
 	pmlmepriv->LinkDetectInfo.NumRxOkInPeriod = 0;
-	pmlmepriv->LinkDetectInfo.NumTxOkInPeriod = 0;
+	pmlmepriv->LinkDetectInfo.tx_ok_in_period = 0;
 	pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod = 0;
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = bBusyTraffic;
 	pmlmepriv->LinkDetectInfo.bTxBusyTraffic = bTxBusyTraffic;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..6b8923109c47 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2518,7 +2518,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
 	/* if (bmcst || (padapter->mlmepriv.LinkDetectInfo.bTxBusyTraffic == false)) */
-	if (bmcst || (padapter->mlmepriv.LinkDetectInfo.NumTxOkInPeriod < 100))
+	if (bmcst || (padapter->mlmepriv.LinkDetectInfo.tx_ok_in_period < 100))
 		return;
 
 	priority = pattrib->priority;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 97e38ef62ac4..39477b7c443d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -403,10 +403,11 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 
 			/* check HT op mode */
 			if (pattrib->ht_en) {
-				u8 HTOpMode = pmlmeinfo->HT_protection;
+				u8 ht_op_mode = pmlmeinfo->HT_protection;
 
-				if ((pmlmeext->cur_bwmode && (HTOpMode == 2 || HTOpMode == 3)) ||
-					(!pmlmeext->cur_bwmode && HTOpMode == 3)) {
+				if ((pmlmeext->cur_bwmode &&
+				     (ht_op_mode == 2 || ht_op_mode == 3)) ||
+				    (!pmlmeext->cur_bwmode && ht_op_mode == 3)) {
 					pattrib->vcs_mode = RTS_CTS;
 					break;
 				}
@@ -605,17 +606,17 @@ static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 {
 	struct ethhdr etherhdr;
 	struct iphdr ip_hdr;
-	s32 UserPriority = 0;
+	s32 user_priority = 0;
 
 	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
 	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
 
-	/*  get UserPriority from IP hdr */
+	/*  get user_priority from IP hdr */
 	if (pattrib->ether_type == 0x0800) {
 		_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
-		UserPriority = ip_hdr.tos >> 5;
+		user_priority = ip_hdr.tos >> 5;
 	}
-	pattrib->priority = UserPriority;
+	pattrib->priority = user_priority;
 	pattrib->hdrlen = WLAN_HDR_A3_QOS_LEN;
 	pattrib->subtype = WIFI_QOS_DATA_TYPE;
 }
@@ -1391,7 +1392,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
-		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
+		pmlmepriv->LinkDetectInfo.tx_ok_in_period += pkt_num;
 
 		pxmitpriv->tx_pkts += pkt_num;
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..ad2b79cb6f0a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -366,7 +366,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 			struct rt_link_detect_t *plinkinfo;
 			plinkinfo = &padapter->mlmepriv.LinkDetectInfo;
 
-			if (plinkinfo->NumTxOkInPeriod > plinkinfo->NumRxOkInPeriod)
+			if (plinkinfo->tx_ok_in_period > plinkinfo->NumRxOkInPeriod)
 				*pU4Tmp = BTC_WIFI_TRAFFIC_TX;
 			else
 				*pU4Tmp = BTC_WIFI_TRAFFIC_RX;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 2a128568c6df..b40b10a854a9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -93,9 +93,9 @@ struct sitesurvey_ctrl {
 };
 
 struct rt_link_detect_t {
-	u32 			NumTxOkInPeriod;
-	u32 			NumRxOkInPeriod;
-	u32 			NumRxUnicastOkInPeriod;
+	u32			tx_ok_in_period;
+	u32			NumRxOkInPeriod;
+	u32			NumRxUnicastOkInPeriod;
 	bool			bBusyTraffic;
 	bool			bTxBusyTraffic;
 	bool			bRxBusyTraffic;
-- 
2.52.0


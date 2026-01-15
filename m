Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479A4358D0D
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 09:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469860; cv=none; b=HLVS759bCLvFeCq6bo6kavqpRubP3PQi1aowMUcgHcFU/rs5IaK+bHL9UyoDud5oPv7PTMdbkr0Yllh25O8sM9xrRO+YNUhbfBPwoh9DDR3fOHfVyJuqlPbQzUr1Srfb2Xq7IF9y1n8xxXcrl/QSDngDJtM972hSD+iQMe0egmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469860; c=relaxed/simple;
	bh=fnFV8PBNQlippHm1HirX/EXSWFlF7ZQmPRG49u4zF0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjNww41WBoEjXby4+GIvWBOU+1jJPNBT7BVQ7JnauZB3jiN9YdSKPo7pFqOWMvzJubTsnGy/10ik67ms7uFh8PZ0YxBGPTtVYRb1vo/KLbmWZw50SmtjfRmWfsGqGGEwaJIYSgBzpEJD9SqvpQpTPkaud0JctUgwQKlomegVDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CV5yKzJU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CV5yKzJU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0c09bb78cso4596255ad.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 01:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768469856; x=1769074656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlvyCIH2YNVvl+Z7egcO8FGfVtyV86Fgh9Yw7qPMcmQ=;
        b=CV5yKzJUCpS12z9zbOvCOPyE8pP7iZXsXAmYSDjKI3A/WwuPhkJHiTyqVuDrEVoFFx
         JDgzvvD/L5Is7fwBd4NqBmRu21islUl3f/artk8foK8n5ewomBYlsc+2tCuXOMNurTjI
         sA/LqzPyN70Fttqyd4u/xbzJDFIENapIEvPlBh38umutV4woWEmhHmQfkLc87A5P1022
         aaIQO3pOmqns+c5OpeM3LGffw2SC2SHIyP+vg0O9a7EDKanZAOb87AL7yf2cjGgE8O1I
         /h04cy7gCmuMPmqOFvkAM74fvOA1tVzkNQ5ijDklmqsVuITF0CprTC5ZvobuOJC6+7uL
         JCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469856; x=1769074656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlvyCIH2YNVvl+Z7egcO8FGfVtyV86Fgh9Yw7qPMcmQ=;
        b=XkGujF5ZB0MlXVwbsdcX8pynuwU0pK6bYidHK42S3UtIjri40mTxmPYPfbO5z35bSx
         96RRR6w6xUl0ON6C6SzzUSymrhMuEhCnV/2YoXjJr25t2w05RqBJX1Ea0dOn20UxL7uw
         45Mi1+XjflOWuzn09qOzzm2OTdN5Jk7niITSRBUCgvWJ8W04fDyo04XB789815TA+4wm
         nQ9Zj9droBEVZhqHEx6xPJl4mA1kvHbkSRZqVJevD1nSCShgu9iAf3p1iooc234hmJnl
         Vo/M13CO/cTg4BJl/a3OMS72KCNZ8Tw5ZucDSenpn/RX5YZkkKnyKEiIKEzwnVzWotuv
         Qyxg==
X-Forwarded-Encrypted: i=1; AJvYcCV9f5Xf/kWVK+ade/pZZz6ylHMHOexdQygvdTrrP/Vt5wlM7dov5Uc37Ae9W+QvE57jdKKe/K49y1ECdlNf@lists.linux.dev
X-Gm-Message-State: AOJu0YxEzIkKrz4PUA6sVNgjIGz/4sHG1cjqiChu7nEM+ipqneF4MKov
	eq9gfnMKs/kGzCnTqzUvLJFgyOA/GOCq/ERlcjtfSHNi3WY4b2HQysO1
X-Gm-Gg: AY/fxX6MEanP2o7xATfrXrhpgS7mu7BTCoN16tqXWroj922LGPf+NWVFNBgu9WvAamQ
	pwIqewXLIvlbYAyKUK5l7KhojmC64aTAK6V0MPYf8qeeDurvDKbGIw2yFtcfEhSU6Rmx2TNTw3m
	gh3TqWkDo1BZ8gdaJMl5Tq5se6nc8dpWlyxN7EDU3RQl00umLvGxpYo9kk4y0LRw6o66j8M280+
	W8A9jU73H7dE+d/G9wOJ0vd+louaZFQ9dH8LvgUBYiEdMdd9JCnNcK4GjsqgKghZPmZdBTzO0LD
	iWtuNtHkwgg2INOI/8BfcKjchXSKs3m3227cQ7PfTYAzrDuomPh1TYi0gvwuyhHHPl3IBYiFGv4
	C5va9hNEXULEFcAFBfXMm2inbiD0gQZoFyLA2iisWNSRNZzJapjQ17y8A6aw6kgFW1cHxqe4tE4
	9WY3dEjMVneP+mIUE=
X-Received: by 2002:a17:902:ecc5:b0:2a1:3769:1d02 with SMTP id d9443c01a7336-2a7009be24emr27023875ad.12.1768469856248;
        Thu, 15 Jan 2026 01:37:36 -0800 (PST)
Received: from snowman ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48dc1sm244063595ad.40.2026.01.15.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:37:35 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	hansg@kernel.org,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: rename CamelCase identifiers to snake_case
Date: Thu, 15 Jan 2026 15:04:38 +0530
Message-ID: <20260115093439.7588-4-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115093439.7588-1-khushalchitturi@gmail.com>
References: <20260115093439.7588-1-khushalchitturi@gmail.com>
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

nits

tbswpo

tbswpo
---
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


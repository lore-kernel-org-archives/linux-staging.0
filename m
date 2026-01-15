Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA2F361640
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768473006; cv=none; b=Oo4rlAzt02+PjWdmAKGJ5Y1cROMjagD+2Pm2sPQId6EVIG10Rz1rNRlg/TSGMVpGHwF9Q4UieNJXV47lmdvEpzuLxVEUos8AtHK6SthWu6rXeowGbmwv+XT7Uns/OHTnqqECeIsLlpt7aoNBnFBZQ1puZgZxBGliHjXvlIRrqAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768473006; c=relaxed/simple;
	bh=1IfqwLQ8rmNZuSpE064nn95IekKLgbAApgwV0pAE3Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0T4IVxYKvExH0fwLtaxWAU4d2k0uPiAeI/09kph9qe4VfSib6j6WE5LbgYup+wCDpUgzAEhc/E0Zc7buJqjIfBP5Jj+oxYC0XD3+bGSrmKZBR0BTfE0CHZqi9bvjCxLN6gnjHfp2MTG/+yieLmvaqHhtnPBTNSFxxjmqasOhXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hzua4MlX; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hzua4MlX"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso654920b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 02:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768473004; x=1769077804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBWLV/HmQ1dNh+9nZhN+gZEgShfI//0jD6CPugAchBY=;
        b=Hzua4MlX9RkM+nBt0+MCboltKRSZ6PPiaJHppgZd6RguU0kLolg/Zez94yA1xFDu4O
         YQIdfZjUXC1vmKyxpR5CcTMoyThISMf86RsnHn7LdKKCJXWMGAs9vHSEvSAsDHTrNsIM
         h350y5TXTz6Xs02iJUK1lxxMABCOq+4r6fMq/VahESa7U6czZRjpQ5dvR/5xTk5fBnNR
         Rlh/ULgJ97frkPEdH6A3rv4W8QyvfsxP78MD9xmTCu4VIK9h8PLScKm3dRpH2KvC+ujf
         WzxFFdeFV8+xnjFbUGf5wrBDslMOQphcrNasKiw29padFITH1KK0GIEITEbQCg1wWAXJ
         ze8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473004; x=1769077804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XBWLV/HmQ1dNh+9nZhN+gZEgShfI//0jD6CPugAchBY=;
        b=usQM8CMRUIw3nuAL39RKAwoKhIcsc9q7ko/T42izguT/rpe7LCgK1g7QuYjvqIcboP
         Tk1wR4IsNMW3/hrS3uJ5NVSJ6NnJR9u6MlItm4LbH0du985t/7WjUQUs+sxVcefcvMy7
         kEGYtN2WVs0UOxTtgWPZfnOCHdFasikYc5y0ExgxMlQzkgGRiRFu2lb67YhKo22tV+J4
         4PIeL8QPlrAhI/bgcj0LI/2rdKDdlD4YhLzkMQL5nv1RS0fK6NZWi0itDpAG4qyjl/8h
         dbDdvdE0QU+3d8YaLJ4vR2c5KII6HZXQ3RSz9xCS9pLPL5P1102Exb70/REu+9LrlPDO
         iCmA==
X-Forwarded-Encrypted: i=1; AJvYcCUW6jhPRtUEJvqQwaxvCVRfaFNaiK73EaPe+EzjsE+ccuHljmk6SKtZxyu6CYcePTnwiBkJw8XtflmraDZ9@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc0iZlHWd/j7D0/VugJ4wtLUucLn/ZVtddY5iJd8UmRiEcYd5C
	v1FTQz4o00T1lo/+SC1I6rxaTF7gytbQGSZEJcl2rYz8Hg9sxJbse3v7
X-Gm-Gg: AY/fxX6xVkzH1PH/wuKXg/IerO8QMkd8/BAv8hXs3/foHpNWsjHK4pNs0kqmczBaYYs
	xbQ9B5yheSE70zbzd+zbw29xOox9s1cyjMl1E0eAfLvfTeyEK6cFwqJtN0guDyfdB2AukA0VeaZ
	zlnSgaBtOnEcPYZ/524QojoRD/hULepZVKfhhyhcC2URX/v8OJvx8AqhMG1yeHIGeVQNBqPKopG
	hQH0mz/nsyyEzDJAG5CIaEBIk9PWCwiRrHQAkYBOtqQVHIaMHn4Cfldml2DRKkpEaOogtRXGGLW
	MvdxRqfx4Ubyn1xwN9atLkWuRl8OBorW8hS9FgvsdEFShSYJqNx0kr/HIr+gfpmPhRDYTCHhyjd
	Mn6ds8NhxJh97Lubf02rVR4cpHGT7Ufx/CXezbVrgHF2TypfKpIYK6BwcGhVISswBvc9K3f92z3
	xIhfJayPzjmJJeVgQ=
X-Received: by 2002:a05:6a00:2998:b0:81f:3d13:e07e with SMTP id d2e1a72fcca58-81f83d4252emr4812013b3a.41.1768473004458;
        Thu, 15 Jan 2026 02:30:04 -0800 (PST)
Received: from snowman ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4f61fdsm2103488b3a.26.2026.01.15.02.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:30:03 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	hansg@kernel.org,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: rename CamelCase identifiers to snake_case
Date: Thu, 15 Jan 2026 15:59:09 +0530
Message-ID: <20260115102910.10018-4-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115102910.10018-1-khushalchitturi@gmail.com>
References: <20260115102910.10018-1-khushalchitturi@gmail.com>
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


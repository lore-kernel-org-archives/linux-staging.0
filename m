Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D571368;
	Fri,  1 Apr 2022 13:03:18 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id ke15so1916924qvb.11;
        Fri, 01 Apr 2022 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ajcz12srs583Xws3OY/YngwhdPC9ljyQGLcNQQ87rSE=;
        b=QYJuGd0dC75pt9oSmFM1X4UIIrZP7tFZ1XVIEcWDos4uopvpaiHsTYUUXz3UKyXbiA
         VSdTzM9aQz+Ha07rk+IgIIlEPt6yeZcFnq5vfSBT9aA/CTNvlmGRFf8Ke+WxpBvp9U+h
         py9tIIb6NisB4G53nKZLoVIfVIq1TCIL1WsZ69q5SCEAemBKOPo1aZo3Q+5g+j6gbw5K
         VTKqepswROmZgVuRqDzWhKuLTpeT1/pn/ius7C+2rvohokVca7sCR5KeKdidJQkQePIY
         Nv9fhaHDOwy3gTq1Ob2b4wpShSsbp147L2GUtHMaJQ9guxfhcJ1an0/6gAhEhZ1qxrQB
         JRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ajcz12srs583Xws3OY/YngwhdPC9ljyQGLcNQQ87rSE=;
        b=tFAieB/EqinyLYGKCTwpoafbGaUIPIdDz2329zIbfg9tI6DbzXANjdYO749X5aMZXw
         j/oMEMRt31Dqxw0jUmmo01GTw1/Z/afbnnbw2JTlEKemJGbHsOsa9uRWrjO15ANkFRFi
         GFMHboFR3cn7Km3uYJdkZ2V4dPb68lsWs5Lk0xOb85qnENMszMvZSML/Yz/EfGtG292M
         h0zKYRY1N2mDY8OJ4WP7UDhbyNG4JWEA4Lu5VVLCP98dmwFzNhd8bMTIleAtYOrGTDzc
         ApPRLaQ/OX90BbcRe7sCH6hPm7faqmZmL8GcRRSMCz6cgLl+lLcEJsQ4OfX6u+oqNHNh
         OVaw==
X-Gm-Message-State: AOAM531paBSOwND4az+sJVrzBDHxT4UyuxsWGSmCDChAV1f6/GLleGnh
	xnfZp/AGf/OOqaHFHNPRUatf2tmjQOBlW+4H
X-Google-Smtp-Source: ABdhPJy1k8Z/YuhgloaYBt1ZhG1w6bOX1sID+ger8nAbsOQI4dQU5BaR63e3dEpwaZ8+R+PlOQf0bg==
X-Received: by 2002:a0c:b2d7:0:b0:443:afac:fc60 with SMTP id d23-20020a0cb2d7000000b00443afacfc60mr3998650qvf.58.1648818197473;
        Fri, 01 Apr 2022 06:03:17 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id s15-20020a05620a29cf00b00680ca4b3755sm1401321qkp.119.2022.04.01.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 06:03:16 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: place constants on the right side of tests
Date: Fri,  1 Apr 2022 09:02:46 -0400
Message-Id: <822baf7d10d5463bf56cc36b135db603d9c58161.1648817213.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648817213.git.sevinj.aghayeva@gmail.com>
References: <cover.1648817213.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9f328e9a81ff..81e4b1bf68f6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -308,11 +308,11 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 			if (!has_channel(channel_set, chanset_size, ch))
 				continue;
 
-			if ((0 == padapter->registrypriv.ht_enable) && (8 == o->inc))
+			if ((padapter->registrypriv.ht_enable == 0) && (o->inc == 8))
 				continue;
 
-			if ((0 < (padapter->registrypriv.bw_mode & 0xf0)) &&
-				((BW40MINUS == o->bw) || (BW40PLUS == o->bw)))
+			if (((padapter->registrypriv.bw_mode & 0xf0) > 0) &&
+				((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
 				continue;
 
 			if (!reg) {
@@ -342,7 +342,7 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 
 	if (is_supported_24g(padapter->registrypriv.wireless_mode)) {
 		b2_4GBand = true;
-		if (RT_CHANNEL_DOMAIN_REALTEK_DEFINE == ChannelPlan)
+		if (ChannelPlan == RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
 			Index2G = RTW_CHANNEL_PLAN_MAP_REALTEK_DEFINE.Index2G;
 		else
 			Index2G = RTW_ChannelPlanMap[ChannelPlan].Index2G;
@@ -352,14 +352,14 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 		for (index = 0; index < RTW_ChannelPlan2G[Index2G].Len; index++) {
 			channel_set[chanset_size].ChannelNum = RTW_ChannelPlan2G[Index2G].Channel[index];
 
-			if ((RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN == ChannelPlan) ||/* Channel 1~11 is active, and 12~14 is passive */
-				(RT_CHANNEL_DOMAIN_GLOBAL_NULL == ChannelPlan)) {
+			if ((ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) || /* Channel 1~11 is active, and 12~14 is passive */
+				(ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
 				if (channel_set[chanset_size].ChannelNum >= 1 && channel_set[chanset_size].ChannelNum <= 11)
 					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
 				else if ((channel_set[chanset_size].ChannelNum  >= 12 && channel_set[chanset_size].ChannelNum  <= 14))
 					channel_set[chanset_size].ScanType  = SCAN_PASSIVE;
-			} else if (RT_CHANNEL_DOMAIN_WORLD_WIDE_13 == ChannelPlan ||
-				RT_CHANNEL_DOMAIN_2G_WORLD == Index2G) { /*  channel 12~13, passive scan */
+			} else if (ChannelPlan == RT_CHANNEL_DOMAIN_WORLD_WIDE_13 ||
+				Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) { /* channel 12~13, passive scan */
 				if (channel_set[chanset_size].ChannelNum <= 11)
 					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
 				else
@@ -1326,7 +1326,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 	/*  now the station is qualified to join our BSS... */
-	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (WLAN_STATUS_SUCCESS == status)) {
+	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
 		/* 1 bss_cap_update & sta_info_update */
 		bss_cap_update_on_sta_join(padapter, pstat);
 		sta_info_update(padapter, pstat);
@@ -1514,7 +1514,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			(pmlmeinfo->state & WIFI_FW_ASSOC_STATE)) {
 			if (reason == WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA) {
 				ignore_received_deauth = 1;
-			} else if (WLAN_REASON_PREV_AUTH_NOT_VALID == reason) {
+			} else if (reason == WLAN_REASON_PREV_AUTH_NOT_VALID) {
 				/*  TODO: 802.11r */
 				ignore_received_deauth = 1;
 			}
@@ -1525,7 +1525,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			   reason, GetAddr3Ptr(pframe),
 			   ignore_received_deauth);
 
-		if (0 == ignore_received_deauth)
+		if (ignore_received_deauth == 0)
 			receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 	}
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
@@ -3536,13 +3536,13 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 				rtw_hal_get_def_var(padapter,
 						    HW_VAR_MAX_RX_AMPDU_FACTOR, &max_rx_ampdu_factor);
 
-			if (IEEE80211_HT_MAX_AMPDU_64K == max_rx_ampdu_factor)
+			if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_64K)
 				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x1000); /* 64 buffer size */
-			else if (IEEE80211_HT_MAX_AMPDU_32K == max_rx_ampdu_factor)
+			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_32K)
 				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0800); /* 32 buffer size */
-			else if (IEEE80211_HT_MAX_AMPDU_16K == max_rx_ampdu_factor)
+			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_16K)
 				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0400); /* 16 buffer size */
-			else if (IEEE80211_HT_MAX_AMPDU_8K == max_rx_ampdu_factor)
+			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_8K)
 				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0200); /* 8 buffer size */
 			else
 				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x1000); /* 64 buffer size */
@@ -5065,7 +5065,7 @@ void linked_status_chk(struct adapter *padapter)
 			if (pmlmeinfo->FW_sta_info[i].status == 1) {
 				psta = pmlmeinfo->FW_sta_info[i].psta;
 
-				if (NULL == psta)
+				if (psta == NULL)
 					continue;
 
 				if (pmlmeinfo->FW_sta_info[i].rx_pkt == sta_rx_pkts(psta)) {
@@ -6049,7 +6049,7 @@ u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf)
 	struct RunInThread_param *p;
 
 
-	if (NULL == pbuf)
+	if (pbuf == NULL)
 		return H2C_PARAMETERS_ERROR;
 	p = (struct RunInThread_param *)pbuf;
 
-- 
2.25.1


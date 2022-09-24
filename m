Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA6B7B
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 22:03:28 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id nb11so7160352ejc.5
        for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 15:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=2vbRnOhD8TPYnS7wkqyA/FaN1lEvknTEkNYcBwkBWSw=;
        b=lyabth+2ha6CI/abNAc0A4hmmYmtoIj9qZeycWPA6WTN8GPMch3AIIeBePGKAWY3uE
         vYUst9GsmyMzTIwDLv7PdBWHz4Qt+EFDNVwhpN0Qre/vaM9Xu5UxcsOKNRLGNxjUmFj8
         U6F4mDW1fzy2JtzS91Jm9mpBnr0uNH8AXKpAvyWQQcykRsPphCCyvoz+leFzaYuVkmi0
         2ChoaYV7q/JKYjRI49OrgDgdQO9b063QrlAmOtuUgkCZbuwXVpd/NJdGOBZZu7On61PX
         1G/Qi7TpxopspgiquyKl5k7pD4D3B9XVAOOY5LvAzBTFq7bf9FydYiZljs8kx6phqSUO
         JEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2vbRnOhD8TPYnS7wkqyA/FaN1lEvknTEkNYcBwkBWSw=;
        b=APU1Cjn16eFs7vtOjVANCWEq8w/WKlGcNf3Ww+BLe9U5o/F6fXn+MLbZQHtW1g8wmw
         eD6SIYk1sL6jVT8tIhPmXINlS3yTjTHtWHbHjdHP4W0/GiVs2jmDU8jVNQefhBRGGkIm
         oYYrOpuUNyXwfjZw3mVHxKuyFZ+7pnham1gDH+7LRTlPdbW+ADdUw0UUW7DGWFiHHEQf
         sPBgFzdNONs6jcUqpJe9yiwZbtWx8B5H7CrCfLbD7BVcZQ1djdZgZADJGowts5Tg/fDo
         mlCJxS1xf/30le35Dn8COZLLItvAz6EquqJl6CnQLlH+5IlU5QBJwuC/VmTI33HHWbng
         G3xw==
X-Gm-Message-State: ACrzQf2FCkm7dm3aJwC6GIy3+Olg8EIMfmT/smWaDgNTV+YKoidLoZHu
	1pvDUpV3bDHV0N9lGoTEeV4=
X-Google-Smtp-Source: AMsMyM75+lCEo4sIZEtqv3OQJGS+riGN/VQQDAADNF5SBwOIs7cNPV2yiT7jUVqGWs8gqmsNCerDNw==
X-Received: by 2002:a17:907:75e7:b0:77a:2378:91bb with SMTP id jz7-20020a17090775e700b0077a237891bbmr12425293ejc.329.1664057008012;
        Sat, 24 Sep 2022 15:03:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id i21-20020aa7c9d5000000b00452878cba5bsm8114026edt.97.2022.09.24.15.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 15:03:26 -0700 (PDT)
Date: Sun, 25 Sep 2022 00:03:24 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Rename dot11Cur..., bCurTxBW40MHz
 and bCurrentRT2...
Message-ID: <97c4f62da9a98b0ddcdaafae68182e3eb47f9a17.1664055213.git.philipp.g.hortmann@gmail.com>
References: <cover.1664055213.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664055213.git.philipp.g.hortmann@gmail.com>

Rename variable dot11CurrentPreambleMode to dot11_current_preamble_mode,
bCurTxBW40MHz to cur_tx_bw40mhz and bCurrentRT2RTLongSlotTime to
current_rt2rt_long_slot_time to avoid CamelCase which is not accepted
by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 14 +++++++-------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     |  4 ++--
 drivers/staging/rtl8192e/rtl819x_HT.h          |  4 ++--
 drivers/staging/rtl8192e/rtl819x_HTProc.c      | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_tx.c           |  2 +-
 7 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index bd2696cdaccd..7391d7cb7a58 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -822,7 +822,7 @@ static void _rtl92e_net_update(struct net_device *dev)
 
 	net = &priv->rtllib->current_network;
 	rtl92e_config_rate(dev, &rate_config);
-	priv->dot11CurrentPreambleMode = PREAMBLE_AUTO;
+	priv->dot11_current_preamble_mode = PREAMBLE_AUTO;
 	priv->basic_rate = rate_config &= 0x15f;
 	rtl92e_writew(dev, BSSIDR, *(u16 *)net->bssid);
 	rtl92e_writel(dev, BSSIDR + 2, *(u32 *)(net->bssid + 2));
@@ -1998,10 +1998,10 @@ void rtl92e_update_ratr_table(struct net_device *dev)
 		break;
 	}
 	ratr_value &= 0x0FFFFFFF;
-	if (ieee->pHTInfo->bCurTxBW40MHz &&
+	if (ieee->pHTInfo->cur_tx_bw40mhz &&
 	    ieee->pHTInfo->bCurShortGI40MHz)
 		ratr_value |= 0x80000000;
-	else if (!ieee->pHTInfo->bCurTxBW40MHz &&
+	else if (!ieee->pHTInfo->cur_tx_bw40mhz &&
 		  ieee->pHTInfo->bCurShortGI20MHz)
 		ratr_value |= 0x80000000;
 	rtl92e_writel(dev, RATR0+rate_index*4, ratr_value);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 52b25df99642..89bc989cffba 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -287,16 +287,16 @@ static void _rtl92e_update_cap(struct net_device *dev, u16 cap)
 	bool		ShortPreamble;
 
 	if (cap & WLAN_CAPABILITY_SHORT_PREAMBLE) {
-		if (priv->dot11CurrentPreambleMode != PREAMBLE_SHORT) {
+		if (priv->dot11_current_preamble_mode != PREAMBLE_SHORT) {
 			ShortPreamble = true;
-			priv->dot11CurrentPreambleMode = PREAMBLE_SHORT;
+			priv->dot11_current_preamble_mode = PREAMBLE_SHORT;
 			priv->rtllib->SetHwRegHandler(dev, HW_VAR_ACK_PREAMBLE,
 					(unsigned char *)&ShortPreamble);
 		}
 	} else {
-		if (priv->dot11CurrentPreambleMode != PREAMBLE_LONG) {
+		if (priv->dot11_current_preamble_mode != PREAMBLE_LONG) {
 			ShortPreamble = false;
-			priv->dot11CurrentPreambleMode = PREAMBLE_LONG;
+			priv->dot11_current_preamble_mode = PREAMBLE_LONG;
 			priv->rtllib->SetHwRegHandler(dev, HW_VAR_ACK_PREAMBLE,
 					      (unsigned char *)&ShortPreamble);
 		}
@@ -307,7 +307,7 @@ static void _rtl92e_update_cap(struct net_device *dev, u16 cap)
 		u8	cur_slot_time = priv->slot_time;
 
 		if ((cap & WLAN_CAPABILITY_SHORT_SLOT_TIME) &&
-		   (!priv->rtllib->pHTInfo->bCurrentRT2RTLongSlotTime)) {
+		   (!priv->rtllib->pHTInfo->current_rt2rt_long_slot_time)) {
 			if (cur_slot_time != SHORT_SLOT_TIME) {
 				slot_time_val = SHORT_SLOT_TIME;
 				priv->rtllib->SetHwRegHandler(dev,
@@ -341,7 +341,7 @@ static void _rtl92e_update_beacon(void *data)
 
 	if (ieee->pHTInfo->bCurrentHTSupport)
 		HT_update_self_and_peer_setting(ieee, net);
-	ieee->pHTInfo->bCurrentRT2RTLongSlotTime = net->bssht.bd_rt2rt_long_slot_time;
+	ieee->pHTInfo->current_rt2rt_long_slot_time = net->bssht.bd_rt2rt_long_slot_time;
 	ieee->pHTInfo->RT2RT_HT_Mode = net->bssht.rt2rt_ht_mode;
 	_rtl92e_update_cap(dev, net->capability);
 }
@@ -833,7 +833,7 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	u8 i;
 
 	priv->AcmMethod = eAcmWay2_SW;
-	priv->dot11CurrentPreambleMode = PREAMBLE_AUTO;
+	priv->dot11_current_preamble_mode = PREAMBLE_AUTO;
 	priv->rtllib->status = 0;
 	priv->polling_timer_on = 0;
 	priv->up_first_time = 1;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 093887bcd463..7021f9c435d9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -430,7 +430,7 @@ struct r8192_priv {
 
 	u16 basic_rate;
 	u8 short_preamble;
-	u8 dot11CurrentPreambleMode;
+	u8 dot11_current_preamble_mode;
 	u8 slot_time;
 	u16 SifsTime;
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index a4bffc081857..2394faba3940 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -343,9 +343,9 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 
 	if (priv->rtllib->state == RTLLIB_LINKED) {
 
-		bshort_gi_enabled = (pHTInfo->bCurTxBW40MHz &&
+		bshort_gi_enabled = (pHTInfo->cur_tx_bw40mhz &&
 				     pHTInfo->bCurShortGI40MHz) ||
-				    (!pHTInfo->bCurTxBW40MHz &&
+				    (!pHTInfo->cur_tx_bw40mhz &&
 				     pHTInfo->bCurShortGI20MHz);
 
 		pra->upper_rssi_threshold_ratr =
diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index ce13b41074a7..2ab04469ef4b 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -148,7 +148,7 @@ struct rt_hi_throughput {
 	u8				PeerMimoPs;
 
 	enum ht_extchnl_offset CurSTAExtChnlOffset;
-	u8				bCurTxBW40MHz;
+	u8 cur_tx_bw40mhz;
 	u8				PeerBandwidth;
 
 	u8				bSwBwInProgress;
@@ -157,7 +157,7 @@ struct rt_hi_throughput {
 	u8				bRegRT2RTAggregation;
 	u8				RT2RT_HT_Mode;
 	u8				bCurrentRT2RTAggregation;
-	u8				bCurrentRT2RTLongSlotTime;
+	u8 current_rt2rt_long_slot_time;
 	u8				szRT2RTAggBuffer[10];
 
 	u8				bRegRxReorderEnable;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 3b8efaf9b88c..1e1364c56163 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -543,7 +543,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 #endif
 	HTSetConnectBwMode(ieee, (enum ht_channel_width)(pPeerHTCap->ChlWidth),
 			  (enum ht_extchnl_offset)(pPeerHTInfo->ExtChlOffset));
-	pHTInfo->bCurTxBW40MHz = ((pPeerHTInfo->RecommemdedTxWidth == 1) ?
+	pHTInfo->cur_tx_bw40mhz = ((pPeerHTInfo->RecommemdedTxWidth == 1) ?
 				 true : false);
 
 	pHTInfo->bCurShortGI20MHz = ((pHTInfo->bRegShortGI20MHz) ?
@@ -633,7 +633,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->bCurrentHTSupport = false;
 
 	pHTInfo->bCurBW40MHz = false;
-	pHTInfo->bCurTxBW40MHz = false;
+	pHTInfo->cur_tx_bw40mhz = false;
 
 	pHTInfo->bCurShortGI20MHz = false;
 	pHTInfo->bCurShortGI40MHz = false;
@@ -660,7 +660,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->ePeerHTSpecVer = HT_SPEC_VER_IEEE;
 
 	pHTInfo->bCurrentRT2RTAggregation = false;
-	pHTInfo->bCurrentRT2RTLongSlotTime = false;
+	pHTInfo->current_rt2rt_long_slot_time = false;
 	pHTInfo->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 
 	pHTInfo->IOTPeer = 0;
@@ -720,12 +720,12 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		if (pHTInfo->bRegRT2RTAggregation) {
 			pHTInfo->bCurrentRT2RTAggregation =
 				 pNetwork->bssht.bd_rt2rt_aggregation;
-			pHTInfo->bCurrentRT2RTLongSlotTime =
+			pHTInfo->current_rt2rt_long_slot_time =
 				 pNetwork->bssht.bd_rt2rt_long_slot_time;
 			pHTInfo->RT2RT_HT_Mode = pNetwork->bssht.rt2rt_ht_mode;
 		} else {
 			pHTInfo->bCurrentRT2RTAggregation = false;
-			pHTInfo->bCurrentRT2RTLongSlotTime = false;
+			pHTInfo->current_rt2rt_long_slot_time = false;
 			pHTInfo->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 		}
 
@@ -757,7 +757,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 	} else {
 		pHTInfo->bCurrentHTSupport = false;
 		pHTInfo->bCurrentRT2RTAggregation = false;
-		pHTInfo->bCurrentRT2RTLongSlotTime = false;
+		pHTInfo->current_rt2rt_long_slot_time = false;
 		pHTInfo->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 
 		pHTInfo->IOTAction = 0;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 9da83531932f..595f9b92ac83 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -384,7 +384,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 
 	if ((tcb_desc->data_rate & 0x80) == 0)
 		return;
-	if (pHTInfo->bCurBW40MHz && pHTInfo->bCurTxBW40MHz &&
+	if (pHTInfo->bCurBW40MHz && pHTInfo->cur_tx_bw40mhz &&
 	    !ieee->bandwidth_auto_switch.bforced_tx20Mhz)
 		tcb_desc->bPacketBW = true;
 }
-- 
2.37.3


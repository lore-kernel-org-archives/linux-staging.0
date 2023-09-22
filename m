Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F527707
	for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 13:29:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31f7c87353eso233826f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389364; x=1695994164; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBy3wFhLTQf4ZmbkwmQwK7h4Pebz0NJBR2zXKtkevTU=;
        b=LjiAih6NyPr/sChBAXB07idmzLZV+qZwRP/iTnGjwtHrQqhINS+59lFA8JCRRlwnpS
         x6L0diNYWm7QeqYNxOTiXFBXd4c9yjMuR0k7n8DWdeBZCUw4FP1L4FgANb7LagVxGQq4
         cy+tz5739KN3dkVjg2cLOmAEAYMJTvm9TiwEqL46qR+g2Yz7WXdKQ0m0/MTqLoaMJQcP
         LdH6odVg6iFI9KsPU/NaEicveX3u6YPmygV5MxkxFpRxbwNDj99N4VJAsjqsFyW57M16
         leQS8TEmJnRsMGNcua6s/jDItToP/UA7ForkJ8SC/z4auLs9Dqz4xdvgYvLabVyspFUV
         OxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389364; x=1695994164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBy3wFhLTQf4ZmbkwmQwK7h4Pebz0NJBR2zXKtkevTU=;
        b=E57g0vs3CyBAc1sbeB7YpD8J/4zl91yKyKcmQcMOheKb0P5PI7Vm8EZFiAubqcQgqZ
         lQjBsWy3v6BIHQRS5inQDHyZ8Rd8LvKH3Y7Jbhv+nBNE2iB0XvyOg/bphQEa9KASOpY0
         oPDm9AoA3fIOMVuztoZCjL0/WTS2autSWT+0gB2bmrIZGa9iS9OfmtbWeSmUE7JAHNI2
         vtKybOhW1YFB6ES0OChDuoWRMLTTrpb19blNnDcjQpGjQcbmi5KXM07yizB41qZxRj0k
         x9spBrJjvCl/VTK2KU2Uo098ZiszNn2kn/SkUrRonSvOczWzfQyyBODHhqQmR4BJEL4L
         34XQ==
X-Gm-Message-State: AOJu0Yy7pLcThYKlQJyyIccH4+0Ahxqod/JW8d3zPBWwwF/iJCLv7dfe
	dHAkYb7iUluKYa3gOx2VGTtuTqPpubajUg==
X-Google-Smtp-Source: AGHT+IHz3Jcw4j2xB6knYF2ElgaLojpc6W6Uci1Xiqu9UQfofIxUtJ5pWF/iD3wRoPYB5AeaOZH41A==
X-Received: by 2002:adf:f2c3:0:b0:320:8f0:b93d with SMTP id d3-20020adff2c3000000b0032008f0b93dmr7530568wrp.3.1695389363548;
        Fri, 22 Sep 2023 06:29:23 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d66d1000000b0031759e6b43fsm4467639wrw.39.2023.09.22.06.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 06:29:23 -0700 (PDT)
Date: Fri, 22 Sep 2023 15:29:21 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] staging: rtl8192e: Remove mode IW_MODE_ADHOC from
 rtllib_tx.c
Message-ID: <59564ce06fc0a23fd26304b8ecd585abd5ddd82f.1695387832.git.philipp.g.hortmann@gmail.com>
References: <cover.1695387832.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695387832.git.philipp.g.hortmann@gmail.com>

Remove unsupported mode IW_MODE_ADHOC from rtllib_tx.c, rtl819x_TSProc.c,
rtl819x_HTProc.c, r8192E_dev.c

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 20 +-----------
 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 32 +------------------
 drivers/staging/rtl8192e/rtl819x_TSProc.c     | 21 ++++--------
 drivers/staging/rtl8192e/rtllib_tx.c          | 11 +------
 4 files changed, 10 insertions(+), 74 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 95be6fb043dd..fe9f6585266b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -55,10 +55,6 @@ static void _rtl92e_update_msr(struct net_device *dev)
 		if (priv->rtllib->link_state == MAC80211_LINKED)
 			msr |= MSR_LINK_MANAGED;
 		break;
-	case IW_MODE_ADHOC:
-		if (priv->rtllib->link_state == MAC80211_LINKED)
-			msr |= MSR_LINK_ADHOC;
-		break;
 	default:
 		break;
 	}
@@ -706,7 +702,6 @@ static void _rtl92e_net_update(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_network *net;
-	u16 BcnTimeCfg = 0, BcnCW = 6, BcnIFS = 0xf;
 	u16 rate_config = 0;
 
 	net = &priv->rtllib->current_network;
@@ -715,19 +710,6 @@ static void _rtl92e_net_update(struct net_device *dev)
 	priv->basic_rate = rate_config &= 0x15f;
 	rtl92e_writew(dev, BSSIDR, *(u16 *)net->bssid);
 	rtl92e_writel(dev, BSSIDR + 2, *(u32 *)(net->bssid + 2));
-
-	if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
-		rtl92e_writew(dev, ATIMWND, 2);
-		rtl92e_writew(dev, BCN_DMATIME, 256);
-		rtl92e_writew(dev, BCN_INTERVAL, net->beacon_interval);
-		rtl92e_writew(dev, BCN_DRV_EARLY_INT, 10);
-		rtl92e_writeb(dev, BCN_ERR_THRESH, 100);
-
-		BcnTimeCfg |= (BcnCW << BCN_TCFG_CW_SHIFT);
-		BcnTimeCfg |= BcnIFS << BCN_TCFG_IFS;
-
-		rtl92e_writew(dev, BCN_TCFG, BcnTimeCfg);
-	}
 }
 
 void rtl92e_link_change(struct net_device *dev)
@@ -749,7 +731,7 @@ void rtl92e_link_change(struct net_device *dev)
 	}
 	_rtl92e_update_msr(dev);
 
-	if (ieee->iw_mode == IW_MODE_INFRA || ieee->iw_mode == IW_MODE_ADHOC) {
+	if (ieee->iw_mode == IW_MODE_INFRA) {
 		u32 reg;
 
 		reg = rtl92e_readl(dev, RCR);
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index f19feea46158..0f14d9eb4fcd 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -352,7 +352,6 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 void HTConstructInfoElement(struct rtllib_device *ieee, u8 *posHTInfo,
 			    u8 *len, u8 IsEncrypt)
 {
-	struct rt_hi_throughput *pHT = ieee->ht_info;
 	struct ht_info_ele *pHTInfoEle = (struct ht_info_ele *)posHTInfo;
 
 	if (!posHTInfo || !pHTInfoEle) {
@@ -363,32 +362,7 @@ void HTConstructInfoElement(struct rtllib_device *ieee, u8 *posHTInfo,
 	}
 
 	memset(posHTInfo, 0, *len);
-	if (ieee->iw_mode == IW_MODE_ADHOC) {
-		pHTInfoEle->ControlChl	= ieee->current_network.channel;
-		pHTInfoEle->ExtChlOffset = ((!pHT->bRegBW40MHz) ?
-					    HT_EXTCHNL_OFFSET_NO_EXT :
-					    (ieee->current_network.channel <= 6)
-					    ? HT_EXTCHNL_OFFSET_UPPER :
-					    HT_EXTCHNL_OFFSET_LOWER);
-		pHTInfoEle->RecommemdedTxWidth	= pHT->bRegBW40MHz;
-		pHTInfoEle->RIFS			= 0;
-		pHTInfoEle->PSMPAccessOnly		= 0;
-		pHTInfoEle->SrvIntGranularity		= 0;
-		pHTInfoEle->OptMode			= pHT->current_op_mode;
-		pHTInfoEle->NonGFDevPresent		= 0;
-		pHTInfoEle->DualBeacon			= 0;
-		pHTInfoEle->SecondaryBeacon		= 0;
-		pHTInfoEle->LSigTxopProtectFull		= 0;
-		pHTInfoEle->PcoActive			= 0;
-		pHTInfoEle->PcoPhase			= 0;
-
-		memset(pHTInfoEle->BasicMSC, 0, 16);
-
-		*len = 22 + 2;
-
-	} else {
-		*len = 0;
-	}
+	*len = 0;
 }
 
 void HTConstructRT2RTAggElement(struct rtllib_device *ieee, u8 *posRT2RTAgg,
@@ -781,10 +755,6 @@ void HTUseDefaultSetting(struct rtllib_device *ieee)
 		ht_info->bCurShortGI20MHz = ht_info->bRegShortGI20MHz;
 
 		ht_info->bCurShortGI40MHz = ht_info->bRegShortGI40MHz;
-
-		if (ieee->iw_mode == IW_MODE_ADHOC)
-			ieee->current_network.qos_data.active =
-				 ieee->current_network.qos_data.supported;
 		ht_info->bCurrent_AMSDU_Support = ht_info->bAMSDU_Support;
 		ht_info->nCurrent_AMSDU_MaxSize = ht_info->nAMSDU_MaxSize;
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 637e22897803..a482acd5ee06 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -181,21 +181,14 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 	struct list_head *psearch_list;
 	struct ts_common_info *pRet = NULL;
 
-	if (ieee->iw_mode == IW_MODE_ADHOC) {
-		if (TxRxSelect == TX_DIR)
-			search_dir[DIR_UP] = true;
-		else
-			search_dir[DIR_DOWN] = true;
+	if (TxRxSelect == TX_DIR) {
+		search_dir[DIR_UP] = true;
+		search_dir[DIR_BI_DIR] = true;
+		search_dir[DIR_DIRECT] = true;
 	} else {
-		if (TxRxSelect == TX_DIR) {
-			search_dir[DIR_UP] = true;
-			search_dir[DIR_BI_DIR] = true;
-			search_dir[DIR_DIRECT] = true;
-		} else {
-			search_dir[DIR_DOWN] = true;
-			search_dir[DIR_BI_DIR] = true;
-			search_dir[DIR_DIRECT] = true;
-		}
+		search_dir[DIR_DOWN] = true;
+		search_dir[DIR_BI_DIR] = true;
+		search_dir[DIR_DIRECT] = true;
 	}
 
 	if (TxRxSelect == TX_DIR)
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 9b77d6fa7954..bad01599033b 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -482,8 +482,7 @@ static void rtllib_txrate_selectmode(struct rtllib_device *ieee,
 		tcb_desc->tx_use_drv_assinged_rate = true;
 	if (!tcb_desc->tx_dis_rate_fallback ||
 	    !tcb_desc->tx_use_drv_assinged_rate) {
-		if (ieee->iw_mode == IW_MODE_INFRA ||
-		    ieee->iw_mode == IW_MODE_ADHOC)
+		if (ieee->iw_mode == IW_MODE_INFRA)
 			tcb_desc->ratr_index = 0;
 	}
 }
@@ -677,14 +676,6 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 						ieee->current_network.bssid);
 			else
 				ether_addr_copy(header.addr3, dest);
-		} else if (ieee->iw_mode == IW_MODE_ADHOC) {
-			/* not From/To DS: Addr1 = DA, Addr2 = SA,
-			 * Addr3 = BSSID
-			 */
-			ether_addr_copy(header.addr1, dest);
-			ether_addr_copy(header.addr2, src);
-			ether_addr_copy(header.addr3,
-					ieee->current_network.bssid);
 		}
 
 		bIsMulticast = is_multicast_ether_addr(header.addr1);
-- 
2.42.0


Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0536023771
	for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 19:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="eYIzx4zq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so43651185ad.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 11:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1699905170; x=1700509970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WucwCdy1Q+u2Z+QDmzu473Nr1JvUaJp7GWacbD5RC4s=;
        b=eYIzx4zqi2wMhCtQpIzh5Ow7UNizF6QTWwEGB7HDPWRO8ngRkr94lkRD2S+DKuqDIo
         EySNSCK8Kmpl5aN9Rf9z1Q4MSWMVPD/w2BjBTEfB0eKH9s13ah1Yn1v3RvzUMsiLFA82
         miHhkUrxO539hJGVfo+0L4CrMu+QewiFC/HxQi/SE/LwAKs8rkPyur286T55HSRYY3eW
         YSremP/FD7kjGzAk7vWY+zeYdkcMug2+T0qGFg8Zb55yXr53c7lxv2IL5mv3CGo7vJ5k
         jlIMSYnsU9ncHZeoPyKTiDvLGWYFPdglM6dXjKQVOrdilfp/xZr3D2iRIvEajIb/SBzw
         Woqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905170; x=1700509970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WucwCdy1Q+u2Z+QDmzu473Nr1JvUaJp7GWacbD5RC4s=;
        b=Thj3NPcy1xdqfyyU3J/HosvuV5jbVFj6FG7zui9MryPC+ZgDNv7XGnbdVfm+iWKUbz
         jbZUK4XcuQUHyy+8fcSXTcq5VexEBvxl8PYsZgua08Jzajm5eJwEwk7hqmHQX5ody/Jt
         eZNur9KHsybbQpBjGUyPDj8EL9P9S8+AEvucvc5s5AGjIVpW8k391CzILBGo6/rZtssE
         CW6FQbZQdNMclppIqnkYpl/YzTD4yz/T/BMpKOKIP3/D5MqqYlc+OLRUyzbRVT6yDjFg
         8/hD3tRKrmgMWyXhnN7afcWLuycSTfZRLT8Esh1ko0q+OB3TpuR/iSgYAtrsL9Gq9G4C
         F0kQ==
X-Gm-Message-State: AOJu0YwUokSSjtkB/oyBO0xViGd7B7Snq71kJNEf3QHkQDbfp14FveOa
	IyaIKMz2OSJMKKpnV0GFL2g7TaGw6YO6XvirQXs=
X-Google-Smtp-Source: AGHT+IHaUdk0lhuac32EQF51jqgQqIEp6KnVDKw63AB4vIXToTcSQY1ITTbQVc0FZgozujJCI0tOhQ==
X-Received: by 2002:a17:902:f7cf:b0:1cc:3bd3:73d8 with SMTP id h15-20020a170902f7cf00b001cc3bd373d8mr173983plw.59.1699905170326;
        Mon, 13 Nov 2023 11:52:50 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001c9d968563csm4395815plz.79.2023.11.13.11.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:52:49 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/7] Staging: rtl8192e: Rename variable bCurrentAMPDUEnable
Date: Mon, 13 Nov 2023 11:59:05 -0800
Message-ID: <20231113195910.8423-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113195910.8423-1-tdavies@darkphysics.net>
References: <20231113195910.8423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bCurrentAMPDUEnable to current_ampdu_enable to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 4 ++--
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
 drivers/staging/rtl8192e/rtllib_tx.c      | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index c0058d2be6d1..404f873455fc 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -327,12 +327,12 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 
 	if (!ieee->current_network.qos_data.active ||
 	    !ieee->ht_info->current_ht_support ||
-	    !ieee->ht_info->bCurrentAMPDUEnable) {
+	    !ieee->ht_info->current_ampdu_enable) {
 		netdev_warn(ieee->dev,
 			    "reject to ADDBA_RSP as some capability is not ready(%d, %d, %d)\n",
 			    ieee->current_network.qos_data.active,
 			    ieee->ht_info->current_ht_support,
-			    ieee->ht_info->bCurrentAMPDUEnable);
+			    ieee->ht_info->current_ampdu_enable);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
 		goto OnADDBARsp_Reject;
 	}
diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index f8eb4d553fe0..a4fe72943b36 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -112,7 +112,7 @@ struct rt_hi_throughput {
 	u8 bCurrent_AMSDU_Support;
 	u16 nCurrent_AMSDU_MaxSize;
 	u8 bAMPDUEnable;
-	u8 bCurrentAMPDUEnable;
+	u8 current_ampdu_enable;
 	u8 AMPDU_Factor;
 	u8 CurrentAMPDUFactor;
 	u8 MPDU_Density;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index e607bccc079a..d5520cc82d22 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -514,12 +514,12 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	else
 		ht_info->nCurrent_AMSDU_MaxSize = ht_info->nAMSDU_MaxSize;
 
-	ht_info->bCurrentAMPDUEnable = ht_info->bAMPDUEnable;
+	ht_info->current_ampdu_enable = ht_info->bAMPDUEnable;
 	if (ieee->rtllib_ap_sec_type &&
 	    (ieee->rtllib_ap_sec_type(ieee) & (SEC_ALG_WEP | SEC_ALG_TKIP))) {
 		if ((ht_info->IOTPeer == HT_IOT_PEER_ATHEROS) ||
 		    (ht_info->IOTPeer == HT_IOT_PEER_UNKNOWN))
-			ht_info->bCurrentAMPDUEnable = false;
+			ht_info->current_ampdu_enable = false;
 	}
 
 	if (!ht_info->reg_rt2rt_aggregation) {
@@ -544,7 +544,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	ht_info->current_mpdu_density = max_t(u8, ht_info->MPDU_Density,
 					      pPeerHTCap->MPDUDensity);
 	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
-		ht_info->bCurrentAMPDUEnable = false;
+		ht_info->current_ampdu_enable = false;
 		ht_info->ForcedAMSDUMode = HT_AGG_FORCE_ENABLE;
 	}
 	ht_info->cur_rx_reorder_enable = ht_info->reg_rx_reorder_enable;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 9bf679438ad1..a99c3b3f867c 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -288,7 +288,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 
 	if (!ieee->GetNmodeSupportBySecCfg(ieee->dev))
 		return;
-	if (ht_info->bCurrentAMPDUEnable) {
+	if (ht_info->current_ampdu_enable) {
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)(&pTxTs), hdr->addr1,
 			   skb->priority, TX_DIR, true)) {
 			netdev_info(ieee->dev, "%s: can't get TS\n", __func__);
-- 
2.39.2


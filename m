Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A825B5D0
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308313; cv=none; b=t3EP6DMign6hKRY/KnqgEVxaoMlTfMuVjxUlx1ySbex1V4oD3McYL66FzxNpF9JsKalNVxYRS1RwZzUS2ybiJhIsOMSnYHRrKpVqsOLLL8t6k2yKe6e/CJomxsNANNfW/kGhzeNHOvkGEx4pyOO1tjRpozBb07EqQRHjul9jXtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308313; c=relaxed/simple;
	bh=WJNm6B/bx20WS5CTxEEaZHp1YFtjt5JPCFFa10n1LUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IUNauMIFdLDyDbOBHDh/t5Gr2gf8CX2Y8tBU2Kr3bPLLsyYycS3B9fRTdFHGcVDghurTMs1xfx3lP7iJwpRbBwkLX7dam8PK9ftDIjORbh9+mgk7Cc9/Uvx5lTryCzc/xT9WZGKUCBZNLWjIXRf3W07gvXEuJ8eUEJlFonctCL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=HuJ3kdEQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="HuJ3kdEQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d73066880eso8052245ad.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308311; x=1706913111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVgEhtphK9iV5cf+xa25OpN0r057+yWIzXZirMDgj6M=;
        b=HuJ3kdEQJZ5Fgj8lKkwokHh0zDfQ4mmFJB2dsbzE2dnfhttr9X7cdFvOzibHCX1LCM
         xiwRLmbeQDxsOcQ/yumDip3SFCtwbArBkR5bmbndvckSB2/TILFshsydHvqt9i8XEpLL
         dbLoh91g+8mG63CYpnNDuEt2jwGd6nLcJ58iPFNrVun/ymHEfdRbxe3Wj9BvdAdrmBzG
         ZRpGQkEpqXu5CPkA5i4EumGUlywjNWy7dNKBSyaja5Rxir/aT0bY0oEOSOzpImsBdwOT
         +w12O0rzYppPYh/5Cmb7JDvdc1Rt0bha5LkcYPtI3iF6SQOrUA6ML/ecRREsL7l7imNO
         2FHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308311; x=1706913111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVgEhtphK9iV5cf+xa25OpN0r057+yWIzXZirMDgj6M=;
        b=FXqVObYfGxtNaZe7vv/xLPoR6Bevv32Z2bfj8D9IX4Aw8Mn7lfsKIb6HVF80SFssix
         5llRbJPX17zK8Og0grSXH4KkMbdzdXYzv7ssEZ4KU6Hp7CBvSyH+7r7RQ9lsvTIMWV2u
         f0f/3TsF3nscP0xrULAjxjQkS/iHRR4/inrkkj9MOqiUTwbQ688rG5fbLflIXxXyEbdI
         zD6KXQp1NtNSE5vMH0FVPmn+y4oYLilKgbfsFN5jLNAvVsShPLDIEx1cqyd89wmQxM+o
         znasFvNc7O3U/ajapAKuZehXhyLXWDmJFrKeiw1Wnw55sjJDdnoJQSF7ySf5JqCHq55G
         Vpxw==
X-Gm-Message-State: AOJu0YzZHvWzxNOQsUeI9k40ERK5VaOI/44IRlwKPKqwOdJX0Xe4t7Bo
	p12HrtQ49rYatTLEPc4rtJzNV+A+2F8/SvpoxegvoUV7F4rn/A6Br8Ag8oof9Io=
X-Google-Smtp-Source: AGHT+IHR0XhV7qeEWAZ8HGT9yky5/dKnOALYspJxXUcsQLuf7T2uVc/wEKi+eP+diY/HE5da84nnvQ==
X-Received: by 2002:a17:902:bb86:b0:1d7:587f:3748 with SMTP id m6-20020a170902bb8600b001d7587f3748mr493743pls.63.1706308311410;
        Fri, 26 Jan 2024 14:31:51 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:51 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 17/18] Staging: rtl8192e: Rename variable NumRecvBcnInPeriod
Date: Fri, 26 Jan 2024 14:31:05 -0800
Message-Id: <20240126223106.986093-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable NumRecvBcnInPeriod to num_recv_bcn_in_period to fix 
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Update commit message.
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 6 +++---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 79e66b726b28..cda00efed227 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -924,7 +924,7 @@ static void _rtl92e_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
 	slot_index = (priv->rtllib->link_detect_info.slot_index++) %
 			(priv->rtllib->link_detect_info.slot_num);
 	priv->rtllib->link_detect_info.RxBcnNum[slot_index] =
-			priv->rtllib->link_detect_info.NumRecvBcnInPeriod;
+			priv->rtllib->link_detect_info.num_recv_bcn_in_period;
 	priv->rtllib->link_detect_info.RxDataNum[slot_index] =
 			priv->rtllib->link_detect_info.NumRecvDataInPeriod;
 	for (i = 0; i < priv->rtllib->link_detect_info.slot_num; i++) {
@@ -1046,7 +1046,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 
 			priv->check_roaming_cnt = 0;
 		}
-		ieee->link_detect_info.NumRecvBcnInPeriod = 0;
+		ieee->link_detect_info.num_recv_bcn_in_period = 0;
 		ieee->link_detect_info.NumRecvDataInPeriod = 0;
 	}
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0ca38ca4d3af..07a89d1af86d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1110,7 +1110,7 @@ enum scan_op_backup_opt {
 
 #define RT_MAX_LD_SLOT_NUM	10
 struct rt_link_detect {
-	u32				NumRecvBcnInPeriod;
+	u32				num_recv_bcn_in_period;
 	u32				NumRecvDataInPeriod;
 
 	u32				RxBcnNum[RT_MAX_LD_SLOT_NUM];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index f777febcfe3b..e6be6dbe2bb5 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2470,7 +2470,7 @@ static inline void rtllib_process_probe_response(
 		}
 		if (ieee80211_is_beacon(frame_ctl)) {
 			if (ieee->link_state >= MAC80211_LINKED)
-				ieee->link_detect_info.NumRecvBcnInPeriod++;
+				ieee->link_detect_info.num_recv_bcn_in_period++;
 		}
 	}
 	list_for_each_entry(target, &ieee->network_list, list) {
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index a7e7a0b0214f..ba35714f83af 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1074,9 +1074,9 @@ static void rtllib_associate_complete_wq(void *data)
 	ieee->link_detect_info.slot_num = 2 * (1 +
 				       ieee->current_network.beacon_interval /
 				       500);
-	if (ieee->link_detect_info.NumRecvBcnInPeriod == 0 ||
+	if (ieee->link_detect_info.num_recv_bcn_in_period == 0 ||
 	    ieee->link_detect_info.NumRecvDataInPeriod == 0) {
-		ieee->link_detect_info.NumRecvBcnInPeriod = 1;
+		ieee->link_detect_info.num_recv_bcn_in_period = 1;
 		ieee->link_detect_info.NumRecvDataInPeriod = 1;
 	}
 	psc->lps_idle_count = 0;
@@ -2070,7 +2070,7 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 
 	ieee->link_detect_info.slot_index = 0;
 	ieee->link_detect_info.slot_num = 2;
-	ieee->link_detect_info.NumRecvBcnInPeriod = 0;
+	ieee->link_detect_info.num_recv_bcn_in_period = 0;
 	ieee->link_detect_info.NumRecvDataInPeriod = 0;
 	ieee->link_detect_info.num_tx_ok_in_period = 0;
 	ieee->link_detect_info.num_rx_ok_in_period = 0;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 2afa701e5445..4102c2d4f8dd 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -347,9 +347,9 @@ void rtllib_wx_sync_scan_wq(void *data)
 	/* Notify AP that I wake up again */
 	rtllib_sta_ps_send_null_frame(ieee, 0);
 
-	if (ieee->link_detect_info.NumRecvBcnInPeriod == 0 ||
+	if (ieee->link_detect_info.num_recv_bcn_in_period == 0 ||
 	    ieee->link_detect_info.NumRecvDataInPeriod == 0) {
-		ieee->link_detect_info.NumRecvBcnInPeriod = 1;
+		ieee->link_detect_info.num_recv_bcn_in_period = 1;
 		ieee->link_detect_info.NumRecvDataInPeriod = 1;
 	}
 	rtllib_wake_all_queues(ieee);
-- 
2.39.2


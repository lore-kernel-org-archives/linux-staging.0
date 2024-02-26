Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF6318EA1
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919791; cv=none; b=Jjg7hKtHg1QEo/oW3NIx+tMHld0dYzwXUC4LdV6LMj/lekJe2DQzPQ01z0pGmEx9NWUc+GPa4ydzr6I2b2xqPLLQH0AsBQfxpwOD0/Vgc3R6gSyNd5IRxEmYqxxHVLnvifpAe71Nj7oPALD75QAjBZ1LXHW+75eMyXNpaR2uY3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919791; c=relaxed/simple;
	bh=pzH9HqSMT5M9UesCTtzFnLTUTA76A1sP0BVGraKoTck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pglXbdh//RZDNK/jgbhRhVgB+C5LM4f3dNeAfHRP//DoAw7rqPkF7GO9sEbL+Wh5kwpw2ZXxORDfp/strfLn2CL3sBNcA1Bwc0yg9SgJ+zDwe1g4/20wTck/xoG7RQ2d9h8tLqqSf2EaVqwItRItlzTzui0c7zbUXQ9ihEuCfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=jjLjaKlm; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jjLjaKlm"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c1a1e1e539so561158b6e.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919789; x=1709524589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiaCZSKfIdq/o1MVm4/hTAeaIfrde7dAuZNqcPv3/F8=;
        b=jjLjaKlmfq0v/+TsWBKOvzbx4URHvzW6VROM2At2qVH6EJNOFdh92eMmOmm1tKCL73
         4nY9UBGt3z6ei/NOE48ZN22e3u9bKUiqbOT1PEZYtUXmmUteCyMQiUX4ZiEGSjzDdIae
         PCAI0Mksp5T+3hLj0iTHN4YMjnlIqIYERo0SqWreW9SjygP/4BnaSJoCxZKgWYulr7fK
         kaFYClLqkkVUiXyb4GMp+BEBe/vQc5K4/wRjUao4g+YBNLuDDDmZw2PGB0ttrk62YreG
         QySWEUDLmGCP3pUygsqTrW2d0ICnKq046VfBQxK1I+XijdosNoJc9XDKEiak26I4Ot2s
         F9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919789; x=1709524589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiaCZSKfIdq/o1MVm4/hTAeaIfrde7dAuZNqcPv3/F8=;
        b=MqkCQT2ODsWBbDyPR0p4ED6PgCr/xKajL/3LGAOSSVkiWBY+zecuhE5Ky2muP3IhJZ
         qmJU58BGX2WdaaENsTezSjrsex1p9J3jgOciUuxIgac+8QmCvS5cUDMXvnFhzHWcOxuF
         mkNkW2RcpPhOq2c2LHkfBVYZtzO/I6Be5wpVfDxyGgC/ze7Upze/g1tR7Ubvdizmkswe
         hWik+dAI7Id8DXseTSvWOhO/m2CjwKkr7qzlT8WHmTJPzI8YYwIx2Fxww1ZWtJGjQH/e
         A5wVglvxim+6c1SZG9SgsNVh/BEtn4V9PXVKsxAIbUIR6kxIrbZLeqRUcqPmspvZfyZW
         aTQQ==
X-Gm-Message-State: AOJu0Yw3n01V57wrzM6Bn8PY0XUEfx/Q9+HOKPMpTDJa8ItaqZNh47Ur
	kWLOTUc+lmQ2mjIVgS+G7rT8bESZh2svrjAJax32vKwpfO5hVCWOOp0Wi+WWmts=
X-Google-Smtp-Source: AGHT+IHQxkS7aeppkcf4X/ywnhL+VN+NAboDFTdm6tOjhLdgj9x+nwYmd6wwtg0N68HFMOEG5QS9vA==
X-Received: by 2002:a05:6808:14c6:b0:3c1:92e5:2a3 with SMTP id f6-20020a05680814c600b003c192e502a3mr7571893oiw.14.1708919789235;
        Sun, 25 Feb 2024 19:56:29 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:28 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/20] Staging: rtl8192e: Rename variable NumRecvDataInPeriod
Date: Sun, 25 Feb 2024 19:56:06 -0800
Message-Id: <20240226035624.370443-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable NumRecvDataInPeriod to num_recv_data_in_period to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 6 +++---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 705b94f0911e..f99cc5b639fe 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -925,7 +925,7 @@ static void _rtl92e_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
 	priv->rtllib->link_detect_info.RxBcnNum[slot_index] =
 			priv->rtllib->link_detect_info.num_recv_bcn_in_period;
 	priv->rtllib->link_detect_info.RxDataNum[slot_index] =
-			priv->rtllib->link_detect_info.NumRecvDataInPeriod;
+			priv->rtllib->link_detect_info.num_recv_data_in_period;
 	for (i = 0; i < priv->rtllib->link_detect_info.slot_num; i++) {
 		*TotalRxBcnNum += priv->rtllib->link_detect_info.RxBcnNum[i];
 		*TotalRxDataNum += priv->rtllib->link_detect_info.RxDataNum[i];
@@ -1045,7 +1045,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 			priv->check_roaming_cnt = 0;
 		}
 		ieee->link_detect_info.num_recv_bcn_in_period = 0;
-		ieee->link_detect_info.NumRecvDataInPeriod = 0;
+		ieee->link_detect_info.num_recv_data_in_period = 0;
 	}
 
 	spin_lock_irqsave(&priv->tx_lock, flags);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 95a8e9416f61..30b9178071ae 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1111,7 +1111,7 @@ enum scan_op_backup_opt {
 #define RT_MAX_LD_SLOT_NUM	10
 struct rt_link_detect {
 	u32				num_recv_bcn_in_period;
-	u32				NumRecvDataInPeriod;
+	u32				num_recv_data_in_period;
 
 	u32				RxBcnNum[RT_MAX_LD_SLOT_NUM];
 	u32				RxDataNum[RT_MAX_LD_SLOT_NUM];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 29bdaff4cbab..526d5969399c 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1283,7 +1283,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	/* Filter WAPI DATA Frame */
 
 	/* Update statstics for AP roaming */
-	ieee->link_detect_info.NumRecvDataInPeriod++;
+	ieee->link_detect_info.num_recv_data_in_period++;
 	ieee->link_detect_info.num_rx_ok_in_period++;
 
 	/* Data frame - extract src/dst addresses */
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index f12ee685e989..83f337e27209 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1075,9 +1075,9 @@ static void rtllib_associate_complete_wq(void *data)
 				       ieee->current_network.beacon_interval /
 				       500);
 	if (ieee->link_detect_info.num_recv_bcn_in_period == 0 ||
-	    ieee->link_detect_info.NumRecvDataInPeriod == 0) {
+	    ieee->link_detect_info.num_recv_data_in_period == 0) {
 		ieee->link_detect_info.num_recv_bcn_in_period = 1;
-		ieee->link_detect_info.NumRecvDataInPeriod = 1;
+		ieee->link_detect_info.num_recv_data_in_period = 1;
 	}
 	psc->lps_idle_count = 0;
 	ieee->link_change(ieee->dev);
@@ -2071,7 +2071,7 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 	ieee->link_detect_info.slot_index = 0;
 	ieee->link_detect_info.slot_num = 2;
 	ieee->link_detect_info.num_recv_bcn_in_period = 0;
-	ieee->link_detect_info.NumRecvDataInPeriod = 0;
+	ieee->link_detect_info.num_recv_data_in_period = 0;
 	ieee->link_detect_info.num_tx_ok_in_period = 0;
 	ieee->link_detect_info.num_rx_ok_in_period = 0;
 	ieee->link_detect_info.num_rx_unicast_ok_in_period = 0;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 4102c2d4f8dd..d6bc74ba9092 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -348,9 +348,9 @@ void rtllib_wx_sync_scan_wq(void *data)
 	rtllib_sta_ps_send_null_frame(ieee, 0);
 
 	if (ieee->link_detect_info.num_recv_bcn_in_period == 0 ||
-	    ieee->link_detect_info.NumRecvDataInPeriod == 0) {
+	    ieee->link_detect_info.num_recv_data_in_period == 0) {
 		ieee->link_detect_info.num_recv_bcn_in_period = 1;
-		ieee->link_detect_info.NumRecvDataInPeriod = 1;
+		ieee->link_detect_info.num_recv_data_in_period = 1;
 	}
 	rtllib_wake_all_queues(ieee);
 
-- 
2.39.2


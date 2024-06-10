Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC7E200C7
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998545; cv=none; b=kij0+G2PvEwE9iE6st0MQ61h8eKdKj/u7VMQfAi3+9wM96ZlZeKAm5faMo5A6XByp7pRfsE5d17DkJaEaqapRGGOZWFV/JObv2wC1NBAM5IatYuOW+lgyQ7/6cRRhMdJBprks8Fv4/Xd0EAFYVAngXxxbImy8aXmq05bKnrNzug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998545; c=relaxed/simple;
	bh=9ezrWzEojwBQEXYTHUn/K2S7rUCtz6F09IAoOdkYusU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eUfESjSnuib9+/4GH6hQf5Zd7zGJfPEAfR9WGWoswvGOPUouxoTfmhgkGHX0yqZj7O2rKfOLi70idMth4knSsvHc1IBQ9nVMh4Quj9q+c/2eCy1Olb6ugxbiqeEBM/nM50qznXPETOA6+zf07wJpIrNWnerrIJcucfAfp5LXGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Ki1d8RRv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ki1d8RRv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f717b3f2d8so2450495ad.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998543; x=1718603343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lk2mkD39Mo8YtITxE0/jQsIKJ8nqnR0iRRO9PVvlVY=;
        b=Ki1d8RRvGKGQg41ZyMESmrGViRNPd/uIp1HeDXcc81u0XFLytZ9AlpTXfrhdi/WGwQ
         NsQNuYaj+lzT7/dICMjugWzcR0KcIKVzMolEidAFL112YaZK1k+7PQOYjKcAph5OTZdD
         baAfwCwwHs/wbKwp7AZcJ/SlBs8b5SYeOtBzkYQzknDCpqWZiaQIYoeN4cJ98WhUZ6gB
         KUlU9Yzf30aufDoT1ByQ2X+7GBxPYvOhOrIxklESaiLUc5l1c7IeK0JP5llj19wma/Kw
         U8lqoFq8Nxe559h4deDk+sXX4QlXeYR/swx3nldCF1ymXb45eISutGlSNwEXxADH1y66
         8RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998543; x=1718603343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lk2mkD39Mo8YtITxE0/jQsIKJ8nqnR0iRRO9PVvlVY=;
        b=vpQcEzliGCYNNuHEB7wFmE95gEwDfVjSIfcDv54N5eT2w+92kxf0/+wTZFZpWd3pnf
         +uXEgq+O2varKAbZic7UDEXR+bg7XAHlVCzNziyTb/ziU/1v1kVEXoC9Ve6dQFDiL07J
         Q+GPDrONYtyfY6OXKzs7oW9arLb7FMguKQXZ58L8eL2BYubgfLPMWyed70d17w6eNffA
         0zC8Zz8ES4DN5oLu8ZA6pLLUactpvNmpEofnZOwqX/EhJKgxNd30dPqx+IAhQ9yFHJ7W
         XU4qgoNxBBsphivhYWj2TBlNZGhNr3+hJJXfQ3FyCwakYGOnDenUkOhoCWNHqKxlW9qr
         GwTw==
X-Gm-Message-State: AOJu0YxCHSxVu5Ak95kJ+IobDZMLaNRRoULtJmqYmPclgCHlwo8y4CE4
	vS5MA7z61FyxVOH2M1Vg4J/cMu7fCgYmg0DpQ8WMzPrKKpkVJZMFlVvK3JsxL3Y=
X-Google-Smtp-Source: AGHT+IF81VbRcYHeM6763NPd2q8gwSGJtgesW+eAKOUDO8vP8Lq86Pff/cFbzho7h1U1VK3nM3ZTPA==
X-Received: by 2002:a17:902:d4c3:b0:1f6:3a73:1eac with SMTP id d9443c01a7336-1f6d0151b30mr120286635ad.17.1717998542981;
        Sun, 09 Jun 2024 22:49:02 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:02 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/24] Staging: rtl8192e: Rename variable bCTSEnable
Date: Sun,  9 Jun 2024 22:44:32 -0700
Message-Id: <20240610054449.71316-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bCTSEnable to cts_enable
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  2 +-
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 0263f3d7179c..4117530f19b1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -893,7 +893,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 	}
 
 	pTxFwInfo->RtsEnable =	(cb_desc->rts_enable) ? 1 : 0;
-	pTxFwInfo->CtsEnable = (cb_desc->bCTSEnable) ? 1 : 0;
+	pTxFwInfo->CtsEnable = (cb_desc->cts_enable) ? 1 : 0;
 	pTxFwInfo->RtsSTBC = (cb_desc->bRTSSTBC) ? 1 : 0;
 	pTxFwInfo->RtsHT = (cb_desc->rts_rate & 0x80) ? 1 : 0;
 	pTxFwInfo->RtsRate = _rtl92e_rate_mgn_to_hw(cb_desc->rts_rate);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0131765e451e..2282c709654d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -110,7 +110,7 @@ struct cb_desc {
 	u8 nStuckCount;
 
 	/* Tx Firmware Related flags (10-11)*/
-	u8 bCTSEnable:1;
+	u8 cts_enable:1;
 	u8 rts_enable:1;
 	u8 bUseShortGI:1;
 	u8 bUseShortPreamble:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 8c9072538688..c0fe00d0df02 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -374,7 +374,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 
 	tcb_desc->bRTSSTBC			= false;
 	tcb_desc->bRTSUseShortGI		= false;
-	tcb_desc->bCTSEnable			= false;
+	tcb_desc->cts_enable			= false;
 	tcb_desc->RTSSC				= 0;
 	tcb_desc->rts_bw			= false;
 
@@ -390,7 +390,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 			tcb_desc->rts_rate = MGN_24M;
 		} else if (ieee->current_network.buseprotection) {
 			tcb_desc->rts_enable = true;
-			tcb_desc->bCTSEnable = true;
+			tcb_desc->cts_enable = true;
 			tcb_desc->rts_rate = MGN_24M;
 		}
 		return;
@@ -400,7 +400,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 
 	while (true) {
 		if (ht_info->iot_action & HT_IOT_ACT_FORCED_CTS2SELF) {
-			tcb_desc->bCTSEnable	= true;
+			tcb_desc->cts_enable	= true;
 			tcb_desc->rts_rate  =	MGN_24M;
 			tcb_desc->rts_enable = true;
 			break;
@@ -412,7 +412,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 		}
 		if (ieee->current_network.buseprotection) {
 			tcb_desc->rts_enable = true;
-			tcb_desc->bCTSEnable = true;
+			tcb_desc->cts_enable = true;
 			tcb_desc->rts_rate = MGN_24M;
 			break;
 		}
@@ -444,7 +444,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	return;
 NO_PROTECTION:
 	tcb_desc->rts_enable	= false;
-	tcb_desc->bCTSEnable	= false;
+	tcb_desc->cts_enable	= false;
 	tcb_desc->rts_rate	= 0;
 	tcb_desc->RTSSC		= 0;
 	tcb_desc->rts_bw	= false;
-- 
2.30.2


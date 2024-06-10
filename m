Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44F03CF51
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998547; cv=none; b=qNM7KT0jw7gW6JD8VwI4PBGvczBGwgRPJhOZIY54wEkdAoa78LU3XcwmRUh7bhxCP1CyuICBnFQo0ueE2FP2Iz8BdeVoUDeNlFihk/o7qeC0wamOAHF0tYWjpmg+NJxtt7EycwSml2zkfZpZ/LeyeBLvRdi8VNclXP+Z3S1gSgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998547; c=relaxed/simple;
	bh=Q8sycNIBmISu4V8VNPWwVK1OzmjNF6dZvBmnPNg4xwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pn3EXOM28LW8bLGyh2eqBOLg833g1o9rVuJ93+8rsi5pg6K6iFtqGx4nqLG2qz25ajg0SHMNJQKzHfiFM3BnfIaCwkBB2lPCftUIM59PsI4+5mZWXxU8Me113G3Befjw5ouYZFuOdoLaiqgvSsCzNribeyCAwulE+Ji4v1JHvoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FWgI6Xjp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FWgI6Xjp"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f44b441b08so30691315ad.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998545; x=1718603345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffNLik5BpVMPcX0GZgSkdJYQV3xGsiuU5zDpo0EWA6Q=;
        b=FWgI6XjpQhObRcuNFqxVKNY/oX+TznMQ4nJF5UynJafaSIBlwQfsjekPBR8Q34PA/w
         nSQ+7VPKuzaLEjb4PeQImFhYIaET1C47Bi+ETGoCvrnFFCZcBGY5R5emgz8RS8SN/JaT
         gU7JvMAcJFOUylvKxSdzZtwJBTtPoPta5poq8zaouM7BAb1G75wssD+kSmfYdtXmcr+K
         aChDanKSJcfWDOb2tAGBSmMfiznMGdWIarujSVTDvQ0OqaH05ZG2s1JKveuDuuJ51DAE
         GqfUAYHiBbexlGn0an12T6RcPo5QV/+pivOATHyJaekLCgIwE2eLIOqiX/mN1UCoJEaz
         R+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998545; x=1718603345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffNLik5BpVMPcX0GZgSkdJYQV3xGsiuU5zDpo0EWA6Q=;
        b=imuMwZB6rKpq8LcKr9SHBtOGmnOEa/kLSr2dRwEVubZ+2Z1CtitCVpoAr2CDampgBb
         IjW/lCnHxxVnbR2vFtzL/7FOFyAFq3FeYLtVuh52FeUDQFvSMMsL1rhzbSf3N6bC8qPV
         vYsxHCSKJhToTFqofq1A/tYy3fEKBzQb4vg6zuF5oLCvf4f+rRhyG1NiFret0WrmffK9
         bArba7DYJlPLpPhpBx4+INxXEMZhESdOdyc+3au/rTmwnzHP8Gr45q23swrT8kTprCgC
         DUGJXTWaj9eAMUb8jzIqhr44+K3sfxlBYPAZz9Kh7QI5Ae0jZvc5in3fXQIALU+KjjCd
         83vw==
X-Gm-Message-State: AOJu0YztqtkUgSjZprs2uGNC4hrwEJMYNBhyc8OiPUd8P2/3SsFrqviy
	4tAZiengsG2xfYOuM670dPkmYRPPC4Kk0EmBApFb4aH14xooZKCW8FYGIok5ZWs=
X-Google-Smtp-Source: AGHT+IFvBvoS/jhXBvQ7ZuGZJx0k572KWDX5cPtXs3TgNg/vmPxGHvNsKYrytxNPlrLEGAvVQ1BqFg==
X-Received: by 2002:a17:902:e751:b0:1f6:7df5:7c07 with SMTP id d9443c01a7336-1f6d0301d47mr96767995ad.39.1717998545292;
        Sun, 09 Jun 2024 22:49:05 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:04 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/24] Staging: rtl8192e: Rename variable bPacketBW
Date: Sun,  9 Jun 2024 22:44:35 -0700
Message-Id: <20240610054449.71316-11-tdavies@darkphysics.net>
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

Rename variable bPacketBW to packet_bw
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index a52db6b1fdb5..8dec4e1b89b8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -903,7 +903,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 			  (cb_desc->rts_use_short_preamble ? 1 : 0) :
 			  (cb_desc->rts_use_short_gi ? 1 : 0);
 	if (priv->current_chnl_bw == HT_CHANNEL_WIDTH_20_40) {
-		if (cb_desc->bPacketBW) {
+		if (cb_desc->packet_bw) {
 			pTxFwInfo->TxBandwidth = 1;
 			pTxFwInfo->TxSubCarrier = 0;
 		} else {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d0da16a86633..7a5accd86809 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -120,7 +120,7 @@ struct cb_desc {
 	u8 RTSSC:1;
 
 	u8 rts_bw:1;
-	u8 bPacketBW:1;
+	u8 packet_bw:1;
 	u8 rts_use_short_preamble:1;
 	u8 rts_use_short_gi:1;
 	u8 multicast:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index d9749d2c1668..ca123864e12b 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -351,7 +351,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	tcb_desc->bPacketBW = false;
+	tcb_desc->packet_bw = false;
 
 	if (!ht_info->current_ht_support || !ht_info->enable_ht)
 		return;
@@ -363,7 +363,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 		return;
 	if (ht_info->cur_bw_40mhz && ht_info->cur_tx_bw40mhz &&
 	    !ieee->bandwidth_auto_switch.forced_tx_20mhz)
-		tcb_desc->bPacketBW = true;
+		tcb_desc->packet_bw = true;
 }
 
 static void rtllib_query_protectionmode(struct rtllib_device *ieee,
-- 
2.30.2


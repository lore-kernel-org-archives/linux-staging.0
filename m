Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF7149C42
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551125; cv=none; b=r8L54tnKR/ZKAUZh1ruiVdaSEelgoFinKawioDP8kLKZYBQIgT8vC9A0m+sIU0rA4cn3/eZ9WQwUEP3y+4XDDunWyX/RsQfmrbbiphg9EGZrqMIh97ALAflQG77e5E9xz0hi52GaWzDNs9OKqDO+/I9rpEjYGQnkIhLZDD1t9Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551125; c=relaxed/simple;
	bh=Uo6WuL25MMLjivW5vo5RhhYC1vhyvzMtpyxTXfSsK2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SLuNDo3kpkHcaMkzTkz80Q1ypd1nqx34+Mtw8wynMIR5g1rmHv5xlLYEAAeeG9TiZXrElj0tlI1hOcqBs6RIHf5oxZdwWsJOXOq4XG1T5rhFgY1Jigb96ct50m5fykVa7PIKud1nPTi2VtdgqqaBABumAcN7QgbHN09Gc48TghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=D9Lif4em; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="D9Lif4em"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-206b9455460so39834765ad.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551123; x=1727155923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YSnWD5yZrBHR1oCufU8J5mydWGTq5g5s/eKz55Tg6E=;
        b=D9Lif4emWTevfO/6tzBqDAG62e2xv3QBoPzfzZYM+d4jzrREP2zwY4awFvm3fLEHSU
         S8oXBfHJAglQHVDadOFNnN30j0ESazoeh3dlODCjvYBgJu6wWN8ucIQP6k6UCKnUYxWK
         7XvOf50lUVnaSJ0buQrvafHYmpcWGzp/jNOPidWFbWZjPwpRb2Ci2OcCDxuT4gJEITWr
         z1fWWIAH0i+TPyW5ClohTfuNv/Rk8313885i9k1YDwWtMR/hL0XGlF94h0eQr9DAG24s
         x5VAKJ1NihJZJJT6Zpa4yxivnbOo/Vmj6RrxaedyjrneRYF42eRdjlFc/dcN/h8YASF3
         sIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551123; x=1727155923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YSnWD5yZrBHR1oCufU8J5mydWGTq5g5s/eKz55Tg6E=;
        b=xLWCkPT2/uHtlpkPejKn0AdCmRghKZgYLqu0PjGwDZbMNVC8ZXoxJolHePKxuzJnUB
         3t9JIb9EvHKGknOsNh2JFW6e8p5gR76EkZZkbXiI0GmLDMjnsvP/NM269Y2cVCGgosCh
         E7YDgh+lIOJiCvIJvRw/L5x1sW6c5AlwR2AHFTjrAiUBNsZVyydVfBZPAYqOnm8ftxid
         JH2xPG8NhU4I/PYoJ5oZK4BNyob9mq8I22Nhip0ChbOBwYD+9ZW4N9n2JSJzXKiUZYxR
         3nAxAaQ1A3PAL1BJN/dF/QCmWmyBmO8+nSCeQEbw5sDIg4I4mOTKkDu93ZopwCwpdf2v
         Dn/Q==
X-Gm-Message-State: AOJu0YzY9klh56AKLDOw9lCh1P3pmnZ3HL9h8QeGQx8FQqjaf0dMAEFd
	toXK0fAL/ZtnF8I1ZUrnwMQaRSmfQFJM85Bq4Mua6VzZXy0heLmAU9Nkq8XUkvc=
X-Google-Smtp-Source: AGHT+IFFrlWGY9a1utCnaH2Uv9do7wUI3ZntHgsek+0Mqfp/OZJlTdaoFeuckOpOYkQ22G47EJWfHw==
X-Received: by 2002:a17:903:1cf:b0:204:e471:8f06 with SMTP id d9443c01a7336-2074c65aa70mr328457905ad.17.1726551122827;
        Mon, 16 Sep 2024 22:32:02 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:02 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/18] Staging: rtl8192e: Rename variable bPacketBeacon
Date: Mon, 16 Sep 2024 22:31:44 -0700
Message-Id: <20240917053152.575553-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bPacketBeacon to packet_beacon
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 18 +++++++++---------
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 87a370a4b2db..75ca921c8aff 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1152,7 +1152,7 @@ static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
 				      struct rtllib_rx_stats *precord_stats,
 				      bool bpacket_match_bssid,
 				      bool bpacket_toself,
-				      bool bPacketBeacon,
+				      bool packet_beacon,
 				      bool bToSelfBA)
 {
 	struct phy_sts_ofdm_819xpci *pofdm_buf;
@@ -1174,7 +1174,7 @@ static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
 				    bpacket_match_bssid;
 	pstats->packet_to_self = precord_stats->packet_to_self = bpacket_toself;
 	pstats->is_cck = precord_stats->is_cck = is_cck_rate;
-	pstats->bPacketBeacon = precord_stats->bPacketBeacon = bPacketBeacon;
+	pstats->packet_beacon = precord_stats->packet_beacon = packet_beacon;
 	pstats->bToSelfBA = precord_stats->bToSelfBA = bToSelfBA;
 	if (check_reg824 == 0) {
 		reg824_bit9 = rtl92e_get_bb_reg(priv->rtllib->dev,
@@ -1396,7 +1396,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 		}
 	}
 
-	if (prev_st->bPacketBeacon) {
+	if (prev_st->packet_beacon) {
 		if (slide_beacon_adc_pwdb_statistics++ >=
 		    PHY_Beacon_RSSI_SLID_WIN_MAX) {
 			slide_beacon_adc_pwdb_statistics =
@@ -1416,7 +1416,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 		if (prev_st->RxPWDBAll >= 3)
 			prev_st->RxPWDBAll -= 3;
 	}
-	if (prev_st->packet_to_self || prev_st->bPacketBeacon ||
+	if (prev_st->packet_to_self || prev_st->packet_beacon ||
 	    prev_st->bToSelfBA) {
 		if (priv->undecorated_smoothed_pwdb < 0)
 			priv->undecorated_smoothed_pwdb = prev_st->RxPWDBAll;
@@ -1437,7 +1437,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	}
 
 	if (prev_st->signal_quality != 0) {
-		if (prev_st->packet_to_self || prev_st->bPacketBeacon ||
+		if (prev_st->packet_to_self || prev_st->packet_beacon ||
 		    prev_st->bToSelfBA) {
 			if (slide_evm_statistics++ >= PHY_RSSI_SLID_WIN_MAX) {
 				slide_evm_statistics = PHY_RSSI_SLID_WIN_MAX;
@@ -1459,7 +1459,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 		}
 
 		if (prev_st->packet_to_self ||
-		    prev_st->bPacketBeacon ||
+		    prev_st->packet_beacon ||
 		    prev_st->bToSelfBA) {
 			for (ij = 0; ij < 2; ij++) {
 				if (prev_st->RxMIMOSignalQuality[ij] != -1) {
@@ -1485,7 +1485,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 {
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
 	bool bpacket_match_bssid, bpacket_toself;
-	bool bPacketBeacon = false;
+	bool packet_beacon = false;
 	struct ieee80211_hdr_3addr *hdr;
 	bool bToSelfBA = false;
 	static struct rtllib_rx_stats  previous_stats;
@@ -1510,11 +1510,11 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 	bpacket_toself = bpacket_match_bssid &&		/* check this */
 			 ether_addr_equal(praddr, priv->rtllib->dev->dev_addr);
 	if (ieee80211_is_beacon(hdr->frame_control))
-		bPacketBeacon = true;
+		packet_beacon = true;
 	_rtl92e_process_phyinfo(priv, tmp_buf, &previous_stats, pstats);
 	_rtl92e_query_rxphystatus(priv, pstats, pdesc, pdrvinfo,
 				  &previous_stats, bpacket_match_bssid,
-				  bpacket_toself, bPacketBeacon, bToSelfBA);
+				  bpacket_toself, packet_beacon, bToSelfBA);
 	rtl92e_copy_mpdu_stats(pstats, &previous_stats);
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ca8f39f8e9ea..b0f01d940efa 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -485,7 +485,7 @@ struct rtllib_rx_stats {
 	bool  bPacketMatchBSSID;
 	bool  is_cck;
 	bool  packet_to_self;
-	bool   bPacketBeacon;
+	bool   packet_beacon;
 	bool   bToSelfBA;
 };
 
-- 
2.30.2


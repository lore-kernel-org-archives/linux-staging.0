Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F69178CDE
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823602; cv=none; b=Trd063llmVlt+K+IiLYobgN4MCC5+9RC2qdrItotVrFGW9+6dcs0KsP+OPcTBK44TEB2KJIx8m/cwETrrEIEL5deOsLe0mNs6TVX1HesUJ1q7Ww8F84i+naxmcvYm3A7tWMCVK5cxhu6tYro/rky4oLpnT9DYDUw+Vcd9TScVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823602; c=relaxed/simple;
	bh=0Osi9Yn1SgzAZQTXb4Yn4PxeMRBsG64qXNCZzkLmdgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QiVxTbVW28iT+HL+GiqXjmMZHS8fH/4mI1zuWqf8Y9cyjnPe+vlW/fYp9rHYbHiBb3ZYIc42h7Qj6G1pofSpDKKVWZrXjBY4lMWJucERq7nO8FBr8KXVRHO8AwBf9a+VqKGoB2oIVRejZaIiIKYUIOGe+ImF4B49Nzr5M2gba2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ZJN3i79c; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZJN3i79c"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2059204f448so29287215ad.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823600; x=1726428400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWBGCmSM+rSBL4Vikquo8FMOlw1JZM7mKto3SCU6yFA=;
        b=ZJN3i79cqcIDk3Hrrv+8v2Tqd49uwBlEMM+BtVVX5/y6H4nteGxrswZYMZVOq/4qXl
         dF45WmyrlWG4E+kMR0ial/65ZHHut9rtneDgPps1u2UY1Vga0g7apVhmQecNKXV70CZr
         DI4OJRRxVAqjjey9iFu0mtSe3JhRYa2pfPTkmdZhmrxiP/IN+XOqlQYzHBR/DDcrjBRf
         1pv0QSku9IHeTWZ+azI9hvaCjtST3LKNYbVXcfzV7CS90C9nxOg2mv3f6qxAgqTQxgdw
         wUWRxkQAEYbIkKs4Ofh2qhoUSHZDrrh+z9q6scS+92SfJeITuvJ4nNQ3lTH+YfI2A6Ac
         BN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823600; x=1726428400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWBGCmSM+rSBL4Vikquo8FMOlw1JZM7mKto3SCU6yFA=;
        b=UfBylylj7owE7Mbq+meyNnO0lbJDvboaZdHloP0OAE/wa0Ee9NjccWU3sYQar59KWP
         sdKWVs+VevQQ/RFtdqFfsfIyjhXn7PQlwHS7iRqmCWaUlyedxb5c/upGkXQv2lBNICf2
         TwI5+pl/TGhgDVpB5l90jvVTcLLbzTJvhnQjWZ2cWu2p9U/WbDFvi3Hr2IduOfNMHHGg
         l7rO+eH9BCZC4H3QeHn6O/0LVo3YxptsZ05aR+QIXcQBbBcx+mSb03DyupGHIQUz5I9b
         PGhOPrqThRHfRgsmi3stoQ9Sl1y84JQeU6xDn77jV4G9MDuKDNQHqpkdERi95QJQlwhn
         JfKQ==
X-Gm-Message-State: AOJu0Yyjo1xLfI03tq0SLXXWQ+8HN/CC2pixWLkEse7E4qsVXfpjgY33
	eg0DaawRuu2r77bPat2vNlZ3nAM5lHGSAu1DpbCYRfpZRy97PtTpgGTetRZRtaL9GJqa4FvEWMX
	a4+E=
X-Google-Smtp-Source: AGHT+IHN8SVFJ3fukm2YkQUPrYgt/gYprUUlJtojprTR0QqIUOSgiZFTaLNtsj0rYmL3PlOGexyGZQ==
X-Received: by 2002:a17:902:f711:b0:202:5255:357b with SMTP id d9443c01a7336-206f0612f17mr137706165ad.41.1725823600548;
        Sun, 08 Sep 2024 12:26:40 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:40 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/16] Staging: rtl8192e: Rename variable bPacketToSelf
Date: Sun,  8 Sep 2024 12:26:22 -0700
Message-Id: <20240908192633.94144-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bPacketToSelf to packet_to_self
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 10 +++++-----
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index a8bb2d3f7e9d..078e36962197 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1172,7 +1172,7 @@ static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
 	memset(precord_stats, 0, sizeof(struct rtllib_rx_stats));
 	pstats->bPacketMatchBSSID = precord_stats->bPacketMatchBSSID =
 				    bpacket_match_bssid;
-	pstats->bPacketToSelf = precord_stats->bPacketToSelf = bpacket_toself;
+	pstats->packet_to_self = precord_stats->packet_to_self = bpacket_toself;
 	pstats->bIsCCK = precord_stats->bIsCCK = is_cck_rate;
 	pstats->bPacketBeacon = precord_stats->bPacketBeacon = bPacketBeacon;
 	pstats->bToSelfBA = precord_stats->bToSelfBA = bToSelfBA;
@@ -1370,7 +1370,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	if (!bcheck)
 		return;
 
-	if (!prev_st->bIsCCK && prev_st->bPacketToSelf) {
+	if (!prev_st->bIsCCK && prev_st->packet_to_self) {
 		for (rfpath = RF90_PATH_A; rfpath < priv->num_total_rf_path; rfpath++) {
 			if (priv->stats.rx_rssi_percentage[rfpath] == 0) {
 				priv->stats.rx_rssi_percentage[rfpath] =
@@ -1416,7 +1416,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 		if (prev_st->RxPWDBAll >= 3)
 			prev_st->RxPWDBAll -= 3;
 	}
-	if (prev_st->bPacketToSelf || prev_st->bPacketBeacon ||
+	if (prev_st->packet_to_self || prev_st->bPacketBeacon ||
 	    prev_st->bToSelfBA) {
 		if (priv->undecorated_smoothed_pwdb < 0)
 			priv->undecorated_smoothed_pwdb = prev_st->RxPWDBAll;
@@ -1437,7 +1437,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	}
 
 	if (prev_st->SignalQuality != 0) {
-		if (prev_st->bPacketToSelf || prev_st->bPacketBeacon ||
+		if (prev_st->packet_to_self || prev_st->bPacketBeacon ||
 		    prev_st->bToSelfBA) {
 			if (slide_evm_statistics++ >= PHY_RSSI_SLID_WIN_MAX) {
 				slide_evm_statistics = PHY_RSSI_SLID_WIN_MAX;
@@ -1458,7 +1458,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 			priv->stats.last_signal_strength_inpercent = tmp_val;
 		}
 
-		if (prev_st->bPacketToSelf ||
+		if (prev_st->packet_to_self ||
 		    prev_st->bPacketBeacon ||
 		    prev_st->bToSelfBA) {
 			for (ij = 0; ij < 2; ij++) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 95e1c81bf132..f444e85a6264 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -484,7 +484,7 @@ struct rtllib_rx_stats {
 	s8    RxMIMOSignalQuality[2];
 	bool  bPacketMatchBSSID;
 	bool  bIsCCK;
-	bool  bPacketToSelf;
+	bool  packet_to_self;
 	bool   bPacketBeacon;
 	bool   bToSelfBA;
 };
-- 
2.30.2


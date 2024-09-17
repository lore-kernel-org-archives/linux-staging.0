Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A00E157A41
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551126; cv=none; b=NcifK09c6EykJCAmdHj3LmDim449vk9czwUbFrntPOIKHI9IlJ5Sa6Jfw51Zl82VazsqwC5uDi5w/ztW/e1cfyHuL6FjtG/2/CgxT4VU/0zH/nroZyRlRxtU3qtlpEbBSDHHDq2fTn1SgVzYIOG9gbYFHm9XhgkW/9T5Hpmsnq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551126; c=relaxed/simple;
	bh=Eu62Vsbi3EyTNBZNJGu7Sa5YurqV3OpEufb9wqPQ/cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J8e7mty0s9WgJMTtauPlyp1cwTyOWOgQj8Wx8idXB0EUGVqX742MBPkUUEJFSDJI+6UZKzHIJ6l0i6I/KoQwL+aLj0Latu2cuWon8Vr4yI6sIg1uXQ5FKnY+OD3RuqL3el9aO7UIIwe1jidpBbNAqV+TVkX0DVIgI0Sow2Files=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=IdlHFLdo; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="IdlHFLdo"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71798661a52so3925620b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551124; x=1727155924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml5litkFUrleubbrzCJcFBZD2B+ZFOCAuPzHnKwaYVs=;
        b=IdlHFLdofXzfnsKVpGv0iI3clthmmWRty37Aylr8yUhpWgCCH8eZOHBLjcGq6sVEEo
         yUSWgmvUYaQEx8g4FTXQRLPns5cwhBj1pWqzG0M1IncBld+Nrt3tbzEX7Agttzd9Ky4Y
         GtIG/XOG/f0XuF0eH2cTSKFpUZkjGE2bC3Q4zpkFCP69LzalSFw6sVQ/IeU9NMEBysiH
         Hh7NJRQEIPkx83lr0LuNNd7Tt+j7HuASHaguDyduHeQoGeBZnZ3ZWJb2tHjT4YiMaUKe
         KGixr40t8rrCnrlT2lpiV1eZqQMZNgd8t5FrlcS+Wy95tSWohy7OGpf6Nf0M6drLHcI0
         DnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551124; x=1727155924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml5litkFUrleubbrzCJcFBZD2B+ZFOCAuPzHnKwaYVs=;
        b=N+mml9VKKxZBXs6N97pjOGaktylzpkMSn8QAnqtn1emCz+LOjehm7rXY7iwEjqb/CL
         5TKR4SGHPIzWAQ1xirfuGzcnmP8bExiZww5XAfSlmjHyJn9cGbryayY9hGP9ftoA/Vys
         D6DFwJNYl0RR6S2bz09cILjH/P+zFGCGBiDCUfsNbneuekpvBm63OCc2GtORo7kqHJMi
         6rLrYad2C4UqQxT9yI/d/LHtel0HmxKMKEFJYeyeVdY78HNTQvjPGm5ArJaXoPu1I/58
         2RCHGh+sFHl0JqYfs+Vioyqk08EXpkpSae8iFtajx1XPV+Mf8Wu2VxmKeXV3dgjU0OFd
         mDfA==
X-Gm-Message-State: AOJu0Yy6mHvPQyPM5OU30VErpXL3dWtO9mTyNClDzn7f8qnr1ohfX8o6
	L0iUZdV6SCsw81XXrcHQHHh1HfSeI3sbKnBATB5lUleRxp2KPVt7wv7xlNVflBc=
X-Google-Smtp-Source: AGHT+IHLEyfhXWwIc3+AFaoigbKTGpCRVE9V+G7IG8vYEbYVxhLEAl6UAOPCNkVqC5jBl+0tX/1opw==
X-Received: by 2002:a05:6a00:2f9b:b0:718:d4e4:a10a with SMTP id d2e1a72fcca58-71907ea941emr35291301b3a.4.1726551124333;
        Mon, 16 Sep 2024 22:32:04 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:03 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/18] Staging: rtl8192e: Rename variable bPacketMatchBSSID
Date: Mon, 16 Sep 2024 22:31:46 -0700
Message-Id: <20240917053152.575553-13-tdavies@darkphysics.net>
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

Rename variable bPacketMatchBSSID to packet_match_bssid
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 75ca921c8aff..873c749250ae 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1170,7 +1170,7 @@ static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
 
 	is_cck_rate = rx_hal_is_cck_rate(pdrvinfo);
 	memset(precord_stats, 0, sizeof(struct rtllib_rx_stats));
-	pstats->bPacketMatchBSSID = precord_stats->bPacketMatchBSSID =
+	pstats->packet_match_bssid = precord_stats->packet_match_bssid =
 				    bpacket_match_bssid;
 	pstats->packet_to_self = precord_stats->packet_to_self = bpacket_toself;
 	pstats->is_cck = precord_stats->is_cck = is_cck_rate;
@@ -1362,7 +1362,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 	tmp_val = priv->stats.slide_rssi_total / slide_rssi_statistics;
 	priv->stats.signal_strength = rtl92e_translate_to_dbm(priv, tmp_val);
 	curr_st->rssi = priv->stats.signal_strength;
-	if (!prev_st->bPacketMatchBSSID) {
+	if (!prev_st->packet_match_bssid) {
 		if (!prev_st->bToSelfBA)
 			return;
 	}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c43d5b8298f1..4055c3044fe9 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -482,7 +482,7 @@ struct rtllib_rx_stats {
 	u32   RxPWDBAll;
 	u8    RxMIMOSignalStrength[2];
 	s8    RxMIMOSignalQuality[2];
-	bool  bPacketMatchBSSID;
+	bool  packet_match_bssid;
 	bool  is_cck;
 	bool  packet_to_self;
 	bool   packet_beacon;
-- 
2.30.2


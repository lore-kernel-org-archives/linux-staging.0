Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7664A55C08
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162566; cv=none; b=qQONf8YERkz0xnBHzFFdttqXL4t8OlWnyvqol6XQlE3skCnpNcBVBu4MA/gDQbjVX85+0nsg8ocVt7sdeRHGPql5TmIsLl+To2lU/sxdkyYABOJPoMnQpsurjQAqK7czVZHAHVXipgrtc0IYfyLCPTtn37IzQveqNa1Tgmsuv2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162566; c=relaxed/simple;
	bh=d/GLHSk4K2U7JU80kpJxoLSuODyAXPIsWBntT7Ha3+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SifLVqeP8O16W2pExu2P08JPC3y0MlXnosB4szMUnYMw9V1KbcOyUADR5JBd0qShZmI0p++ZqA1I+vcxxZ5eX+bqtnGzMnr/lP4mjqI25tOxeeP4ePDSx/x5AqwNLlUaQ4Evymm2MYqx+Q2ye2asuFbWf/9LULM4hYG/9i7UIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=GjQBYA4j; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GjQBYA4j"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f96f8489feso2476311a34.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162563; x=1718767363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8iTeXIWdySRsFuZkHSgHpEI9lD6ZbZRxodFJ0iQZsg=;
        b=GjQBYA4ju7D/Md0m8pOGZ8QrXwMFtunVHJ0QvjuEU53knmiQa+FBoOCaCX6TNgPGU0
         BZkmWx17prUg02o6qvvyZxjX+9AGB4FuWFaWakKQezqRTYpPfgDe3HSCCH5Dp/3lnFK7
         KPgzTEKtIuIudzWNGVYXqsMM+FJLzOLWRZo68pp8ap+rlIX0vWIfWw0EK0lhxrKxbpHi
         IwxII2FxK8JwceWAQ8zQiDUe+glLzgZX1CdKU3OfwroR3Z0mKOvo2qFhPS5iOMWSyNai
         dfwZ3o4aXsqz4Puw+feL4YS1aeAw4XIm2qsYzVbAiHKI0Yunfd78Eml4bnAmbvEN8GFL
         fdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162563; x=1718767363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8iTeXIWdySRsFuZkHSgHpEI9lD6ZbZRxodFJ0iQZsg=;
        b=tGQjp6/blkB8jMo0/WQrm4HOr+ZzKOeHbvXRqins34Px2kciy9blgjeWbxvI/0icwu
         W/OB4J2q/3pqBAjbjajn6SD3IDqUyIs0KkSOM3JteMVJ0c+fGv7AUfEJ2rd7w98N13A3
         8ugDGHBBjDbvUKO0zHQychOaKw0RlWUVZg9X6h8NhaUj3bGnC3H4wvB5qRh/tZuau1sl
         TBHJjfaQXcO2CdFZJEF5IolNt2uphPMbtK3vIyW5c19TYuvBS1zBm6NTcvAY8Vbcl+Ri
         JUR1NkSfVKL9kCARhltdy5MpjmA2vGxA3q8nKC9CcPqrwKNrceYZnetUNzwvaYCdX/+5
         9EIQ==
X-Gm-Message-State: AOJu0YzOdd07Sou8m7vpMn6XDYUtTATOzKfROhjzMHqpMjC9PGaUyuMJ
	yPCtiMWJLGT3z+bICHhhN8YdpWAdpmSq+NLbKReqvYdIvvmopVgAG8dwaDDk2ZA=
X-Google-Smtp-Source: AGHT+IGgZ8FKR+wy88PA9JF/snS/F09xgEthe5Q+Zz4XhVS7QFzZGoEv67GT4nT2eqA2TFV+R1wNlA==
X-Received: by 2002:a05:6830:22e4:b0:6f0:cdca:5619 with SMTP id 46e09a7af769-6fa1c444f2cmr559524a34.37.1718162563538;
        Tue, 11 Jun 2024 20:22:43 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:43 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 13/24] Staging: rtl8192e: Rename variable bUseShortGI
Date: Tue, 11 Jun 2024 20:22:19 -0700
Message-Id: <20240612032230.9738-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bUseShortGI to use_short_gi
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 8dec4e1b89b8..f38d172ddb4b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -859,7 +859,7 @@ static u8 _rtl92e_query_is_short(u8 TxHT, u8 TxRate, struct cb_desc *tcb_desc)
 {
 	u8   tmp_Short;
 
-	tmp_Short = (TxHT == 1) ? ((tcb_desc->bUseShortGI) ? 1 : 0) :
+	tmp_Short = (TxHT == 1) ? ((tcb_desc->use_short_gi) ? 1 : 0) :
 			((tcb_desc->bUseShortPreamble) ? 1 : 0);
 	if (TxHT == 1 && TxRate != DESC90_RATEMCS15)
 		tmp_Short = 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b48d9d416ead..54cf5ee628f0 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -112,7 +112,7 @@ struct cb_desc {
 	/* Tx Firmware Related flags (10-11)*/
 	u8 cts_enable:1;
 	u8 rts_enable:1;
-	u8 bUseShortGI:1;
+	u8 use_short_gi:1;
 	u8 bUseShortPreamble:1;
 	u8 tx_enable_fw_calc_dur:1;
 	u8 ampdu_enable:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index b5eb3968581d..d46963fe9bbc 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -335,15 +335,15 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	tcb_desc->bUseShortGI		= false;
+	tcb_desc->use_short_gi		= false;
 
 	if (!ht_info->current_ht_support || !ht_info->enable_ht)
 		return;
 
 	if (ht_info->cur_bw_40mhz && ht_info->cur_short_gi_40mhz)
-		tcb_desc->bUseShortGI = true;
+		tcb_desc->use_short_gi = true;
 	else if (!ht_info->cur_bw_40mhz && ht_info->cur_short_gi_20mhz)
-		tcb_desc->bUseShortGI = true;
+		tcb_desc->use_short_gi = true;
 }
 
 static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
-- 
2.30.2


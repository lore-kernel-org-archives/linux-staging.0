Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7021F39ACD
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748776; cv=none; b=b/+UKztD6rlNIK/AhHu0TUV+7CWSz+9eDbPYju3DPk6Cl1Ofqor2W6DouDy4tqhaHGhPeXawTz3OlZMdbOwoGZGRwK7GJLGiFzAzD9kJJ0o8BYhkxh2NktmeUtGyiZ59NohXc3lSSmA5uyk3CiAb7CeaYsoGTiSW4VE++WWR1CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748776; c=relaxed/simple;
	bh=d1ad8JazuYup9pSM6Gqg+bzO99wctALyeJhzT8FFxWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IBtlPuemmThNO8IYy1U3BhERYlRyZcrKIjarwnSWI+fUG9wyCjI0CzVP3y5AYjGB/TPuAt0t3u20kdR2nzG+UPAthS7fA9axgljEi7n4+SFoMJdmZhWiArnmLBlUOJVxIm1xmJrKar0MBFmdeA+vm2neFq1fhKLg9JVW6+fUvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=GSQ4Ck+S; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GSQ4Ck+S"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f457853950so4881391b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748773; x=1716353573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofFqHQQh40Sk0/pcoDQOyKxCMLOcb85rDpVudvN5l7Q=;
        b=GSQ4Ck+Sui4BXvlvKtm2KvrIsfgE3h3TsGtE37JkCbPH8DyQ2AUQ4W1KwJBBx7M2Mb
         ziiy32EvINYHoVwcc+72/7Z7Xda95SibVDeVJem4rYTgLccHvyuPhXadzk/v1NZ06K9l
         fidTYT2FzpVVGHFduJlu6yA2rQBazJn/e/JjO634Lc9OXjFVg3en0mhuZIZmpmtiX3NC
         +tZ9pTJz0U4yx3cxBul38qANyK71iLAeRkMWOp2xYLQbUtPAIAXEk6E1SnUXIwYY1v/k
         tPWhQFQLRPco0YSSpps9h2kEtyWHYdFydO5Q6lIKj+cpe9vTBzp7jWcEPUbyfzdqjM/P
         1Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748773; x=1716353573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofFqHQQh40Sk0/pcoDQOyKxCMLOcb85rDpVudvN5l7Q=;
        b=f8OIyueKMQZLq0qLi25F7ZwvvoU++KOPezM0ARzvakVy4AkW1Hu9i+0BU0K5UjhXDu
         3Ui1BhfiuqiWg3KW1XWbe0JWvDJsdoJwisChjSVdsg3PA0D90hRef9CR6A1p6pebE4mv
         +voEHz1Meb2EMT6/sdai1BJUsr4ktRpOIObuIgg7unepwMVnDJOJqM93prMTANyq5NLU
         HO8SG7aTMHa1T7lJ1YmCZFV3azObrTke4OK1If3pqd0m2IuuIWjOH5ncUDi5Yk6C/Kmo
         6wvXAH5+l6rfg37jBH0ncpuX5nAHlaPjxW8lYEX0L/AD4oOE76FbkrawhZSW40FvSvIU
         GRFA==
X-Gm-Message-State: AOJu0YzYSqVlYKcU4qXAK0Hn0i4c6s0CfzeGKVMI+UCUnX5wX2d3iaWN
	CRn7rGSbwOkMN7NMBaRSY0Pz5xBJmGSvuZd1j43UX/Aig5M+eZ/nGhBaJZuH3bg=
X-Google-Smtp-Source: AGHT+IFr5/moepQYZE4CJicvcbd44yoKS4JAFEKNJzmz4eSFgfJDB8IlZNiNsVWXDCPBE8vsv/CnBQ==
X-Received: by 2002:a05:6a20:3cab:b0:1af:fff9:1c59 with SMTP id adf61e73a8af0-1affff91d50mr9027518637.2.1715748772709;
        Tue, 14 May 2024 21:52:52 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:52 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 26/31] Staging: rtl8192e: Rename variable Frame_QoSTID
Date: Tue, 14 May 2024 21:52:23 -0700
Message-Id: <20240515045228.35928-27-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Frame_QoSTID to frame_qos_tid
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4fec36cfa2fc..b88c7cd399fb 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -799,7 +799,7 @@ static inline const char *eap_get_type(int type)
 		 eap_types[type];
 }
 
-static inline u8 Frame_QoSTID(u8 *buf)
+static inline u8 frame_qos_tid(u8 *buf)
 {
 	struct ieee80211_hdr_3addr *hdr;
 	u16 fc;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 328972cfd7a7..95dde1938874 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -891,7 +891,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 		struct rx_ts_record *ts = NULL;
 
 		if (rtllib_get_ts(ieee, (struct ts_common_info **)&ts, hdr->addr2,
-			(u8)Frame_QoSTID((u8 *)(skb->data)), RX_DIR, true)) {
+			(u8)frame_qos_tid((u8 *)(skb->data)), RX_DIR, true)) {
 			if ((fc & (1 << 11)) && (frag == ts->rx_last_frag_num) &&
 			    (WLAN_GET_SEQ_SEQ(sc) == ts->rx_last_seq_num))
 				return -1;
@@ -1324,7 +1324,7 @@ static int rtllib_rx_infra_adhoc(struct rtllib_device *ieee, struct sk_buff *skb
 	hdr = (struct ieee80211_hdr *)skb->data;
 	if (ieee->current_network.qos_data.active && IsQoSDataFrame(skb->data)
 		&& !is_multicast_ether_addr(hdr->addr1)) {
-		TID = Frame_QoSTID(skb->data);
+		TID = frame_qos_tid(skb->data);
 		SeqNum = WLAN_GET_SEQ_SEQ(sc);
 		rtllib_get_ts(ieee, (struct ts_common_info **)&ts, hdr->addr2, TID,
 		      RX_DIR, true);
-- 
2.30.2


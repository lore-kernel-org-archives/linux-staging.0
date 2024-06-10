Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E193405E6
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998548; cv=none; b=V+9pSHw5gkiauHy7u197aBeNUHcXFPhwdrNMkEZzBQ8qrL+Y8lZDAkTeI93pZRNxVEVC0FbNqHuIUQC6qVid6T+1fPumubupUnkUwmc+PejDEJio9Rjxx5v9s6QXGiVurSAqEpo/UW1G1GWrEqLav/zrnXksqVy9RvUlJ7J6ABw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998548; c=relaxed/simple;
	bh=0GD7G1Vwv7kDlRNA7lR4uSQMswjkLa2vIBVTEak38QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ITbpGYdZ+2oJPkgHQZ9SyK2Gean/qAtqIPYtxUsr0cU63GvetFt8oK6NdM2ssrY2OYOMbnNpkOJmJx6jsPm4LM86henl+86N2SPuhWab8PhYJUtfDcOXy4jNGRfkZ8cSLspYh00qXAVffMb8ENjLLBVXemYrECwm77tS2eBctZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Xj/hWSGv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Xj/hWSGv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f6fada63a6so8612085ad.3
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998546; x=1718603346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0nKHmebWMhFegYfeXGZXharf0UnBjbJDtsA11DQNZA=;
        b=Xj/hWSGvSQWukNYKhbssua1MBx3pRmCMxBsUYyxeWIukFIKZdlQmlWClyWuVp/Aw/0
         2r8JyC8s8KHsxpimMWla2sJDzq4s2K32p1b38JGYUNmvKFT8p8So8MfYiZKxxq3Mh6Vv
         +WEFpANBpA5JG+2iSHnJM7A3lE/Oed86XD0B018e0bCWoVemRwps/cd3lcbVaBDQ5B6C
         nXt4fc5wzq5plDLdpIbwWw35MJGh5/VdczOqwL0kValCxsVahdIm+BaaQi/70t40wKwJ
         Hc/BtHPN4WfhbTwZBQv7MeUSh6G3LrurO5IdBJaGgi5Q95phtgG/yv8nT07u4zQbAi5f
         kH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998546; x=1718603346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0nKHmebWMhFegYfeXGZXharf0UnBjbJDtsA11DQNZA=;
        b=hDSPJd3d/TapLVDpzMBiqMghSghU53xZfiYfPAJA0e7bCsOsPyzgsSYERFFIETtzoH
         Wj20IRWlC+LEAt5Ki/DnRxO2zHENlKqLQDK2y1vgjs6SCHxtxkZ5mQvsIrVeoneCFivU
         g7HtP/ep46m5DWBWxarHrnfhWEVimDA+9pJtH7ZVgq0gSQHqFF/PECwdfmPYgvF39WOa
         kaj0ZkMtTTu3DRqwqVHwQFbalVIjK76duVFVYdmnjXx6nlwQDJf48CtzPSoYUmOHaGo0
         byPnm+3x83GLPOpyjs0MdWZh/fNEZY8nXS33+UM+AMhDkqJD6ugDYSvSZO/sukADbnHi
         rbJQ==
X-Gm-Message-State: AOJu0YzODy9XrSynQXmTFcJp5LqGEAoDdAEd875e67/xhks0aJBe8tZF
	dBGTG001ne2eJ/0hcCnc2W94meDbiLIAhgP2Vvsbl24Q0jB9loQ8mCwCmX+9jLg=
X-Google-Smtp-Source: AGHT+IE+MWn8AGYk+iDcr6HdHc1cHGYDDZk/KWKWpTgfzPbm4F8zKvYLd5Ab82NnfczA83PqX6I3lg==
X-Received: by 2002:a17:902:ced1:b0:1f6:fbc2:526f with SMTP id d9443c01a7336-1f6fbc254acmr51796665ad.32.1717998545967;
        Sun, 09 Jun 2024 22:49:05 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:05 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/24] Staging: rtl8192e: Rename variable bBroadcast
Date: Sun,  9 Jun 2024 22:44:36 -0700
Message-Id: <20240610054449.71316-12-tdavies@darkphysics.net>
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

Rename variable bBroadcast to broadcast
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7a5accd86809..4bd7a85e2411 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -124,7 +124,7 @@ struct cb_desc {
 	u8 rts_use_short_preamble:1;
 	u8 rts_use_short_gi:1;
 	u8 multicast:1;
-	u8 bBroadcast:1;
+	u8 broadcast:1;
 	u8 drv_agg_enable:1;
 	u8 reserved2:1;
 
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index ca123864e12b..0c58b70ae03f 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -356,7 +356,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 	if (!ht_info->current_ht_support || !ht_info->enable_ht)
 		return;
 
-	if (tcb_desc->multicast || tcb_desc->bBroadcast)
+	if (tcb_desc->multicast || tcb_desc->broadcast)
 		return;
 
 	if ((tcb_desc->data_rate & 0x80) == 0)
@@ -378,7 +378,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	tcb_desc->RTSSC				= 0;
 	tcb_desc->rts_bw			= false;
 
-	if (tcb_desc->bBroadcast || tcb_desc->multicast)
+	if (tcb_desc->broadcast || tcb_desc->multicast)
 		return;
 
 	if (is_broadcast_ether_addr(skb->data + 16))
@@ -845,9 +845,9 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			if (is_multicast_ether_addr(header.addr1))
 				tcb_desc->multicast = 1;
 			if (is_broadcast_ether_addr(header.addr1))
-				tcb_desc->bBroadcast = 1;
+				tcb_desc->broadcast = 1;
 			rtllib_txrate_selectmode(ieee, tcb_desc);
-			if (tcb_desc->multicast ||  tcb_desc->bBroadcast)
+			if (tcb_desc->multicast ||  tcb_desc->broadcast)
 				tcb_desc->data_rate = ieee->basic_rate;
 			else
 				tcb_desc->data_rate = rtllib_current_rate(ieee);
-- 
2.30.2


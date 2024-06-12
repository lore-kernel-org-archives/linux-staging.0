Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4F4C61C
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162564; cv=none; b=mTyR0GNjo9AS08lWV/VZW0sw7zrwruhtJT+5Bm6B4IrqV79B27lKVB8E8+gVeq9Z+WJ/DftDbfewFEPEvK4uCotohdY1v9Tn47+7eO7YEmdRWoPRvw6/WxcT8PCPTNR+Z8yZ/XCcl977IJtM/ceq7CqTYQgLNbxi8Z4p3Fx9gYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162564; c=relaxed/simple;
	bh=QbUBSmjsgcQ+yp9vq20Gros3Iliy6wnVzFRdga3AKA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFZlL41WxEz2iWHETOnxxUEznuAN8A2rsxF1rBJmrbIDE5AhnsPYghklwGLxD/LVcF9rW+uovnBXqHicI2ksLLg+WkmNmz0ItE8MjFlCf4P07PrIcLLrtFztrXpZZMbfiNqBFInj4Xv43DYZLAiI3Uqbmxvk+1o3HkevDrDbTGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=mAGVH3+s; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="mAGVH3+s"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7e201ab539eso250069139f.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162562; x=1718767362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8sMnW0eAHI5c5WMUrja3LieEYZJVOVr7MzsVIly6Xw=;
        b=mAGVH3+slIJHaYzQALHVPBou9uBtAYg2CrHyGTiegyM2yOt5Fk7u0Qrlf4wnmoVdCN
         q6wYPYljdwdBgSNAzUuF8gVrBBN6xPl2VlXtIm7zJqQmSfgv5QA8tXOmIiF77v1aWHi1
         lw/+V++P4dme043Kv/Jhh0XKmo3G+Ff+DmBYNzxCze3fao6c/dX/1t+Ts9JaG2ezieo0
         vTS1Ymc5m/Uc+ZWTsJrZjVPzh2KJIftik9IHB/ijpdtWfI6BPM7AK9iOXulY4SBtifMz
         vxYF6GRuXJaLtkPXb+lfLVlloyNlulvp7oG85U3VUO1y5xkChl0mLzIUITJewfX7crVf
         aXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162562; x=1718767362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8sMnW0eAHI5c5WMUrja3LieEYZJVOVr7MzsVIly6Xw=;
        b=VcJqxQ0uS8uT6NZ797VVX4T/3aTVj56zyikxMF5y1eaK8a3GGUyruID6lAvk5CeegM
         v8+MYL9ASffbXYKW5eQo6c0ON1WFPm5VyOoJUhNz5uPR6AjzyYVcJlSsFCYexkoYwYZr
         AdvtltO/x+LGqsDtrZxSEEem5srdVjfJHhxgdmJTPNAUvn0uGruMsRiJ96FDXkhTBHMT
         qPQQgcEpE9hzL8+6SEl2qsatcwmNaMwGNL6mlhqbLRp3KXDrGgkl4Rvl2FXNW1NizIDF
         RCYmQ0AB4OnaLvtfGcMmCU8ScAPSRGgvQqXDT18DW1TawyRzp4guZjIE9kiYcOD8CUif
         nQxQ==
X-Gm-Message-State: AOJu0YxQxPt6bpzcZrK93HitqIEvIE7SAxYNMBsDG8AoFNfjcezr5J7v
	mIsyzA28qzxRSaB2Xt0+Sd2ZKldJRB4knMVK9JlUUdVKSYZMTnkr0nneSrg/TyY=
X-Google-Smtp-Source: AGHT+IF3I99/RtSbV0Y2cndGX1Hmd3671JjmeV4fsfA2l42oyupsJUr/uEOXN4rZkhrE4xj0rJEwOQ==
X-Received: by 2002:a05:6e02:2185:b0:374:9a3f:d197 with SMTP id e9e14a558f8ab-375cd1062c8mr7052755ab.15.1718162562053;
        Tue, 11 Jun 2024 20:22:42 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:41 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 11/24] Staging: rtl8192e: Rename variable bBroadcast
Date: Tue, 11 Jun 2024 20:22:17 -0700
Message-Id: <20240612032230.9738-12-tdavies@darkphysics.net>
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

Rename variable bBroadcast to broadcast
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 1f4c1f1f0274..812aeabb4a52 100644
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
index a3c211c1b0fa..1ea7157127f6 100644
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


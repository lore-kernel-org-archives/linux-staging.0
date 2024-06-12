Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4624C282F7
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162561; cv=none; b=AyTE8Tq8dP9n6HYQsfobAk08Xq6DS+Mt3ePrUVsf5VH0siliU5r83kffMF+ueEPRdgU4vMWlR4eXkIxfSp9LWxlrRiEBeprxQ11wkbpip52mH+vnhZ8u5IBrT9r3qtZaxsgRYlbh7FQXSiNvCI9Avmd1+oA12bCmUCzIgM8K2YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162561; c=relaxed/simple;
	bh=54IIdVY7ciiHv8FfEFOv/C1olmIKHuzoK3dEis8XOpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AZxB1Ukf0nQOj2IiR0adWaQi/+ZNc0GYDGV1cuqAqRukvl/BS6t354CyKMlyPSjyby+y0h7CZR8DinMahywotNjTh58tULTJxIWS1MUewljOjsYAGlbocz8KBbDcdvGcCfbQNZar1A0e5DtiKf9MII3UE4teFdIkOrHU5Q+CdMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=NLV4S9Zk; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="NLV4S9Zk"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d23db75f5cso181263b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162557; x=1718767357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRdNCIuE1fAcIlopHPfrxao68P6nIKXQy67ti/GMEzk=;
        b=NLV4S9ZkGNlx08Br4taaQXFRc4dAbO640cndwABZvJH2IZznzzTKh1TziT0XyVnKYg
         ZyofxDqymtackRr9KaixhAI958uDi02Edwo3zZDUAtv6L3vBXnh1pD0BJoBT8faXtxP2
         j3VVL4h8PiYIDOq/YIYs8kVsXDhcx8ozNJsTatEyhhNfkjUGkHl9/CCtLUTuWVQkqtX4
         JmBLqgzux609BVMuBQ1jOjkljwDUw0USRTDdbIAkB1wnIZ5QZqivZQsUxE5qdIv7+KeG
         UctgNco9whcT0L01T0lJZjg0sPw7cygkt40JyITdS85JR6hoKfqa6XB5iakqs5lsgkRy
         xBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162557; x=1718767357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRdNCIuE1fAcIlopHPfrxao68P6nIKXQy67ti/GMEzk=;
        b=aOQntyHKhnL32GICL3/NDe+JYEcXGVWhyuVSSsArqpc815k2S4YuSS9I0+Kk9LO/lC
         FJgzY8tJ63cWQWbaTelOYMg8DyPKCbCMHtBHDzY52I3BnDoLhxMEA4nLg+64rhQ2lnw1
         6IjvvIWCFCzW0+uoqLvb4dxXfAmpELKE9+CEYVyCjzLxU1hrT4km+3U3ZSIIfP5M3f6I
         +Y5cO2Bm1dBlcxU3BV6ChhaNRwwj8opCreq+E2tA6qgPOgrxMCaDwfV9Ai+RrL2Q+LjT
         VpZqnbEPBycD47ZBiQoyXpunkdvoo8vz/MI3+4bOBx5PmYl7thBBmdMVI6eSPWWCqtEL
         obXw==
X-Gm-Message-State: AOJu0YxPtI8ydHOy3tFB7lQTHLUwWIqs4o2YpUP2QEHC3YQy6qKuLa26
	UaEuRu5TQZ3GKeU1v5GGiKmBhOU3VvHUXnbrjfjzFHCdf7gaJ+FwJ4laA5M2MZ8=
X-Google-Smtp-Source: AGHT+IEgTVRl9RJkhDsO1gIVutg9vxMpQtIebArdKX/AqnlOo+SeVCMLu/htOQ4dRUClFgXHGNiqHQ==
X-Received: by 2002:a05:6808:1789:b0:3d2:25c6:c521 with SMTP id 5614622812f47-3d23e0ce2c9mr775622b6e.51.1718162557225;
        Tue, 11 Jun 2024 20:22:37 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:36 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 05/24] Staging: rtl8192e: Rename variable bRTSEnable
Date: Tue, 11 Jun 2024 20:22:11 -0700
Message-Id: <20240612032230.9738-6-tdavies@darkphysics.net>
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

Rename variable bRTSEnable to rts_enable
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  2 +-
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 27dfa268cd68..0263f3d7179c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -892,7 +892,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 		pTxFwInfo->RxAMD = 0;
 	}
 
-	pTxFwInfo->RtsEnable =	(cb_desc->bRTSEnable) ? 1 : 0;
+	pTxFwInfo->RtsEnable =	(cb_desc->rts_enable) ? 1 : 0;
 	pTxFwInfo->CtsEnable = (cb_desc->bCTSEnable) ? 1 : 0;
 	pTxFwInfo->RtsSTBC = (cb_desc->bRTSSTBC) ? 1 : 0;
 	pTxFwInfo->RtsHT = (cb_desc->rts_rate & 0x80) ? 1 : 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6dc641f78202..a305848dabd5 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -111,7 +111,7 @@ struct cb_desc {
 
 	/* Tx Firmware Related flags (10-11)*/
 	u8 bCTSEnable:1;
-	u8 bRTSEnable:1;
+	u8 rts_enable:1;
 	u8 bUseShortGI:1;
 	u8 bUseShortPreamble:1;
 	u8 tx_enable_fw_calc_dur:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 83082a990fbd..be8de6703e5d 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -386,10 +386,10 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 
 	if (ieee->mode < WIRELESS_MODE_N_24G) {
 		if (skb->len > ieee->rts) {
-			tcb_desc->bRTSEnable = true;
+			tcb_desc->rts_enable = true;
 			tcb_desc->rts_rate = MGN_24M;
 		} else if (ieee->current_network.buseprotection) {
-			tcb_desc->bRTSEnable = true;
+			tcb_desc->rts_enable = true;
 			tcb_desc->bCTSEnable = true;
 			tcb_desc->rts_rate = MGN_24M;
 		}
@@ -402,16 +402,16 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 		if (ht_info->iot_action & HT_IOT_ACT_FORCED_CTS2SELF) {
 			tcb_desc->bCTSEnable	= true;
 			tcb_desc->rts_rate  =	MGN_24M;
-			tcb_desc->bRTSEnable = true;
+			tcb_desc->rts_enable = true;
 			break;
 		} else if (ht_info->iot_action & (HT_IOT_ACT_FORCED_RTS |
 			   HT_IOT_ACT_PURE_N_MODE)) {
-			tcb_desc->bRTSEnable = true;
+			tcb_desc->rts_enable = true;
 			tcb_desc->rts_rate  =	MGN_24M;
 			break;
 		}
 		if (ieee->current_network.buseprotection) {
-			tcb_desc->bRTSEnable = true;
+			tcb_desc->rts_enable = true;
 			tcb_desc->bCTSEnable = true;
 			tcb_desc->rts_rate = MGN_24M;
 			break;
@@ -423,18 +423,18 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 						      ht_op_mode == 3)) ||
 			     (!ht_info->cur_bw_40mhz && ht_op_mode == 3)) {
 				tcb_desc->rts_rate = MGN_24M;
-				tcb_desc->bRTSEnable = true;
+				tcb_desc->rts_enable = true;
 				break;
 			}
 		}
 		if (skb->len > ieee->rts) {
 			tcb_desc->rts_rate = MGN_24M;
-			tcb_desc->bRTSEnable = true;
+			tcb_desc->rts_enable = true;
 			break;
 		}
 		if (tcb_desc->ampdu_enable) {
 			tcb_desc->rts_rate = MGN_24M;
-			tcb_desc->bRTSEnable = false;
+			tcb_desc->rts_enable = false;
 			break;
 		}
 		goto NO_PROTECTION;
@@ -443,7 +443,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 		tcb_desc->bUseShortPreamble = true;
 	return;
 NO_PROTECTION:
-	tcb_desc->bRTSEnable	= false;
+	tcb_desc->rts_enable	= false;
 	tcb_desc->bCTSEnable	= false;
 	tcb_desc->rts_rate	= 0;
 	tcb_desc->RTSSC		= 0;
-- 
2.30.2


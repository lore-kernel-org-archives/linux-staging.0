Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C2613B
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lAIKIhQj"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bbc648bed4so320726b6e.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520571; x=1705125371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQHEHGDupUV3CAXF0vDXDbjt/eIMnBNB5Ul4GcKvuIk=;
        b=lAIKIhQjxNfZ3/XNS1BdpGRUfnAUKrNJA6ClUaJmYh1N5TBZ4wyFt/mUs+3SgcZJJY
         e+hw1TX0IW/lLrpsxPnRzmL3w5cwneCQLZ+h8yk3Fw0kuCFZtka5I9qFOh0WCYmcFgoJ
         6rSDl4VwEeTZ1QN7y2tGTGz8AfR6774KBeX2tFVruu0thfHsnKGo5SQvCuOWzWbvzh6e
         F4CiNm4T+85aEI4OasoekJvbMD0qzmn9c4oT/tuS4LNNgZIARWMc4MPjKK2fMUxtC8+I
         DMUjZp56X2ZtHd/CAxW8GhvtiE4eGPiprDex44pjaerLG7ZDWojioitqm6tBYtdUT1xy
         zUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520571; x=1705125371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQHEHGDupUV3CAXF0vDXDbjt/eIMnBNB5Ul4GcKvuIk=;
        b=UPM8y8VKd7OTbVlSGIDXIqby6meJVUghlsS/Mbi4rKznakFTx536gzQQvWJsNiXulL
         iWUEFNguHyeLAR1AuT5jWulTrOaZ7MbciG+h7qdZwAqj6BmwKlVKylZq7bF40rQTdjfK
         +V+bxYnZb+GcRDVCt0j351j5h1D2rf20oSa8N0Wv/ehUW6zyGkPnwXoh+mtH0OOCpxZp
         /EhT9gp/GoVWPhvTHFpU7ikzMxybULfKXb0ixhpEKyzrTdyP3FSecbxddRvcnkGZb5AR
         cohRoTAubcLJQtB2P9Cx1R2BR2+UzJ6x+5pCiG9SULH3xCEZh6Qwglx161dElb+rGExY
         UwpQ==
X-Gm-Message-State: AOJu0Yw+5PIuBJ66cQsYHCHLtug8ADA2FiT7scm18oawMjU6HUUM+xlt
	xP4x7YJEd+q1XFVZnTlp/KboF+K/XxZycQ==
X-Google-Smtp-Source: AGHT+IFP87PTL+0Qs3NfU9Sw4RVvIsSZbtpoUohNkr3YVgvgk+ky7k/vUJii3uUmlGqEE+DX9aK1xQ==
X-Received: by 2002:a54:4684:0:b0:3bb:fe4f:e5c0 with SMTP id k4-20020a544684000000b003bbfe4fe5c0mr584609oic.31.1704520571353;
        Fri, 05 Jan 2024 21:56:11 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:10 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/21] Staging: rtl8192e: Rename variable bMulticast
Date: Fri,  5 Jan 2024 21:55:39 -0800
Message-Id: <20240106055556.430948-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bMulticast to multicast to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 37bcd968a542..9d3c79105508 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -123,7 +123,7 @@ struct cb_desc {
 	u8 bPacketBW:1;
 	u8 bRTSUseShortPreamble:1;
 	u8 bRTSUseShortGI:1;
-	u8 bMulticast:1;
+	u8 multicast:1;
 	u8 bBroadcast:1;
 	u8 drv_agg_enable:1;
 	u8 reserved2:1;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 6f730242728a..9db834f5d637 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1816,7 +1816,7 @@ void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee)
 	/* update the tx status */
 	tcb_desc = (struct cb_desc *)(txb->fragments[0]->cb +
 		   MAX_DEV_ADDR_SIZE);
-	if (tcb_desc->bMulticast)
+	if (tcb_desc->multicast)
 		ieee->stats.multicast++;
 
 	/* if xmit available, just xmit it immediately, else just insert it to
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index f7098a2ba8b0..f1e9a0390be0 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -356,7 +356,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 	if (!ht_info->current_ht_support || !ht_info->enable_ht)
 		return;
 
-	if (tcb_desc->bMulticast || tcb_desc->bBroadcast)
+	if (tcb_desc->multicast || tcb_desc->bBroadcast)
 		return;
 
 	if ((tcb_desc->data_rate & 0x80) == 0)
@@ -378,7 +378,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	tcb_desc->RTSSC				= 0;
 	tcb_desc->bRTSBW			= false;
 
-	if (tcb_desc->bBroadcast || tcb_desc->bMulticast)
+	if (tcb_desc->bBroadcast || tcb_desc->multicast)
 		return;
 
 	if (is_broadcast_ether_addr(skb->data + 16))
@@ -843,11 +843,11 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			tcb_desc->tx_use_drv_assinged_rate = 1;
 		} else {
 			if (is_multicast_ether_addr(header.addr1))
-				tcb_desc->bMulticast = 1;
+				tcb_desc->multicast = 1;
 			if (is_broadcast_ether_addr(header.addr1))
 				tcb_desc->bBroadcast = 1;
 			rtllib_txrate_selectmode(ieee, tcb_desc);
-			if (tcb_desc->bMulticast ||  tcb_desc->bBroadcast)
+			if (tcb_desc->multicast ||  tcb_desc->bBroadcast)
 				tcb_desc->data_rate = ieee->basic_rate;
 			else
 				tcb_desc->data_rate = rtllib_current_rate(ieee);
-- 
2.39.2


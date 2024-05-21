Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B0450A9D
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261452; cv=none; b=NrSZ+ifiwM3EQGKIsswaTo/SNk+l5N3BplehOQ/hRZz4YPw0Rtl/hTc/RZG3/UbAmLGJozVRXy4UcCPwN26XeYM5ipkV2ivCp/N7UiBsMlVYgvOi9qhTC9qdKjOmMZFbnLOKdGS3fmkuZA1zyxvXDdxOn+iMUHTwSAMBLzd2AmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261452; c=relaxed/simple;
	bh=XPJI+WS4EeMm9YhpHRUqULnGSCpjTomPq7hFHW5wa5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AZjc2Uz5Isttw9l177ww01fIks3LVPoLt6j7R7FkxQ6Yz6NhqW6JsiBkALQeoUVVb69N/4sWPCxXXR8Es5tvarTLLzBUxiGxGhSVprEuVuZJutqTxePViHFYHOIvmmd+qzRRcK7soezqxHpqyst7zc6zXkRphoAwYfeCAh9Dhlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=HNnrgHdy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="HNnrgHdy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ed835f3c3cso27699475ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261449; x=1716866249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8m47pozkJx2xYmkwgf2WxpxVuMQVKY0n0nxGrHzab78=;
        b=HNnrgHdynfcKUhHYRYeVd5ajTmfWrzQkgRz/ppYJRmiGxfo47xt+HUVF6OZ/RphKcT
         Sj4YGWWnQfuxO3NlVnCFsSY2dlhpq1GUtYNOj81ejiWzjUcqha+daGfrVW5iVPECx7b4
         dSZFKfIaQFhQJytM+IwdCIDeplmVa4HLdsb5e0mjKRFSTlztORM4Eupe5s+wESBZFPEz
         xKdZY0nEMYpCWYVe6DlN8KGwyN9vOkNWCGg1FcrUmsJxZ3+kv4/gKexRgkiDtN6UyYV1
         yKBLrsKteoE8gXm2Qq3pRdmcguwGpXzwwY1tQlbACfu7goNZ/eXiij+wcETeWWDPqB0D
         HrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261449; x=1716866249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8m47pozkJx2xYmkwgf2WxpxVuMQVKY0n0nxGrHzab78=;
        b=BYzuSoiFghnUADTg/okUvMk0achLViW5FVzf27M9O4XLxfQEXpRbDsSLD3JVEWwpOd
         GsGo5heaX1YSNYvcbuB148Igz2PNPpIYq8sZAONi18e0V+bM/Ks3js7Kn0Cu082+A25C
         w5JciiDNbkEeodaW5tD60LRBBIF7UcfXdsJu1dQtDNVTOuHjb7tUohBDprH6KwbjZ14q
         RNJS844i9OZdYr1JpPZvTaRaawMGTGtx+VIqSOcQFrEathmZcYmrNCcF4uo8vmezrytW
         oYRR2w8Aw3lsl5i0pb1IpUpzUI+Zk/kvtD5qItB6Pk2P4Go4fe8grkIakHQJqQdSeZCB
         KGyw==
X-Forwarded-Encrypted: i=1; AJvYcCXxLew2n7w6uh1ouwimMP5dvoMWcWtiOxzi7SS8cO+4KPB59t3wcHz24tI04U0jF1JvEF79NmgYlONl7YIylGqV4408hCnMRoPwgkllzQ==
X-Gm-Message-State: AOJu0YwjqghA0NOqsrLz7HZIEwmC377qR/5c4lu428228usmmhpCkr3E
	nIerRsh0zscDDoSO1HlSc2buEGzlHhWuyEjW3xqLIcKvtDvatE/vlz1zPvzK82k=
X-Google-Smtp-Source: AGHT+IF8XMIr22vZBHnnoWoHa3Q8FM+pktp2JXxMwSQx57nMRLvpMYto1JBLC0Ubt03+7danJPVlmg==
X-Received: by 2002:a17:903:2350:b0:1f2:f854:f54 with SMTP id d9443c01a7336-1f2f8541142mr75795665ad.62.1716261449374;
        Mon, 20 May 2024 20:17:29 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:28 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 10/31] Staging: rtl8192e: Rename variable rtllib_rx_InfraAdhoc
Date: Mon, 20 May 2024 20:16:57 -0700
Message-Id: <20240521031718.17852-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable rtllib_rx_InfraAdhoc to rtllib_rx_infra_adhoc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 108fe1520cf9..ea8cab9707bc 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1223,7 +1223,7 @@ static void rtllib_rx_indicate_pkt_legacy(struct rtllib_device *ieee,
 	kfree(rxb);
 }
 
-static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
+static int rtllib_rx_infra_adhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 		 struct rtllib_rx_stats *rx_stats)
 {
 	struct net_device *dev = ieee->dev;
@@ -1431,7 +1431,7 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	switch (ieee->iw_mode) {
 	case IW_MODE_INFRA:
-		ret = rtllib_rx_InfraAdhoc(ieee, skb, rx_stats);
+		ret = rtllib_rx_infra_adhoc(ieee, skb, rx_stats);
 		break;
 	case IW_MODE_MONITOR:
 		ret = rtllib_rx_monitor(ieee, skb, rx_stats);
-- 
2.30.2


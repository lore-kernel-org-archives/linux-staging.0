Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A09B1170D
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345276; cv=none; b=uyecl0iqmNqNbXqFRfcN52DOv+F8LK2awXPfef0MsXyxSoHTsZx+MTwyKVwzqEOzzerCH129eZuyTeXkY5I9bFfMcZZyuizjywHiCZBIAulYU+ZX25WOW2sc0BZLWSe8rsO1TES2a/qvAcEnQ6RSzOftiskLuo2FjyyN92X6eGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345276; c=relaxed/simple;
	bh=f7XnGoZL7qAneDrjRsAN3LInQTrlVLMQFjBrTp8NZgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hLsbCXTokuGqrWwlLdWfS22efVXHHgHIDlnMfmJ5ZqJYHLIZveAgk9wSq4y/C8b8Qk+2YnEqIkoBywwcUVP1+7ll1eUos/8QKl05Tb/wbAnRLg4HeROeRLdfWm5F8sl31HuxSDAIp7WkhMZ68dcekdXHeCL0kLBvc1Pf/EbAUac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=KWLtxpIk; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="KWLtxpIk"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2b18e829acfso300657a91.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345275; x=1714950075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zvpx3Vueis7h62thfpx+slORtda+wmNLPzJj/b+4olY=;
        b=KWLtxpIkc1K2QjYiLkcs2IhzOmDRChZaw9RxCfhIGcEGnAlwUs4ArIjBGocLnF1Fqr
         aPeci2f/Qm6XQN2wA5kMh5Z4ZmoMs5+dVtJaCJ1gUIwtUlQmOVEuOQozFPgxY+2swWGw
         F457YGR0DNnHotB2tAcwkD96nid/xAoFWzwlHoEACxAY2VONKxbbLaKIml3tV8bTSL6G
         3Ss6ZkJI8iiDMEGlUTLabbqD7yvg8ZyYIBYUmwdkP4NrtHvi9ofkCwisukM3BeruFNO/
         afvHBvwpZq9/C03NFkfy7CSa5lXjgQqqwyTUs0/hv9VEbsley0JBAHuDLGz0LfdHROJ9
         ZJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345275; x=1714950075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zvpx3Vueis7h62thfpx+slORtda+wmNLPzJj/b+4olY=;
        b=cqGmqprf4OYo7m1SZu9Z9nMBtCpnE7URu/u8SM2AFPqq5sX1Y3kuCiatjA1EQfb6/Z
         eMciZNhXgWkbiTTvkDVZa8UO+GPXPJWzVqCH2D4EqqInFMK4vev2BV3XNSWlevgMoi9p
         SzlqSkRLPGc5RUVnPqs+7iUA4u57UgXHehw0wZCxiCH/yWWl/bYB50CTcjYk7mGZX/py
         PLJmEBJjw9/bC62YeDln9kzJEnQyFZrPpLp1bTG6duaeFk/ESaGGw6+mzyIWoK3/o8Gw
         4a2y6/gs4K4Udhz0tmxQLopyv4Ys5gU5zrn8se8I/GIkembe/idv4BIFwW+sWquyEUh0
         MuUA==
X-Gm-Message-State: AOJu0YzXJ0HdY3/M799Rf/DbAefXHSSI08AkGfTm++etCldY4v3UDJFS
	4b+VNjzCDqNQURTA7lUdSrT8+t+b1lvWho7imHPoMDPuEd42KIQnlOU5ve/sa1I=
X-Google-Smtp-Source: AGHT+IHTP3+GYeyRM/DhpFrx1dmH9butYonF8Yc2gPbUNM3IfbCwkX0jXRkuUCi6v4vA4o+J3QLYGg==
X-Received: by 2002:a17:90a:17eb:b0:2a7:30f6:1aa8 with SMTP id q98-20020a17090a17eb00b002a730f61aa8mr8254943pja.8.1714345275002;
        Sun, 28 Apr 2024 16:01:15 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:14 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/18] Staging: rtl8192e: Rename variable ShortGI40Mhz
Date: Sun, 28 Apr 2024 16:00:56 -0700
Message-Id: <20240428230106.6548-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable ShortGI40Mhz to short_gi_40mhz
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
 drivers/staging/rtl8192e/rtllib_wx.c      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 25cdfdf85991..1b08507cab87 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -29,7 +29,7 @@ struct ht_capab_ele {
 	u8	mimo_pwr_save:2;
 	u8	GreenField:1;
 	u8	ShortGI20Mhz:1;
-	u8	ShortGI40Mhz:1;
+	u8	short_gi_40mhz:1;
 	u8	TxSTBC:1;
 	u8	RxSTBC:2;
 	u8	DelayBA:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 73d1e19a59ba..6c557717d8af 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -260,7 +260,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	cap_ele->mimo_pwr_save		= 3;
 	cap_ele->GreenField		= 0;
 	cap_ele->ShortGI20Mhz		= 1;
-	cap_ele->ShortGI40Mhz		= 1;
+	cap_ele->short_gi_40mhz		= 1;
 
 	cap_ele->TxSTBC			= 1;
 	cap_ele->RxSTBC			= 0;
@@ -299,7 +299,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 			cap_ele->MCS[1] &= 0x00;
 
 		if (ht->iot_action & HT_IOT_ACT_DISABLE_RX_40MHZ_SHORT_GI)
-			cap_ele->ShortGI40Mhz		= 0;
+			cap_ele->short_gi_40mhz		= 0;
 
 		if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev)) {
 			cap_ele->chl_width = 0;
@@ -458,7 +458,7 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 				 true : false);
 
 	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->ShortGI20Mhz == 1) ? true : false);
-	ht_info->cur_short_gi_40mhz = ((pPeerHTCap->ShortGI40Mhz == 1) ? true : false);
+	ht_info->cur_short_gi_40mhz = ((pPeerHTCap->short_gi_40mhz == 1) ? true : false);
 
 	ht_info->current_ampdu_enable = ht_info->ampdu_enable;
 	if (ieee->rtllib_ap_sec_type &&
diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index 1cfd109881ad..71ecfd0c8ed7 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -131,7 +131,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 				 &network->bssht.bd_ht_cap_buf[0];
 		is40M = (ht_cap->chl_width) ? 1 : 0;
 		isShortGI = (ht_cap->chl_width) ?
-				((ht_cap->ShortGI40Mhz) ? 1 : 0) :
+				((ht_cap->short_gi_40mhz) ? 1 : 0) :
 				((ht_cap->ShortGI20Mhz) ? 1 : 0);
 
 		max_mcs = ht_get_highest_mcs_rate(ieee, ht_cap->MCS,
-- 
2.30.2


Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A421BF2F
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345274; cv=none; b=Uy/TJOT67JVrhoGKbDUnitzu6LS1WUp1zQH8d5Tjabp+h8VKUmXtAJSvAtNQPNNCDRSOeNvY96/JvW971UmdDWDNPzBOkl74txn0pzT5v/1VymuXuaXY7S+DMb+BGWJHIR0zt6grXVaJcX2dyirRsC0OFpc/9M3MHNtw3Y48P24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345274; c=relaxed/simple;
	bh=mSPnRrq/jfknyM7vDbdlnNCQBX/d2boz/bfo0ykmPmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rVtOlu/QxU0Rwa3o01W67PAuE4OGQukHEo/823Rr81U0pujm+k9ffAidIwqrpUUjBflboClmJPXmAhD7xRMFYKuullW6aJ+v+w/b7kUFqqGg6RxrzsFEx5copfX2JswgeYh5AzCAy2MH7JxHzJzCWpGjkUKHOU8HdVAdFibitro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=dGnUdpdb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="dGnUdpdb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e65a1370b7so35926255ad.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345273; x=1714950073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yok7KNPayK+/A6OeCkYTGOX3VBTa8PBhHKRxItBY7/A=;
        b=dGnUdpdbRPKuY7s+nvkwQOoClagRwgIqtyJdbwiuh3i9d4WXrcHhCTM73C1BIcVQSD
         3Pw4Q/KSOvyPawq/RIjiJfWEQR/zvi1cQSg2n3L68xYHzA0xBSQbKay2sWjUHDPRrJ8l
         jjQlAxijsBBpzhC3XDmgEK1FGaIz5pUf53NVIVXMSvX4PAGGxatu52RYX7iYThN6dxSI
         aL34pxqWj2cabaUStoVX5Tdl/hjpNKVDU/zStIWRgpMdOro2ZKacIkpIniyjl3fy+C8d
         jVFqln/y4ro8+qlcuMgde7Ttig+XUvJtt63iYzF/h9lgp5Ymd6YJ9/4M7AAwFd+7fvkG
         q+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345273; x=1714950073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yok7KNPayK+/A6OeCkYTGOX3VBTa8PBhHKRxItBY7/A=;
        b=t4QmRrCkA8LcKs8q6BmUb/nPOQW7nqW8IA5oXT700TmU/XGAMLolBPRSV457F6kmJo
         qA+R5oIcnfqMEYiIvaJPBaiw6N3wH2kwheqU4QuPL4cEunqyKI6JM8l2nKa41aYFtsHZ
         s/Xk2WVj6M6GSxi+N84bn3BP9CEnwpNcJwiEjKmbLvOqVznIp57T6NvulqC3NCpAVlrK
         /RMyifjJdPaYo/IaDiZGIJ4iE8ZVh2mstUSCC6yvNiK95ZHQHaYnMA+7bypeY0PKh+Ek
         SdAW197jQpY4snAt17raN8bsVE/TStJkqD/3Jk0pFg0j5yifJwJqghVd2IqFLDzp7RkD
         /6cw==
X-Gm-Message-State: AOJu0Yz76rads+06wR1OxQVHHiOT9sJQqWbBgiHY1v6bfJFn0quBsKTF
	LZe7E52KxUuh2qFWVf9dffEGHAi6wKSrJrC5ulr60DkQQrjzQg53K/kxmAgRgFQ=
X-Google-Smtp-Source: AGHT+IFZ/+ekxzGt8VMMAAii8o2bjNBHIf21QOD2ps87Rl55ALZme19/+/orh0Ro6jE9YLVxX/Smnw==
X-Received: by 2002:a17:90a:cc15:b0:2b1:379:b115 with SMTP id b21-20020a17090acc1500b002b10379b115mr4010866pju.11.1714345272888;
        Sun, 28 Apr 2024 16:01:12 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:12 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/18] Staging: rtl8192e: Rename variable ChlWidth
Date: Sun, 28 Apr 2024 16:00:53 -0700
Message-Id: <20240428230106.6548-6-tdavies@darkphysics.net>
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

Rename variable ChlWidth to chl_width
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 10 +++++-----
 drivers/staging/rtl8192e/rtllib_rx.c      |  2 +-
 drivers/staging/rtl8192e/rtllib_wx.c      |  4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 7e0f64df01ea..938be9c27e0b 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -25,7 +25,7 @@ enum ht_extchnl_offset {
 
 struct ht_capab_ele {
 	u8	AdvCoding:1;
-	u8	ChlWidth:1;
+	u8	chl_width:1;
 	u8	MimoPwrSave:2;
 	u8	GreenField:1;
 	u8	ShortGI20Mhz:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 503ea1e92a7d..b79ea0b42e44 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -253,9 +253,9 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 
 	cap_ele->AdvCoding		= 0;
 	if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev))
-		cap_ele->ChlWidth = 0;
+		cap_ele->chl_width = 0;
 	else
-		cap_ele->ChlWidth = 1;
+		cap_ele->chl_width = 1;
 
 	cap_ele->MimoPwrSave		= 3;
 	cap_ele->GreenField		= 0;
@@ -272,7 +272,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 
 	netdev_dbg(ieee->dev,
 		   "TX HT cap/info ele BW=%d MaxAMSDUSize:%d DssCCk:%d\n",
-		   cap_ele->ChlWidth, cap_ele->MaxAMSDUSize, cap_ele->DssCCk);
+		   cap_ele->chl_width, cap_ele->MaxAMSDUSize, cap_ele->DssCCk);
 
 	if (is_encrypt) {
 		cap_ele->MPDUDensity	= 7;
@@ -302,7 +302,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 			cap_ele->ShortGI40Mhz		= 0;
 
 		if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev)) {
-			cap_ele->ChlWidth = 0;
+			cap_ele->chl_width = 0;
 			cap_ele->MCS[1] = 0;
 		}
 	}
@@ -452,7 +452,7 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	print_hex_dump_bytes("%s: ", __func__, DUMP_PREFIX_NONE,
 			     pPeerHTCap, sizeof(struct ht_capab_ele));
 #endif
-	ht_set_connect_bw_mode(ieee, (enum ht_channel_width)(pPeerHTCap->ChlWidth),
+	ht_set_connect_bw_mode(ieee, (enum ht_channel_width)(pPeerHTCap->chl_width),
 			   (enum ht_extchnl_offset)(pPeerHTInfo->ExtChlOffset));
 	ht_info->cur_tx_bw40mhz = ((pPeerHTInfo->RecommemdedTxWidth == 1) ?
 				 true : false);
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ebf8a2fd36d3..ee469c9118b8 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1877,7 +1877,7 @@ static void rtllib_parse_mfie_ht_cap(struct rtllib_info_element *info_element,
 
 		ht->bd_bandwidth = (enum ht_channel_width)
 					     (((struct ht_capab_ele *)
-					     (ht->bd_ht_cap_buf))->ChlWidth);
+					     (ht->bd_ht_cap_buf))->chl_width);
 	} else {
 		ht->bd_support_ht = false;
 		ht->bd_ht_1r = false;
diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index 55a3e4222cd6..1cfd109881ad 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -129,8 +129,8 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 		else
 			ht_cap = (struct ht_capab_ele *)
 				 &network->bssht.bd_ht_cap_buf[0];
-		is40M = (ht_cap->ChlWidth) ? 1 : 0;
-		isShortGI = (ht_cap->ChlWidth) ?
+		is40M = (ht_cap->chl_width) ? 1 : 0;
+		isShortGI = (ht_cap->chl_width) ?
 				((ht_cap->ShortGI40Mhz) ? 1 : 0) :
 				((ht_cap->ShortGI20Mhz) ? 1 : 0);
 
-- 
2.30.2


Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818C3B2A6
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748779; cv=none; b=ebqCd7GkYIUAQoNqfgP9ZTX7+pTx3LmfSEN1sSxOVpJLnhdfRwYvZKkKDcQ2XZWg6uH24ASPxpLwdFqu16focX1+EpBT28TsSt5w25eoYpV4h5YtRMY0HPhWGyP/ewRau95IECM6KqVesv0WImDcN2xWl9Zy7Vg7cL2Rc1peSBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748779; c=relaxed/simple;
	bh=XXsPi5dRmn4XHjPPdbeSlmCDXN2q2R4ED+MLEPy/IVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W+sCqHigeR9O+b9VB5l55ih4BwVXwyhDrCYk9GyitE3gL0JcS8nqihe7mjem0fNoRAc50k2k0No5OphkkXpjk6vI+22140Y+Igp8yLFsU4XSr+PieMmouWSNywtG+OK6MdhwemhPvyh7so16E1t6K9W0iHwMgfa66S5KYawF2AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=VaD5JogH; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="VaD5JogH"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c9a1d294cfso2205489b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748777; x=1716353577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGyMbnHLh+HIIQV9asHl34CUERwsx0z309fdVDbN6EE=;
        b=VaD5JogHM+Zy6GeyOtieeFfE4bLheSyKi73v7GbALfyfRFCPFCKZLfLYhvgZkhwcbO
         /c5DyVIDiHR/BSQii2A6Up4V2GZHfJoEgX0hmtjBQhQQYdQWizcATA/VAxCdIktWSPI+
         4MSxJgXxkTJvT0XJxrmFBd3p66pBB5FIzjHoqGoGFHXklN9RKtU8RkKhAY1rcKFluKk1
         nAfchYGv0fUVIhG/dBfS2p10z45LgYTInmL9vstZZ2HWJ7/WjxvI3k6j0hCJfGGxfvi7
         br2EAdk/Rn06doXtSsbkTWvE3nOx3aZDUoemk64R7Ne1HsSnY/2BaybqFmxUOPLYSVlZ
         4oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748777; x=1716353577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGyMbnHLh+HIIQV9asHl34CUERwsx0z309fdVDbN6EE=;
        b=BLOFpsBr9D5QkJQ8Sk39VUPGTiw6/YvLYDVh+90Ml4a+QPSD4p8jwxhzLeqniSxy9Q
         8YsBw8hiGoT8T61le6smKAFARThNYVnwCbbcgBDCZXg3tLj4Nhm4CnaaQxFcilQ87DFi
         pDAawqOcCf32ACfNTG8oP8H4IL97GdFtm7Qn+h+K3mMsyJCDgEJfVPX92+rcNhGtEwZD
         tpadAnHxV/FSj/ZAj35BOlPEnExm5LWDIFCmjeFfy9s9RP5uZjtxMxr+X1AP/mBwpkpu
         b2B/EcSHX0Jw0GL6m8Wk3NupuTg3BHi/D7qu6GcUF7AIB8gCA1rAjS670yt9EWExt3VR
         MN9A==
X-Gm-Message-State: AOJu0Yz3s36tTirOb/GbmJiPWX25N3cCgWc2EbttdABEXlfQSfhUABg7
	Qk3xnzj5ec/eQsulubyQpec7hhO7buqEFcPHapAaO8dxc+JKqKnVY3L4oA/S7ko=
X-Google-Smtp-Source: AGHT+IGwCTKH8TDoDAFIxx1Fx7EVIifKHcJUiO505L1nLWfr1gDVqQ9svIPVN4qFWm/xoDiP9Fs/8g==
X-Received: by 2002:a05:6808:1990:b0:3c9:b61d:cdb7 with SMTP id 5614622812f47-3c9b61dcfe6mr4589541b6e.2.1715748775350;
        Tue, 14 May 2024 21:52:55 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:55 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 30/31] Staging: rtl8192e: Rename variable prxbIndicateArray
Date: Tue, 14 May 2024 21:52:27 -0700
Message-Id: <20240515045228.35928-31-tdavies@darkphysics.net>
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

Rename variable prxbIndicateArray to prxb_indicate_array
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    |  4 ++--
 drivers/staging/rtl8192e/rtllib_rx.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e2695beaf582..62af48c20229 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1409,7 +1409,7 @@ struct rtllib_device {
 	union {
 		struct rtllib_rxb *rfd_array[REORDER_WIN_SIZE];
 		struct rtllib_rxb *stats_IndicateArray[REORDER_WIN_SIZE];
-		struct rtllib_rxb *prxbIndicateArray[REORDER_WIN_SIZE];
+		struct rtllib_rxb *prxb_indicate_array[REORDER_WIN_SIZE];
 		struct {
 			struct sw_chnl_cmd PreCommonCmd[MAX_PRECMD_CNT];
 			struct sw_chnl_cmd PostCommonCmd[MAX_POSTCMD_CNT];
@@ -1803,7 +1803,7 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 			    struct rtllib_rx_stats *stats);
 
 void rtllib_indicate_packets(struct rtllib_device *ieee,
-			     struct rtllib_rxb **prxbIndicateArray, u8  index);
+			     struct rtllib_rxb **prxb_indicate_array, u8  index);
 #define RT_ASOC_RETRY_LIMIT	5
 u8 mgnt_query_tx_rate_exclude_cck_rates(struct rtllib_device *ieee);
 
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 89dcbead5e11..43e94af07e99 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -429,14 +429,14 @@ static bool add_reorder_entry(struct rx_ts_record *ts,
 }
 
 void rtllib_indicate_packets(struct rtllib_device *ieee,
-			     struct rtllib_rxb **prxbIndicateArray, u8 index)
+			     struct rtllib_rxb **prxb_indicate_array, u8 index)
 {
 	struct net_device_stats *stats = &ieee->stats;
 	u8 i = 0, j = 0;
 	u16 ethertype;
 
 	for (j = 0; j < index; j++) {
-		struct rtllib_rxb *prxb = prxbIndicateArray[j];
+		struct rtllib_rxb *prxb = prxb_indicate_array[j];
 
 		for (i = 0; i < prxb->nr_subframes; i++) {
 			struct sk_buff *sub_skb = prxb->subframes[i];
@@ -594,7 +594,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 		netdev_dbg(ieee->dev,
 			   "Packets indication! IndicateSeq: %d, NewSeq: %d\n",
 			   ts->rx_indicate_seq, SeqNum);
-		ieee->prxbIndicateArray[0] = prxb;
+		ieee->prxb_indicate_array[0] = prxb;
 		index = 1;
 	} else {
 		/* Current packet is going to be inserted into pending list.*/
@@ -675,7 +675,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 				ts->rx_indicate_seq = (ts->rx_indicate_seq + 1) %
 						     4096;
 
-			ieee->prxbIndicateArray[index] = pReorderEntry->prxb;
+			ieee->prxb_indicate_array[index] = pReorderEntry->prxb;
 			netdev_dbg(ieee->dev, "%s(): Indicate SeqNum %d!\n",
 				   __func__, pReorderEntry->SeqNum);
 			index++;
@@ -706,7 +706,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 					       flags);
 			return;
 		}
-		rtllib_indicate_packets(ieee, ieee->prxbIndicateArray, index);
+		rtllib_indicate_packets(ieee, ieee->prxb_indicate_array, index);
 		bPktInBuf = false;
 	}
 
-- 
2.30.2


Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEFC188008
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823611; cv=none; b=vCKaR9HRIboGj3/PrtsXk4sACch4XxjcKl1UYZrT8NLahflBXh1RpB+PZWObumV/qQJimVPNDn0Sf3E+qvOxmGnmPYO42iOi4EOZyLiESMmVaPic5BnsJDpBGbSiqBW4uu3jEn6B7sFiSYEsQR5GnXn3FrB8TPdwAXdedg+CJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823611; c=relaxed/simple;
	bh=MBbbnSXdZOhUn3Mse4L+r57MOuPjC5Eyv5DHhhmPN8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VhuQnplJT5U6JYDc6xsihrAco8KJy4dUICwDAx+waDM8wgfMq5s8vMzlDTONzQPjKYsvtDu8p0AWgkje13TfjUN4IcC3Y6nAFspnAQozv3raJaz0//QP5Jd6RI/as9NTXPEHRK28X6SA4cNhG5I5mdOooceNiX2bacnleyhy1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=PTUyJFUp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="PTUyJFUp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20551e2f1f8so35195725ad.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823609; x=1726428409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mON3Z21zmcNJw0Qu/8FEVGELLEA3M0aDfstnX5lY/gs=;
        b=PTUyJFUpc1/xZlux7Rwhnpn0yYonupdkCIDlSPtQwoWszSMkevFwusdFIeAcsOx9l9
         NmUfHlB6Lkvz7bLPdiIlGIEeHgB2y4/HDbQ/GOW/4G53W7dUwlPeEfxRUncWp3dVIJ8A
         XT6D74I1U9eDuunnsmVxN7imI3y62tGPiLyvtEadPNywUc4Axi0Ur1HXWe9Qp1pwLg7w
         ZW2igcXnibQBbuI1xggoQX8AH5Lq/9VOcaHd+kZjLIcgBKSlfRU1RytOFhtM06cj+hLa
         n3OfDy0+Xyttgv6j+d0Ujxmmy0DdX01NrYuowrgRiUm5xBqji46yboTNWNOw2DP42clm
         6jhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823609; x=1726428409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mON3Z21zmcNJw0Qu/8FEVGELLEA3M0aDfstnX5lY/gs=;
        b=nAk7s/RzpidJhfhI73GcH4rIhbnbaazNq2FMSG0eGppe9/jgJUxOPk1NklYvbtcRbJ
         LTo6EiAnX3WUtzSozboCHJezT/AAKLpkAJ5jpTWivZVrYrdeEkavQAl36TS5vItNipey
         TkHtsbKTwRVhs9a4ufjDCxPQVZpGAD9q48YBLd6ys5JL5BYZ8qZT4InnqfYMXZYBC2s4
         xEVa8rWt+P9TPMN7vZvMdm8IkSmxajRnXAKaY5JyFdSpmkLs7u33EnHiq1kfQzNrCk3z
         Cbd81ziUpl51fCWQeTtkzHG6zFeKCANZQTuJ7moBtKwFHbOSYxhgiUnYNTz7HnbnyVfb
         2S3w==
X-Gm-Message-State: AOJu0Yxp+HLk+ISDKGIWfqzDdRfS0wWf9b2Dtfz+HHCb1O0aTyfmQa2i
	ZIFZbLdPMqOSX+X26drBV16/q75xeWwHdm3fsLPHM5nOVnG2FQAZ+4ALF0EQi78=
X-Google-Smtp-Source: AGHT+IFESgMCPQX8ayf3dx86Bk87zLc7Y3V/rHMhrJthqHllrR2mLJw/t1HsMRatPWpjBSSJSr2upA==
X-Received: by 2002:a17:903:18a:b0:202:4047:e419 with SMTP id d9443c01a7336-206f051c897mr136127355ad.25.1725823609076;
        Sun, 08 Sep 2024 12:26:49 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:48 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 16/16] Staging: rtl8192e: Rename variable RxDrvInfoSize
Date: Sun,  8 Sep 2024 12:26:33 -0700
Message-Id: <20240908192633.94144-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable RxDrvInfoSize to rx_drv_info_size
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index de0cd40df25f..552fd9b6e3e5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -227,7 +227,7 @@ struct rx_desc {
 	u16			Length:14;
 	u16			CRC32:1;
 	u16			ICV:1;
-	u8			RxDrvInfoSize;
+	u8			rx_drv_info_size;
 	u8			Shift:2;
 	u8			PHYStatus:1;
 	u8			SWDec:1;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index d25ac5adfc49..2672b1ddf88e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1493,7 +1493,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 	u8 *tmp_buf;
 	u8 *praddr;
 
-	tmp_buf = skb->data + pstats->RxDrvInfoSize + pstats->rx_buf_shift;
+	tmp_buf = skb->data + pstats->rx_drv_info_size + pstats->rx_buf_shift;
 
 	hdr = (struct ieee80211_hdr_3addr *)tmp_buf;
 	fc = le16_to_cpu(hdr->frame_control);
@@ -1639,7 +1639,7 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	if (stats->hw_error)
 		return false;
 
-	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
+	stats->rx_drv_info_size = pdesc->rx_drv_info_size;
 	stats->rx_buf_shift = (pdesc->Shift) & 0x03;
 	stats->decrypted = !pdesc->SWDec;
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index d43841a9b21b..dc1301f1a0c1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1522,7 +1522,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 				 priv->rxbuffersize, DMA_FROM_DEVICE);
 
 		skb_put(skb, pdesc->Length);
-		skb_reserve(skb, stats.RxDrvInfoSize +
+		skb_reserve(skb, stats.rx_drv_info_size +
 			stats.rx_buf_shift);
 		skb_trim(skb, skb->len - S_CRC_LEN);
 		rtllib_hdr = (struct ieee80211_hdr *)skb->data;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6cd374a9a955..d6615f787d53 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -474,7 +474,7 @@ struct rtllib_rx_stats {
 	u32 time_stamp_low;
 	u32 time_stamp_high;
 
-	u8    RxDrvInfoSize;
+	u8    rx_drv_info_size;
 	u8    rx_buf_shift;
 	bool  bIsAMPDU;
 	bool  bFirstMPDU;
-- 
2.30.2


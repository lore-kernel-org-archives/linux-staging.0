Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7238F1FE0F1
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786133; cv=none; b=aWkJp7ipW2W9/kjYTDPVslflCWPDcw/g+wGtX1+top6X0B58jJASlGBOEMGG9rofxpPTsLX5Xg2DC26u4/alG7kOIAxO6CgtBySygKvB/kGGMo2wrpaUe5QVfbGzqz43adrF2mES+83G5qlVVjAs4K4mptM+2OszblmwdaOJOTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786133; c=relaxed/simple;
	bh=jrq4/E5NDDOpFNWHL0DN5PzOqvNMgQj/oKYq0prtfR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IV9aphAhnQRdUN36OxWpy3r1sbhU9WYoTeE4aRuCHyRNDvIaWKhvNOn3quQ16+Vmm//6JCDowLzzsugYoCXkHkWMgoUKRucCfmxeq6rIa0eH7H+qA8PTA6irzEFkAJsP+nQqHJVmkp1YhAGlYQpHf5vRr7opnxAovmqv8TWtbEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C66BcY7h; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C66BcY7h"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso76354661fa.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786129; x=1731390929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPl2wir3DMIoXyEGtK2BWBXAxfA9J6lkO9SyjSLT3tM=;
        b=C66BcY7hX5U1q8CxSZ1o4IQqfaL0q8CUQrneMggwliAgM1Db7v+C5zmk+IVQlVFPsN
         o34j/V4pnjZQ61EKqH7Z5T6Gwn4c9GmJKw8f6ytuiaZUjLPb2xOvDOe3+dkZNUsUrhwa
         OGUD1xpXnX+AyzB1y6QpE7pHNQVj/XASmGFnJnHRRgfURWd2eizsve+Sm40Qk2VHltq/
         HaO3W7WB7AJUK5/zGvuBX10rKmAxHUeCOy8EN7Jn4rt09KfOD9hoiLJLfWE8vbNGHguw
         MQkTNbY4Am4p0gmGev94O14vcbTL0pgvNJmYRh9OXvtKUZ8Ob1ER79olKUW83ehTvmmW
         0Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786129; x=1731390929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPl2wir3DMIoXyEGtK2BWBXAxfA9J6lkO9SyjSLT3tM=;
        b=oUQwp1H0e03XG6UouzuAX9Ky0lHuyJPemExi2tds0kM8XQvWRA24FM8PYXRW2tANvL
         bxwvVOBi9fxINWVBWNi1q6uDnSh9AB1HUJuvbBV0KAkvgykkjpDJEq8mZ+RiQvFnavOu
         +OpnIlE4M7T9bRPeG9TDD5jBbh54p3e48qG9cedTFvoYibNWLszxDHw3fJCVVHAYA2jK
         ofTBV73frPcqC17VlknxmNCjBcfwnzQcpNyBvI1EtgExcU6oEL6Mb8skqQqtlhGnJKte
         QEVIXRVhEBxsIHmOSGkQKRgz12dCL+iOC7H5tTDFNknC1mZygP7jcdEjooTr2D7+rQtE
         wKvA==
X-Forwarded-Encrypted: i=1; AJvYcCXFc7DYIBEUBXO96B+0UQ2cDyL8iS9kQEa6FBbFHzOaU30ZyFARGsOjHmCQ/5tVVT1+TLUqjgX9bKebhLDW@lists.linux.dev
X-Gm-Message-State: AOJu0YyrAw1z8sUQsBsJtVEfseIELgqTON43MXZzmwIMErvJ4g2j8dhI
	D/qe7VSmGae2EoNin++GwmWWyEhHxL4UXmZF/IlBdRIwakDp1WBCrrVbrA==
X-Google-Smtp-Source: AGHT+IHM26YoJDPjOfCd9kEU5QTvBz7nznuCJTdiiXg9j76bfiW0cudiQAlZV2koGeLDcxMzKmAHQw==
X-Received: by 2002:a2e:a589:0:b0:2fb:3df8:6a8c with SMTP id 38308e7fff4ca-2fedb7c9c38mr100205051fa.23.1730786129140;
        Mon, 04 Nov 2024 21:55:29 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:28 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 03/16] staging: rtl8723bs: Remove function pointer set_chnl_bw_handler
Date: Tue,  5 Nov 2024 06:54:50 +0100
Message-ID: <fb4da3a1f3b3076641d7173a6b512abfbf60e7c5.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
References: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer set_chnl_bw_handler and use
PHY_SetSwChnlBWMode8723B directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 5 +----
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index aaadd56b7d8a..7aa9d84ee574 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -280,10 +280,7 @@ void rtw_hal_set_chan(struct adapter *padapter, u8 channel)
 void rtw_hal_set_chnl_bw(struct adapter *padapter, u8 channel,
 			 enum channel_width Bandwidth, u8 Offset40, u8 Offset80)
 {
-	if (padapter->HalFunc.set_chnl_bw_handler)
-		padapter->HalFunc.set_chnl_bw_handler(padapter, channel,
-						      Bandwidth, Offset40,
-						      Offset80);
+	PHY_SetSwChnlBWMode8723B(padapter, channel, Bandwidth, Offset40, Offset80);
 }
 
 void rtw_hal_dm_watchdog(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 615a33cad84a..283208e1de5d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,8 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->set_chnl_bw_handler = &PHY_SetSwChnlBWMode8723B;
-
 	pHalFunc->set_tx_power_level_handler = &PHY_SetTxPowerLevel8723B;
 
 	pHalFunc->hal_dm_watchdog = &rtl8723b_HalDmWatchDog;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 9e6414319608..2b3eaabf0774 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*set_chnl_bw_handler)(struct adapter *padapter, u8 channel, enum channel_width Bandwidth, u8 Offset40, u8 Offset80);
-
 	void (*set_tx_power_level_handler)(struct adapter *padapter, u8 channel);
 
 	void (*hal_dm_watchdog)(struct adapter *padapter);
-- 
2.43.0


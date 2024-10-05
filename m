Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908FD1552E0
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160491; cv=none; b=upYjeinCniusVOBK2ZMcfwqHidyG5HH7wFMgXkqxIJ0YIPw7fXZae1N91TACPdC75Pu2tLywXXqSi0rSAya69Y9eOUooeaENId51yKv2Laz4gZzT6G6mHBGH7Kt/uQydbaTRzHI5OqH6DyA1orkF2rk/i8Pm6zw4yRZWSDWuEG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160491; c=relaxed/simple;
	bh=X9DHnhb3PcjWFlPozmUkt4LTX03S1xya3WRzJN0hsmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aH9eHr34+96Vxb0JToPzGGyp3qiZgcnAy87kGrmp7K9+/2GYY06gNcw2rku6c1oywRdeIbDGWCFHrAHMyVTkUL39WQfj8sXgnkXZyVpk181zhFswR09phjj9PPoIkEOqnxgI0/+bUK0LzAU2md/zA30he+AOymTyhQdHCrQl01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jln6bRxz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jln6bRxz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so41378105e9.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160488; x=1728765288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n45JSFh+Iunnvvyo7iSbLfdkXzJD1ATFvBRpOr0mHbo=;
        b=Jln6bRxze20gi5zgyeVJjeu6jzYa0EExw4tGgiADJOFSIihrmB8YHLygDI8WLzZz6u
         fk9B1nrHuMc+tPvu0inu9SawsFEBEsDwIlPljuMqMiqW0/LyCeiCqtQFVbFr7/c1AXXc
         UY1D+zXM7d2X4zkV3unjIuhntTY5OUxRW5OG/mcIMcP+e6yAEjUWcpzSNySTcFKM78PZ
         QyTxAEepfvYu0DyIeIa6iiP3QQJBgXS0L5M5O9lksZrDnSHNB/AFmYCK/m2zqqHh+Bz4
         puzC8cXxMLfxPRSD704cp/IABSyqUAlwq5cXmCjUnQzKbom/GSKawNMexDjHDinRRbGs
         oaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160488; x=1728765288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n45JSFh+Iunnvvyo7iSbLfdkXzJD1ATFvBRpOr0mHbo=;
        b=JnM53ffwki8fpmf9AeD5aMCHxNRPKLFk1uL3Ndvw8L1ylEv5aj2xw1Dxc/WbN0POFL
         G6QtKvMbUgxR/Pw9daYjCKzhmA8NNJTnc+Vde7PJs8+gxz8+A1IV08GKQnzMTKO2tWoR
         yqkZQOZDnQNcIPpqYVkv9Mb3KRyAHz8kmX14g1WI4kutdVw7Yl/E0rHnP/75H6/kdhPl
         NRKqqk2NSoPRyqiRgnHx0LOu2P2Yc8CUAhm2ZRxqSw20ARAszqdZLgd8aQgszU+SbSQ2
         tonpCWdDkabD3HdHUqzefKO1Qfh2e4K5OfbhBRFk8QhVnjlUFVK6NrmTL/oRWHfai2GY
         PpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK9bQCrBPkXk6dxrEOS9g6TJbtlZqDL+3iNIZXTu44TsLiiOO4sjgU9+YCndFxqbTkkjZO4UdS4eX4fHmZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2nROpyGM/t0L14rSTijKFNoiUrx3jBmxN1r3MVBGycCJiby6Q
	YaF25mDWkpK4YgXPPRKVndIUsXo1SRxL5wWZfzet1vmCcsQsxgek
X-Google-Smtp-Source: AGHT+IE9+Wiqg7TlFmhDx2CKfX+QkqSK/VLv2J9Yzz7wRUqNgXo9P/u1Q9pxMjZl/rI6GPM7EW7u7A==
X-Received: by 2002:a05:600c:1f96:b0:42c:bbd5:727b with SMTP id 5b1f17b1804b1-42f85ae974emr69950985e9.25.1728160487765;
        Sat, 05 Oct 2024 13:34:47 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:47 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 01/15] staging: rtl8723bs: Remove function pointer hal_init
Date: Sat,  5 Oct 2024 22:33:44 +0200
Message-ID: <5c838981141aad1275cbcbe862ac7885de9bb8e9.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer hal_init and use rtl8723bs_hal_init directly to
increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 2 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 1 +
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index d675a5eeaddb..684d31360f4b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -78,7 +78,7 @@ uint rtw_hal_init(struct adapter *padapter)
 	uint status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
-	status = padapter->HalFunc.hal_init(padapter);
+	status = rtl8723bs_hal_init(padapter);
 
 	if (status == _SUCCESS) {
 		rtw_hal_init_opmode(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index c54d6dc1a495..b4819ff2928f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -583,7 +583,7 @@ static bool HalDetectPwrDownMode(struct adapter *Adapter)
 	return pHalData->pwrdown;
 }	/*  HalDetectPwrDownMode */
 
-static u32 rtl8723bs_hal_init(struct adapter *padapter)
+u32 rtl8723bs_hal_init(struct adapter *padapter)
 {
 	s32 ret;
 	struct hal_com_data *pHalData;
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->hal_init = &rtl8723bs_hal_init;
 	pHalFunc->hal_deinit = &rtl8723bs_hal_deinit;
 
 	pHalFunc->init_xmit_priv = &rtl8723bs_init_xmit_priv;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index d959be13fcf3..fc3a94e40721 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	u32 (*hal_init)(struct adapter *padapter);
 	u32 (*hal_deinit)(struct adapter *padapter);
 
 	void (*free_hal_data)(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index ad2542d0cabe..5e3483cb22db 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -405,6 +405,7 @@ struct txdesc_8723b {
 void rtl8723b_update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem);
 void rtl8723b_fill_fake_txdesc(struct adapter *padapter, u8 *pDesc, u32 BufferLen, u8 IsPsPoll, u8 IsBTQosNull, u8 bDataFrame);
 
+u32 rtl8723bs_hal_init(struct adapter *padapter);
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter);
 void rtl8723bs_free_xmit_priv(struct adapter *padapter);
 s32 rtl8723bs_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
-- 
2.43.0


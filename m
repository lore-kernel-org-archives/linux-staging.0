Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB727436358
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607678; cv=none; b=pQcSZjh0BSTNvJq8EBLPZR1SEgqoVYASdWqEshhdFEcsdzkTT6nTjFyAXPcUl9tRFXnUEWbltaAqdt0KrYyWnI+lcTFi9iaxnHtr44Ov1fJRPipp64SQheXE0F8VqiFRzXhPT1lnqkniZgSR9uhVR/5khC5DBzlln6VIq9T+ty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607678; c=relaxed/simple;
	bh=uhbsH8mL9+WFqNTiDxoFCj8ylZnEhwXgTD0JGTHSXvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZA947Ybr2A2UiQ7MDZvpGQlbT8mXK8SUYEtKz+4yUyotydoOltOjPvJfCrHiLwTcwPS3DxMf8jnxWmQR2+w4bbCUzwtjFVKJMLbKekvmYv305Xxas9h0iWisD3JrY0UczKyZiIeQajBe2mAcoKuzmBzlyYEoFEgLwZ8ph05SgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfKU0JBr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfKU0JBr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c40397e746so26298235ad.3
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607677; x=1782212477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7t7XocSD1QNoHXuiPcPUy9o04LgSr4zZaoadg/cyoA=;
        b=PfKU0JBrQzM7jrZ61oAk2oejTyBI1vJVpsCLVQntc4Jml8oHYpq29PCzPBtgeWBMOX
         S2S+NeUjYmVcFo73H7L6mfZfEJA1Zs66IYnYEzvWRkgGhg1T3/iFQyIT2lMStZ1m0x8G
         4Qq1YlndMJ00eERLlJ5CGP+LTLCphCVKwyb/sb+TDRFhyr6+drwsC8CG0Hh/524Wa1F7
         3345tk3ebRRUeZe8rJETHLg18S3A2iHuC+1NGHag37ZQvJfUu83iT8G9SDtvCOvLcJaQ
         Vx1zoGYHgfuaUbW+ZASgwI5aHdOkOp4nBLB1jO0uYMrSy5Oo36Abney9TkvZ1wB4i/kC
         nNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607677; x=1782212477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q7t7XocSD1QNoHXuiPcPUy9o04LgSr4zZaoadg/cyoA=;
        b=FVCnsf+BwYL+bm+QNKj2K2ZgWPOk6ip4Lt2vyM4+Ah9MfXAtgcGC+rP/Fiy7gWmJSg
         CugNhS3qFUSeQfuUl5fcTpQKs9b5pJQFvMRp7e6ynO89v7eyWVynN4FS6otnFwJ/cB5Z
         6uADz7L1SIGeNyuGRL+1PYUyXZPiWwxCtxsNd7KKh4oFuXIp54n2FwF8PlGf01TRgjWH
         pIW5LzB7ij8lYMBbzouF9mPTB0vHGTi+QGyOBe6ruzB3gUNH9LdATpvLOr/AsTcYyC6T
         GiTseggswqpPpmzb0UWgbGVAULUloULIVcH4k96t7s00zjvrEy0JkwZDRIvIPYhJOj/u
         HMvg==
X-Gm-Message-State: AOJu0YxRLjrgfl5vPi703nL1wwV8di8gPI3kuvvMK2UbvHiB53frbDY3
	jRGbDQPjGlEUAe2XMdradAUn7oPgM7Wzupky9PwJ/48p7rh82jv8mPTwPrnNTJCW
X-Gm-Gg: Acq92OEVYIm7zywY5l8Csc4vhUdW5rwPqZiAmfI0eYqbJn7JxXnSkIFC9kSRrRa3zc3
	3IWb58FEkIZYAOmcVZG2LpGIS6oD0MFdbmJMrzGHC3F4s0Lxwm9oB/8V8cAFrqqAmp5EvP/zaGm
	nHDJC/OPD9KPwc3Q44EMpMM7O/xcqv3obEnLWavwrwsIl4OU696f08nZVYkZKcH0zildnC9jVyj
	+CVk6WXCOBAfbqCm9H8iBuzXPy+zdPrrXaIWVmbJvOGPqfWRkeQDnVYHPLaCJE+SbQHGBGSw4Ww
	D8sVg5OXyvRg2C7I+vWhi5DTJDPEfTbkAOZTB0tgijDYYWVpQbIxlzdH36xZRquNYX3auLgRfJG
	fMLlqaVBASQWotqNJfbH+lhJzqqao+fmJqYjHgPo8AsS//qHTgeSg5VoI0sKDcj2d9CorS5eNlx
	gykohwcpPYBahnDhLV7ct3prk=
X-Received: by 2002:a17:902:e552:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2c69a1d7b7fmr32252645ad.19.1781607676772;
        Tue, 16 Jun 2026 04:01:16 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52a9sm132561995ad.11.2026.06.16.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:01:16 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: Fix multi-line comment style in wlan_bssdef.h
Date: Tue, 16 Jun 2026 16:30:44 +0530
Message-ID: <20260616110048.45541-2-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
References: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comments that were not following the kernel's multi-line
comment style. Comments should use the following format:

/*
 * text
 */

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 812a68394268..25ac996e73e3 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -31,10 +31,9 @@ enum ndis_802_11_network_type {
 	Ndis802_11NetworkTypeMax    /*  not a real type, defined as an upper bound */
 };
 
-/*
-	FW will only save the channel number in DSConfig.
-	ODI Handler will convert the channel number to freq. number.
-*/
+/* FW will only save the channel number in DSConfig. */
+/* ODI Handler will convert the channel number to freq. number. */
+
 struct ndis_802_11_conf {
 	u32 length;             /*  Length of structure */
 	u32 beacon_period;       /*  units are Kusec */
@@ -138,7 +137,8 @@ struct wlan_phy_info {
 
 struct wlan_bcn_info {
 	/* these infor get from rtw_get_encrypt_info when
-	 * * translate scan to UI */
+	 * translate scan to UI
+	 */
 	u8 encryp_protocol;/* ENCRYP_PROTOCOL_E: OPEN/WEP/WPA/WPA2/WAPI */
 	int group_cipher; /* WPA/WPA2 group cipher */
 	int pairwise_cipher;/* WPA/WPA2/WEP pairwise cipher */
@@ -150,8 +150,8 @@ struct wlan_bcn_info {
 };
 
 /* temporally add #pragma pack for structure alignment issue of
-*   struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
-*/
+ * struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
+ */
 struct wlan_bssid_ex {
 	u32  length;
 	u8 mac_address[ETH_ALEN];
-- 
2.54.0


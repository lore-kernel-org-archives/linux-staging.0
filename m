Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69B1741FE
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160497; cv=none; b=FmSFD4rxfV5r06cxOLrFDjc8daCBi0Z9+gZOirMkzMGMTuXuwK41xqC+gmoJL4p4K+5ypoJ/qscwtcIoXTijjGlaOb4p7iSeZgZ+ff8Bc8610vyNFHnvNVd8Tlg7Gr6pa1b8o9F9uKpRpGZyeNLv7sh4WmnmZr5C/GTetrYZQ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160497; c=relaxed/simple;
	bh=q1+I+qi7RRRKyj37zYDmCgv6DDuGIALnITv4DV7u5uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCe2BGuz8b4e1ZNZOVwKyoynINLg6YashiQWC/zHMw9nv8tiIqsGRZI0ppmP+S+EB1E6Rf+PWShCwBd+eMn8AJ1a94obMohlfdYjYgddysaxDKTLetk9TYGqgiANndpKJEWxhQwFfTmyLHPdct+pmopueWcNzsGzDEIrZwrnFWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9ns0L8K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9ns0L8K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so32113495e9.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160494; x=1728765294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvdqAIcZmdVsn+BXaPIVAuslbQWY2fWTXE+bajsMN+Y=;
        b=S9ns0L8KCpLsMpeqHK6LXvuefQ0McbCgLO8sIyol1yOvy7ADVjYhOoVFMNPCzdZlg2
         jU4XQYysz/1ogMQ5vvLTrRkpAt7DgZOOuy1SD67GO7BkNJuuvxdBMgjSuWfASEpcRCj1
         oQIandPzyfbsJ5psfccx372Lc/mwRh1eTuXnhuzt/0EUYY6hsQFRku6mVQaJXGJ9GsHP
         QBdiezaMBndMRMMWchMMkHY9kEOMNL9ykrt4tt9BaP5aqYw3mZBKZYEEdTlud6GWtO2M
         kfK4UWI8zXL96bQDgX5r8I8kjyiUZBbXuPXXjS4bo9NprUsdBPl6u0q9XIS1l6tGQ7LR
         i07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160494; x=1728765294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvdqAIcZmdVsn+BXaPIVAuslbQWY2fWTXE+bajsMN+Y=;
        b=eGoN1JatvrPn8yi4pAKNbQx5DYMkAhSW8ajLrvOKQu0mAhm4E51th3pEYatCYV5Wvg
         KiHWyDEtN0LIe79xqWonVu+4NqJYTEtdhSO1My+5IN2zm3rlQTPVN7c5V4fTDSsrgxkX
         68QN6nV28EONvCP/0pu/i+aWfz9oorUWmrNoIr28yzltIbYvOWSQCRafvk7+izdDgRJ1
         Wgbym8R9+KoHWzlosKRXBNqsvk+fUMtNShUWjFexTqObVz9InZz2e5umgpwUCkF9tP7Q
         hcld9P/KQzv1R4KsaegWsbqBxJoR9a6F3MVDmLwjThDmYiyp/L/5jisQy8Kd6XVJb5aB
         yutw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Vff9VxGHL2bLlVrlwpCPHIV9if1FtiRBIEksnnR6ZgpcYzpoFTNCGP5DLQ3Ss/+pgQgslg+h2gaR2Xly@lists.linux.dev
X-Gm-Message-State: AOJu0YyjmbsszqUdhI/J3Bg3UCymCJuFuLZUh6at4j3fTVLff6n0vpvj
	NfvMTCQmliw0Brs/0f2hutjmqNPXUpJjPmGpgFuh1EOTEXHXi+8q
X-Google-Smtp-Source: AGHT+IGd91FqCQuN6SxeWzAMZSzwcbIs+051hxb67ZpDNIiJuwkmWU9pxfg2WqSf2VJjdy7JbiZYDQ==
X-Received: by 2002:a05:600c:3ba1:b0:42c:bc04:58a5 with SMTP id 5b1f17b1804b1-42f85af0e48mr53707005e9.33.1728160493453;
        Sat, 05 Oct 2024 13:34:53 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:53 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 10/15] staging: rtl8723bs: Remove function pointer read_chip_version
Date: Sat,  5 Oct 2024 22:33:53 +0200
Message-ID: <79b26478a2493a1d7c27f8e88e0bec56a653d082.1727966761.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer read_chip_version and use
rtl8723b_read_chip_version directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 +---
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 drivers/staging/rtl8723bs/include/rtl8723b_recv.h | 2 ++
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 451f54e5de09..8c80e0735840 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -21,8 +21,7 @@ void rtw_hal_read_chip_info(struct adapter *padapter)
 
 void rtw_hal_read_chip_version(struct adapter *padapter)
 {
-	if (padapter->HalFunc.read_chip_version)
-		padapter->HalFunc.read_chip_version(padapter);
+	rtl8723b_read_chip_version(padapter);
 }
 
 void rtw_hal_def_value_init(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 106f1124964a..578e8ebf07c6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1610,7 +1610,7 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	return ChipVersion;
 }
 
-static void rtl8723b_read_chip_version(struct adapter *padapter)
+void rtl8723b_read_chip_version(struct adapter *padapter)
 {
 	ReadChipVersion8723B(padapter);
 }
@@ -1823,8 +1823,6 @@ static void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_l
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->read_chip_version = &rtl8723b_read_chip_version;
-
 	pHalFunc->UpdateRAMaskHandler = &UpdateHalRAMask8723B;
 
 	pHalFunc->set_channel_handler = &PHY_SwChnl8723B;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 6d301b44fa23..9b0e9c0bf020 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*read_chip_version)(struct adapter *padapter);
-
 	void (*init_default_value)(struct adapter *padapter);
 
 	void (*intf_chip_configure)(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index a108ce89bce4..040c9af06eee 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -87,4 +87,6 @@ void rtl8723bs_free_recv_priv(struct adapter *padapter);
 void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pphy_stat);
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 
+void rtl8723b_read_chip_version(struct adapter *padapter);
+
 #endif
-- 
2.43.0


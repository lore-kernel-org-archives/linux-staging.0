Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484C730F803
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269177; cv=none; b=oD8kDK43BYwlZ+sOvYc1Phu2OSWtL03qMdPFuAxSDTVmntelZ3uSSTWydjEUoYxusn6jrmd3r53dOGW6EhrSdC9cJmBqRDXBrHCEibr3N9TV0lWZc50tiLS0mTMEaJMiGHBNAc9WB9ZtFugL3UvDlW4WpNeLh/Cig1fYzlj1EpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269177; c=relaxed/simple;
	bh=7ycmDMsuBmTlyI103iKa+MvOZIXXFKpl1sR6jirlImY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt7JLAaU/WKvFz10oMt2NbPu0mL/Dt8owneVtFMlp3W3ZMoHTUEiXtUwJOHEKvrCRnAxuhtKq+F/L9kdnB1L0Svx+2jU5HPCBJRQ/oE4a+vFjTMtVQbpPb4Ufc7NA1Z6xdcnyrTkRT54Xt+YuGKwTNWQcUgDrS57mxFE4t3VTOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk9QPf2B; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk9QPf2B"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a87edf88b3so1910224e87.0
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269174; x=1778873974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlRglvXwbVp8yNm4s9n5eRynmWqDWK0IA9lCdzN+A2A=;
        b=Wk9QPf2Bb1QZRB1J/JXvKtqp0ngP/WGVSAqugoSiU53aeYTiif1ES+ymwmhKPFPocp
         vITY0ziOU/DkXCgspWDUxtT1nb6kfUOHbGliMmSS1efGMZVSjjHUs78fjsPQXxJFPG5z
         Lq+IdICrlTTQAqrojaRONQXZIbW6Wi2EF6pvw/TrWV78Pvw4lAybfaCKlTxv4S/xWfdS
         cXvRE4CUxx2NS0TEm/S78EwYujTFiR4hhu8lKPkT8W4R+XutirznQ4JC6PVxZmaIh1mT
         Wjb4O38o1H4PkaQVt3d/dhigkze3SXqJADdsu3qtPSWz9SLWcogNu8sbPCZJKE6i6Gkq
         pgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269174; x=1778873974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HlRglvXwbVp8yNm4s9n5eRynmWqDWK0IA9lCdzN+A2A=;
        b=LQjBS3YReiLSXuG7DQGMfPs4gvLw8jlfs8yi0tNF0RSTAIyESoo60aeMPJau8sPfVR
         0WRZ91ZvAZag0qVkjc62PSlyJ4yiO/eoO2qU+5A89JsbGYjWOWbor845vbU4zy9EdcDx
         IV3XtR2m9cMVHF75VMjogwWAi60uJdE92fWHqnhkQ06pDEuJResOF18NnRUn02Gu3rdB
         SPd/0+4qsBcvWI4fCdEn6iepmpY5FATT+L6b65v1rsFxA3qoW/TLZmCTNbuHPmfYJ1G2
         MtZSWGUDnhXV16KVyDtl6UZg/nQjgwbZjakYrmGdQvHsGFswgPvtArv0a9H6Hv8QxRAb
         gAPg==
X-Gm-Message-State: AOJu0YzJwHqWm88wxqGhy3EOxQ8T2KacuDGWC1KtkyP6I8eR1CwLow72
	XllLYqcy6qX+2LciO9x8s7S0LOn7csvpkSxiq6r74CB0Kli8xnjyv5B285RnjIiM
X-Gm-Gg: Acq92OHs5Ad6VDJwmB/jbNUDQVFfZTAHqQr/V/4tDqV6GvUSGFuLsf+SsqGQCxBC1br
	5psNvTFj46kMEHhThWnoBGRvfUy2Xgva1gML9nsTvODywG64R6OjrwYfI1cNWUn1yAYE3EnaIe6
	tQ14Vt4usRJvQviQBxNp0K6/n39gm2LFjnLPpl9zAtFTSUC4DpGxi83/lVgqiUeCn1YDdQH77s8
	ERAEA68VftNNGYardDkwzSzrveukMbaj/wk2hRRJURc2Re6jmYkSiSPB+rN4KC0NDzEuuhzn6TQ
	GTe8EEKWsykqHvXCIjwdeLO3CFLpmrn5SkxzKVNY6XUSmYhTvsZiQNwngWBV9dYcmHvev/6yBLe
	DFR8WS7LGxEkXMcPNcOJLjZpyERIQU4mQ77e0ecdzhP/eP+FZh9zmoq/ZTdqAYYbgkL8KeVcjLv
	WeV0p+DXGvu3Jm+Go4RdYagBBQQxmxGjTPMMs=
X-Received: by 2002:a05:6512:33ca:b0:5a4:6f3:ddd with SMTP id 2adb3069b0e04-5a887cd01a7mr4832219e87.13.1778269174337;
        Fri, 08 May 2026 12:39:34 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:34 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 03/11] staging: rtl8723bs: inline sd_read8() and sdio_read8() into rtw_read8()
Date: Fri,  8 May 2026 22:38:32 +0300
Message-ID: <20260508193909.16015-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508193909.16015-1-nikolayof23@gmail.com>
References: <20260508193909.16015-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtw_read8() func calls sdio_read8(), which performs address
conversation and calls sd_read8(), which calls sdio_readb()

Remove this deep level of indirection by directly handling the address
translation and the sdio_readb() call from rtw_read8() to significantly
reduce the number of abstractions and simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c       | 22 +++++++++++----
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 10 -------
 drivers/staging/rtl8723bs/include/rtw_io.h    |  1 -
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 28 -------------------
 4 files changed, 17 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index c793ae7ea5c4..838e5336ea18 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -27,13 +27,25 @@
 
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
-	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &pio_priv->intf;
-	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
+	struct sdio_data *sdio = &adapter->dvobj->intf_data;
+	struct sdio_func *func = sdio->func;
+	bool claim_needed;
+	u32 ftaddr;
+	u8 ret = 0;
+
+	if (adapter->bSurpriseRemoved)
+		return ret;
+
+	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
+	claim_needed = rtw_sdio_claim_host_needed(func);
 
-	_read8 = pintfhdl->io_ops._read8;
+	if (claim_needed)
+		sdio_claim_host(func);
+	ret = sdio_readb(func, addr, NULL);
+	if (claim_needed)
+		sdio_release_host(func);
 
-	return _read8(pintfhdl, addr);
+	return ret;
 }
 
 u16 rtw_read16(struct adapter *adapter, u32 addr)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index a0b5d36d3b02..2d442a8db586 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -124,15 +124,6 @@ u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
 	return ftaddr;
 }
 
-static u8 sdio_read8(struct intf_hdl *intfhdl, u32 addr)
-{
-	u32 ftaddr;
-
-	ftaddr = _cvrt2ftaddr(addr, NULL, NULL);
-
-	return sd_read8(intfhdl, ftaddr, NULL);
-}
-
 static u16 sdio_read16(struct intf_hdl *intfhdl, u32 addr)
 {
 	u32 ftaddr;
@@ -347,7 +338,6 @@ static u32 sdio_write_port(
 
 void sdio_set_intf_ops(struct adapter *adapter, struct _io_ops *ops)
 {
-	ops->_read8 = &sdio_read8;
 	ops->_read16 = &sdio_read16;
 	ops->_read32 = &sdio_read32;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index 3c99a2bc19bd..f58cf740f099 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -11,7 +11,6 @@
 struct intf_hdl;
 
 struct _io_ops {
-		u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
 		u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
 		u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 33bf826679f1..33d0d87051fa 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -152,34 +152,6 @@ s32 sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	return err;
 }
 
-u8 sd_read8(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
-{
-	struct adapter *padapter;
-	struct dvobj_priv *psdiodev;
-	struct sdio_data *psdio;
-
-	u8 v = 0;
-	struct sdio_func *func;
-	bool claim_needed;
-
-	padapter = pintfhdl->padapter;
-	psdiodev = pintfhdl->pintf_dev;
-	psdio = &psdiodev->intf_data;
-
-	if (padapter->bSurpriseRemoved)
-		return v;
-
-	func = psdio->func;
-	claim_needed = rtw_sdio_claim_host_needed(func);
-
-	if (claim_needed)
-		sdio_claim_host(func);
-	v = sdio_readb(func, addr, err);
-	if (claim_needed)
-		sdio_release_host(func);
-	return v;
-}
-
 u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 {
 	struct adapter *padapter;
-- 
2.54.0


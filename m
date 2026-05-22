Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3AE81ACA
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779409834; cv=none; b=dOs6B6dM4eQesqCAnMyDrEWAt+dYSBQNyhJFTnEOyRAqI4WqZjqgmVBNX9/DQLzVuyW4p8rHDEssfEzBD7Ci8KgqFoQKJs9oGe3vY7PsCQAypxzfriuAv1+yRKgWVvzzi/IvjDb9GTrXwbdBN1RTqND0b8q2/g9Qb0QNtxu5VC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779409834; c=relaxed/simple;
	bh=3q3YGvUg2oJqipeGFPVV/1cQ49hMmOoe1iOAzUOuKoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LFNUdipPfP090GYNWN22jKaTHvJ44F+kOuqkPNF+5QzZ/Qk4vEO7ix9JZZXl592ySt2nJ3Mk0pqcdMR0lqSC1OKx1ofKlQPfzOzt1iNnMF36EKU50G6QkG0/OsePsI6YenD95mOwbI7oFmwFxRUCCOOb/RHTnOuNSIrV0yIXSXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiFRVYMM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiFRVYMM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-367c26471f5so4275543a91.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779409831; x=1780014631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPB/jGQn9OjznHwW6UubgZtfKrgmkvk9qdU9jx9beC4=;
        b=EiFRVYMMTkO8wXPFSZiQ/3TzTiibg+Cwct+vtaWcE6608s1VRa/7gjiEayb0J2EGAF
         Ci6QCO2o9fKDUq13byoZRE3JcasFuF7SBAFcDa96+MgpQlHNLyRzAvW5sZlfi4gNJ1sR
         A0171QXzabFIfTvz+5gGWlvu8qHBLuRKWkymKJFX59kbpYO+owqpRs76x7IAoyz4wsLl
         5ZGbT64eqs4oY4SMAmlG624ArsG08xKcvZXF6NJeXOQOyTrqS60oaUysK9++fQws6fbW
         YcPMu3Cg08dD5iOVbHB39O1I3iyPyzz4X47lBZ3KxofRd8NIuK8NxKUZbd1JCusUL6kb
         cibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779409831; x=1780014631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPB/jGQn9OjznHwW6UubgZtfKrgmkvk9qdU9jx9beC4=;
        b=f8wqo5d8/ivok7GdeyQzOXtHlboz7BzYTvoKAUltBZuynzdx3XNjwg+yC4/REV57pE
         nkBCFZL8IJ8hJ7UYcDdpUOG7yh8EcoNOn2CAy6rGH50HzUiSzcy+XPGj3mNnmQDFgNCl
         oiq8wSndyqkUb2CJArelV2mBz7dtKrGtpDb2kGku6FyVzk5yArRtDqAP3fRrwlkoEq5X
         8guz+dFDl2JhgsYUsI6TSb5sFB1cJFqSFihgrzWNByVjmzjDIWEpDSCMfeiZqZeFwNmY
         r5/iZXmEUVgLjeH63+ixFAwxKpmhTmSLHNGHLde1eRHA1D/Vp4VQb7Rtmg3HUC1YdoHX
         Lveg==
X-Gm-Message-State: AOJu0YwHS76gZsi6cHkUaEulm+uG7CXpdN9Ar/yp+jpihKccBW9XkO1j
	n/2NUQ/0mfBzINwVAT0V9omyTmczgmzKvPCE+FZJEeeeER0RMaplsZ09
X-Gm-Gg: Acq92OH7pzPJZs6V6wSTsdIKyYZJJ3UJ2tdm/XmJV6bO/3EbMBi5c4Fw/BlhPq7l1PY
	PsAG6LRMnMOplYYPrFttZD2pkHLtKzDk6XdZARjc0hq7j9rL5dAOLFbzk/MIYCBPVl4WtJTjgQt
	8TB4vhYB/NnCgk5vkK1oQz/J+NYFKuMk9DOApoND1Lqu/q2tsNfeOQUT5PUjeHTuRTyCJHkoE4G
	lIdogP6nFKDFmvXlJ0Sp7q8YvMqGEZpclUjDg0MT5wd756R2FwhoFqL4fsT0Mw835vucbob1q0e
	33GLr8dPs+6UTfHd9S96aH0H0VABKvhDktoM+ojlDxcHcNcbw+rL4MgFrPL7ZWORDGe03X4mQhj
	ylm6JuIDplIdKDP6bv1IoOxGYDHETeI8ghxjy76Vx7nbLmv+fOT4s3Kxzd6+fyDZ7+P07VkR+72
	YK4T3fOCliLAWxfIaNoetHOIGEg97a1WNcMBrZEEMvbMpcYGBhHUq0c6ne+ugMUourUQ9Sc0t2s
	JqBZwhl
X-Received: by 2002:a17:903:1208:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2beb06730ffmr11851815ad.32.1779409831352;
        Thu, 21 May 2026 17:30:31 -0700 (PDT)
Received: from Kalki ([103.173.206.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb0e64b75sm4423705ad.4.2026.05.21.17.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:30:30 -0700 (PDT)
From: omkarbhor4011@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omkarbhor4011@gmail.com
Subject: [PATCH] staging: rtl8723bs: fix operator spacing
Date: Fri, 22 May 2026 06:00:13 +0530
Message-ID: <20260522003013.69238-1-omkarbhor4011@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: omkarbhor4011 <Omkarbhor4011@gmail.com>

Signed-off-by: omkarbhor4011 <Omkarbhor4011@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3ca..3bb1533e1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -21,23 +21,23 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, tmp | 0x04);
 
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
-		rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
+		rtw_write8(padapter, REG_MCUFWDL, tmp | 0x01);
 
 		do {
 			tmp = rtw_read8(padapter, REG_MCUFWDL);
 			if (tmp & 0x01)
 				break;
-			rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
+			rtw_write8(padapter, REG_MCUFWDL, tmp | 0x01);
 			msleep(1);
 		} while (count++ < 100);
 
 		/*  8051 reset */
-		tmp = rtw_read8(padapter, REG_MCUFWDL+2);
-		rtw_write8(padapter, REG_MCUFWDL+2, tmp&0xf7);
+		tmp = rtw_read8(padapter, REG_MCUFWDL + 2);
+		rtw_write8(padapter, REG_MCUFWDL + 2, tmp & 0xf7);
 	} else {
 		/*  MCU firmware download disable. */
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
-		rtw_write8(padapter, REG_MCUFWDL, tmp&0xfe);
+		rtw_write8(padapter, REG_MCUFWDL, tmp & 0xfe);
 	}
 }
 
@@ -70,8 +70,8 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	if (remainSize_p1) {
 		offset = blockCount_p1 * blockSize_p1;
 
-		blockCount_p2 = remainSize_p1/blockSize_p2;
-		remainSize_p2 = remainSize_p1%blockSize_p2;
+		blockCount_p2 = remainSize_p1 / blockSize_p2;
+		remainSize_p2 = remainSize_p1 % blockSize_p2;
 	}
 
 	/* 3 Phase #3 */
@@ -104,8 +104,8 @@ static int _PageWrite(
 	u8 value8;
 	u8 u8Page = (u8) (page & 0x07);
 
-	value8 = (rtw_read8(padapter, REG_MCUFWDL+2) & 0xF8) | u8Page;
-	rtw_write8(padapter, REG_MCUFWDL+2, value8);
+	value8 = (rtw_read8(padapter, REG_MCUFWDL + 2) & 0xF8) | u8Page;
+	rtw_write8(padapter, REG_MCUFWDL + 2, value8);
 
 	return _BlockWrite(padapter, buffer, size);
 }
@@ -124,7 +124,7 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 
 	for (page = 0; page < pageNums; page++) {
 		offset = page * MAX_DLFW_PAGE_SIZE;
-		ret = _PageWrite(padapter, page, bufferPtr+offset, MAX_DLFW_PAGE_SIZE);
+		ret = _PageWrite(padapter, page, bufferPtr + offset, MAX_DLFW_PAGE_SIZE);
 
 		if (ret == _FAIL) {
 			netdev_dbg(padapter->pnetdev, "page write failed at %s %d\n",
@@ -136,7 +136,7 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 	if (remainSize) {
 		offset = pageNums * MAX_DLFW_PAGE_SIZE;
 		page = pageNums;
-		ret = _PageWrite(padapter, page, bufferPtr+offset, remainSize);
+		ret = _PageWrite(padapter, page, bufferPtr + offset, remainSize);
 
 		if (ret == _FAIL) {
 			netdev_dbg(padapter->pnetdev, "remaining page write failed at %s %d\n",
@@ -195,7 +195,7 @@ static s32 polling_fwdl_chksum(
 		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->bDriverStopped)
 			break;
 		yield();
-	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
+	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
 	if (!(value32 & FWDL_ChkSum_rpt)) {
 		goto exit;
@@ -1888,7 +1888,7 @@ void rtl8723b_fill_fake_txdesc(
 	if (IsPsPoll) {
 		SET_TX_DESC_NAV_USE_HDR_8723B(pDesc, 1);
 	} else {
-		SET_TX_DESC_HWSEQ_EN_8723B(pDesc, 1); /*  Hw set sequence number */
+		SET_TX_DESC_HWSEQ_EN_8723B(pDesc, 1);
 		SET_TX_DESC_HWSEQ_SEL_8723B(pDesc, 0);
 	}
 
-- 
2.54.0


Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407A39DBF8
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428349; cv=none; b=tXVwsDn4Fmsh+98/18wR2W4F4cLS/fyqFJ2BoGz0ryFYv4m0LTe/gWUf4CqOsL4SN+SIFZ2WMe5Byl3p/4kT2gjuTzWaHf3Rj7fwYVAUDEgJ54B0/rGqnA3In49KHebpZ5u3t2igcxI80Ra893jNQuDRJ4yl9k3d/K09X6KDuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428349; c=relaxed/simple;
	bh=r+NxeLTUPH+PUFEgNwy/radad+9sM2mYzZjfIxj5aBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JBPkJkKDfQEqE/UPWvplzS54OVFy/YvGcPlT7fNCQmY7sKhJRqHt0Gta+F9Rs1ustlMvO4VXESWfKp0zi17IfBDi0u3MeJcgBxyUCsk0ESoNr8IefMdUgRnA46hn2DZ1CwIpI4M7tM28fgFgWJheSjeu9EJ+b9kwq4E1yEXXTag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiIU3/df; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiIU3/df"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c80227c9572so3251367a12.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779428347; x=1780033147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=65ILEf5RF3ixsOz4GvzeqTrsV6+FWGgtDAFtASNJyDY=;
        b=KiIU3/dfp6FltRP1RCj4eZ3mYgOwTijDPXLEM9PkLhpGqXhVYl0rhZXrIn7oLTztTo
         mDmxXsOAghlUX0BxJ8t6EHL33BZdDr2OZxhGBxoqYlcdlmPvR/0TVRVrpW1CAF/5R3Co
         Rb9/hMWASdEHD6mhD5hC6frVl6qYvjpehmKE6+pSd3yxfL55eqldTHUcVBCu01agKsNW
         GLVjWkjmEICxjRGw6zA99xpYWrKXs3McAF821aYJpHL94gPXBE5m0hNE6SrKTBZT/Qub
         oFS4Phy9gqK0muC9XP1F1vozUkre5L6uQJYh0YTeUzyQm/RDKouBIyKpyFqwTuT9WAE5
         Q7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428347; x=1780033147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65ILEf5RF3ixsOz4GvzeqTrsV6+FWGgtDAFtASNJyDY=;
        b=PxEY5M7mt+TbUOD8zdrNTvWUZJOhC6EPqOs2bnOa+n+v/bo1/8RXqZ/42R8manB589
         ZbIrhvyz2/ul7/VQEQBQTp7g8kqvEH1ierdm8IIS0ZFEQguqT7/w/1vnLs/GGFwaKK/L
         zzyw2ZGyHiYOqdyHco0zZi8pQzUUApdhEd4E7Y08+2SFJ6crbhsir4gEYol1AxiyNhOI
         CtcY74D79nysTr2RVCv+IBtnvm1xNv91seJMO8IG8vQdm9FgScNrQkFqfODR0VoBwhlP
         BZ5SBMc9LIFGvmLGIzwTbZfWuU4zCPUoNzzO3xn/DuhQhhrihHpDvr5hZ/93I/HtcPdM
         uSEQ==
X-Gm-Message-State: AOJu0YwT4YDZur74aZ357u9ALLgP8Ok13sULe8Gbd2znCntgA+vk6Prs
	eRVjIIIj1HeEXTXDHyMnt/Xb+TOFuZryCWa1I9bVMOpw6PNuihInZZ4q
X-Gm-Gg: Acq92OEaymxNAv1IBGFg+HRkKehb/YFkP5/s7PZPfO3c/woj2OzIJzDqwXuGWIBnbz2
	9Jv3xfGvN9VAoJ13WV0q/DmgmHWAsWTOFxaHiqYwI+zQ4YTTrqCJeFBWZ7l3Mgz6CRgJgu31h6M
	mShiTmaXqYkTzqcM+hlDQc/Iu5vpU4bxGlrxWIs74Q5O67CYxO7ok3oVHZ4WNDsx0GiImgwYpC2
	hMq6xcciJIDWJ7DdbZT3jlVZqmHhLW0eTzSGRoyxnpMaOjYI8beeUD8OPqNKfa1lShHc2g/UYOo
	yX5ijUMe7/mFycvOQGCUC9VU70Fn3x058jRaiAabCXxqUzyBiNSXGpFb7U+AJr2313nhgQrgfyi
	JhKZ5JRlSyTJOpywiBr1Ja4LlbrrKdzSKH2Y09LC8IEya8AnTxCO1G44a5ypepev6xXCH2+MjaL
	9D5qhAOv6UuxLVfE0ioIAX3Tflud7V9R48kaQp7kfTLVaglDeirLfNUxZpkWGKpSH9S46cL72Hz
	IuHaYd2
X-Received: by 2002:a05:6a20:d491:b0:3b2:8677:813e with SMTP id adf61e73a8af0-3b328ec5909mr2232393637.42.1779428346893;
        Thu, 21 May 2026 22:39:06 -0700 (PDT)
Received: from Kalki ([103.173.206.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852057f9cdsm433533a12.32.2026.05.21.22.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:39:06 -0700 (PDT)
From: omkarbhor4011@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omkarbhor4011@gmail.com
Subject: [PATCH] staging: rtl8723bs: fix operator spacing
Date: Fri, 22 May 2026 11:08:54 +0530
Message-ID: <20260522053854.188893-1-omkarbhor4011@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omkar Bhor <Omkarbhor4011@gmail.com>

Clean up operator spacing to match kernel coding style.

No functional change intended.
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


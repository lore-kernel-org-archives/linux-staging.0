Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D743385D6B
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314469; cv=none; b=l7q6eVvP8nSQF3Nsh5yYiYpbk2hctEM/0HQiw6CQqhR5rW/VODJAUnoBVpwdpMFgcFotS1VE8C9vCNE5O8+MunEwGImmT1IEoDXXstvSB737dK4iKHyYhLowsAfPz0yUwRruINYD3C7zBHJzUsPMzvK2puv32RGHEhXIAM0C6ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314469; c=relaxed/simple;
	bh=HCpGBxWFNx9UDdyl3BGNfnsOQ5Ynq8TNKIcCi5LxR/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZWdgaA0o75ls0FBDFMMBQS/uO/6gWQFh+qJJoSmyPEC8AyNL7jT1+skRscaQMImmQO2LARigzSYwvpvnEm3kT4qctViHGgOfVGSDy7sdLwNXCKwpIj1Pg/h5vu606CweJO16iKk/tLXSjEcLb3uwj4Zg2CV2ymmDR07TT3REis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA2fee42; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA2fee42"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15cd3fd760so930691666b.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314466; x=1784919266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqIYYaltJSq+0jPirb9KwUNPP9xcvBnDwx536/vKxMQ=;
        b=PA2fee42zp4Bs17oCavXAi6sh9WtePf0EMa5dqWXr9R5E0MX4yRSsFGYG2NTMNnZQu
         561GoGViStvF/d5VcEccQXSKb0K7U/un4ymsnjqjckFek23wGf7UaR7oBKPh5GGT1CY1
         9rmfsCgPakrAK8B9YhJ55HJVxKQQ+t91AQCA0XJM3ZvWmsfg0zBD5ajg/ITcY/y5HZ2I
         u2/RsfI7GjX2YYvja2HkIyvHT/gM4TV5SCgqsY0J8URSc6pTQyKGhiiEg1/K6wUDkIJu
         yTkXKoTfdq+jqQgafUhx9DmyZiXf4l9v/M2z4iFy0XN/1y2H1tIbrHwcZctiNAp5MGvC
         f6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314466; x=1784919266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DqIYYaltJSq+0jPirb9KwUNPP9xcvBnDwx536/vKxMQ=;
        b=gCFD1udrstx7NKfCI7Q2ysLdONp1af3qTs5NLILn6d96M7yOCiglJNgVrlzoeyyTW4
         2yGojk4nogIRLKK46xwQQIFG8P0EAnw7jKIsfuO6hBNUkhIMMgKEKOFV1zdt+RI5F8f6
         LlVu5W3ZkgMlIg8dR3VIyvzOrSrCcR2EEfmCfgjuUvzjpfmcrlR4GsCy7EV0VRYfGd5w
         7oNppwexZtQM3x/JnPW0bvTNQfTzogjf9y666f6weC3jXKa6pUkSL0Pes/XnyWP8F/K7
         RseZ6WtDhHFZ44kBddMwdM61gLtLIcx6KC0YDidJeqf5p/Nmmh+2U4dtgFYJE9m6P3hG
         HpOQ==
X-Gm-Message-State: AOJu0YwuifiBkZFne8MWLk6jGJQyaE1FyUKST+BqIc1TLYN3+t3dbg27
	7zLSWk0ZCrumOjlQg4YHe4HECmnBrylN4pXkH5kGia2evxj3HNbBddKl
X-Gm-Gg: AfdE7cmILmitD1OoOXBh8U72CoFokO2Kn4fxQdTlglF+/l2FYMzpMWxuAGEgWthF02w
	9HNpYU3sKhVt4tNeyM0jBcVRas+7lJyini+QyeisCu4WneRozcKEG7x81p361uO0xKuutmQfa7P
	XY7qudyQVLTcOZgvjWbteyO9bXNQigEGsvBTBRYUY3POfCLsBZg3kIISmYScbLRtkJGoQ5+jtAT
	Lh6fQmFvCilMZo545HxpQX+ylJsaKsFV37gRChTdAckopRcrlOwXbkBOgpPL8UrdtIrqOFSEacv
	XKNlM8ShkODP3Qk84gwcrBS1fBWJslQgq+NNpb4mu8PAU2XbLMwrLFdHeqNkp5S5MBxrDEY9b3F
	V7KYZCtthZslu3uBau3lDaMrcXRYcrruibgtpjvVXyEtOcs2iKRttO+eJgUBtY9M32HukV28ayB
	5+
X-Received: by 2002:a17:906:7947:b0:c12:9b93:61fd with SMTP id a640c23a62f3a-c16b46aa27amr150704166b.6.1784314466180;
        Fri, 17 Jul 2026 11:54:26 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:25 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 5/9] staging: rtl8723bs: hal: remove unused readings from the chip
Date: Fri, 17 Jul 2026 21:52:04 +0300
Message-ID: <20260717185407.56513-6-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717185407.56513-1-nikolayof23@gmail.com>
References: <20260717185407.56513-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These values are read from the chip but never used.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ---
 drivers/staging/rtl8723bs/include/hal_data.h      | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 81ae53c60623..a6b977ec4250 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -859,11 +859,8 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
 	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_8723B);
 
-	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
-	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
 	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL+2);
 	pHalData->RegReg542 = rtw_read8(padapter, REG_TBTT_PROHIBIT+2);
-	pHalData->RegCR_1 = rtw_read8(padapter, REG_CR+1);
 }
 
 void _InitBurstPktLen_8723BS(struct adapter *Adapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 4f37beb0c2db..6d9421cd0312 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -223,12 +223,9 @@ struct hal_com_data {
 	u8 LastHMEBoxNum;
 
 	u8 fw_ractrl;
-	u8 RegTxPause;
 	/*  Beacon function related global variable. */
-	u8 RegBcnCtrlVal;
 	u8 RegFwHwTxQCtrl;
 	u8 RegReg542;
-	u8 RegCR_1;
 	u16 RegRRSR;
 
 	u8 CurAntenna;
-- 
2.55.0


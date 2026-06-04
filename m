Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F3533066D
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586319; cv=none; b=aPfbJB92SAarR5cW/bwp1cu92j32peK3ehTOLFGUuWoTyB0yel3f4xqNIhRmY+myjg9RlAQATwZJ2DGIDOhTOZ0mTUXHNhL99jTwHzyBevwjNjRPkrj4QjrVU7paK6hvM3iPNH4La1HmTi3aLLiF1416q37NnnbpcxHXHoleXIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586319; c=relaxed/simple;
	bh=em2KQAPhKM0uW1X1phxTeteq6dH38ymmA9Hf2LQIZ2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oH195xTovG4SeY4pAQYYKIAvfSZa3s/gIpX//tCUMUNsl1w1lssn/2cf5ZNdw0jCMQ2WNIG/M2SrEC8oURUwBb6qNA1eKnHtLYnF+q9xpxNl0req8I5s9wdVC7Xlo40ya4FxEWFph98GDB6t35RovnqVk1RmtF81mGf2hJiTAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qU2Tr3CQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qU2Tr3CQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3637b90so7922595e9.3
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780586316; x=1781191116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQlKzjy8hie3RNjzE9LgS6V8/SHKqgabG5RGtEYZidc=;
        b=qU2Tr3CQ4aG3UGnojgvbiDN5W1XPLhN4VjNzNPb+p1eVyaMyRmfKeXMH8i+pSlI5lX
         iUDzyyyhsSc6sYJpdYfo+vr5UYNJxnsNCOotgV46GyxbeHFMfcZz4mnOSm2IDnql2+Ia
         3CCwbEPeVYtFnCigOj0tUwIT73C/8EC4HVv8IBlG2SM7yy0uA9gX0H7arTRMLN4pleKZ
         h8NusHcd3iNw5Am2fptrzO35yOvNQR2hfHomIoWqEaI8ZxWf/fm5PzXfu+gxFC2B8qCv
         TAMsdBQcZ3B+7+pdCeOsXXKrEfGqSyhwY8lzLdUYpYKOMiFFfwAIk3hrJV4lfboofi5O
         3ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586316; x=1781191116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQlKzjy8hie3RNjzE9LgS6V8/SHKqgabG5RGtEYZidc=;
        b=fFcGKp5Z7EvHMuM3pogI8LzXZmMiUUHtj2Y8VNJa2c+8C4SipMY1H1SM2B07LLQUkF
         NBmGZcSzDJGuCD760QPH2kmJqYbcuP+owLgjsFW218p6Dezs/wsP4FLJla0/7HsMHMMg
         AdarbhQ43y1opBxANAax482NizUgUV2ns0U7L7GjQzG4K7nJBXUsPdvHbGvt/CVD0E2q
         NXpKpZ8lxe2V2Vn7M3UO5MNSkTWha6AhF9DvwyR0KZ0MuvQcMbVymRjU5Wg2XVww/TzI
         yaCsdL0eW/2SF1fR0d2c74HT3h+xuQr2+qzOU7AoqE5btaX7NCyxHpa+zokSfxx9b9li
         B47w==
X-Gm-Message-State: AOJu0YwWgJgE/9EITm0TZzvpLu0FkVx0TSOWGW3lHqYF9Lm6NDjROepP
	Cw16tVMkGfcidSOfChKMWZ78i1x28UBwAg5VxAFsIEA2jA744qA8+1F71mAoMQ==
X-Gm-Gg: Acq92OFyOpdxjpoaLvvHM/CCZKLoMZEXHJ6r0Hi7u+9aqFNaJhk6S+GSHmHeoPX1LL8
	4rcfa0WssGvDc5fz3+73cIqKskM6HBJUEZWVHQkeYqdkdGslepLf2LuGcannCKoRw5suI+P0gfK
	cnxnUZA15iG9LprqkWyiR9S+1uK3icEAWbVKdA7S7mMj4Fi9XDZd7Dh8nB93EMnDO2plP3+bvt1
	XmTNXe66I9WuYqe3TVPz2IpGUqhhAFqIrIDBTMAXS+1nGXgcFvOxb3Epw7vrvmvJ547ajhpfrGj
	1urmKpzsSGC9gcF2ejL6ePR2loI4quC/vn7F7l970Cuuc4FJkHUU/A8oQh7xWnUujMc15C1bcQz
	1dMFnA4+x2P3Bbt3KYCxTerYGsuK6v1GZIGPEhoV4RE8/cG4SMVwuucRezvrHOKWfFCeDv0Jatg
	um9wY0eG686Y43AExUMDkxhl1hB1YBQcpsQyua48Sf8Ew3mpStB62+aVNGpuxdgneTJY8zQTQl1
	hwqUrwvj5H//Q==
X-Received: by 2002:a05:600c:458b:b0:490:a296:fdad with SMTP id 5b1f17b1804b1-490b5fda850mr140350455e9.24.1780586316002;
        Thu, 04 Jun 2026 08:18:36 -0700 (PDT)
Received: from fedora ([102.78.155.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm16534398f8f.12.2026.06.04.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:18:35 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers with named constants
Date: Thu,  4 Jun 2026 16:18:28 +0100
Message-ID: <20260604151828.242801-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aiGMXBNQ0TbIGbpP@stanley.mountain>
References: <aiGMXBNQ0TbIGbpP@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Decompose the beacon timing magic numbers in
rtl8723b_InitBeaconParameters() into named constants with bitfield
expressions to document the register layout.

REG_TBTT_PROHIBIT (0x0540): The value 0x6404 splits into hold time
(0x64) in the upper byte and prohibit setup time (0x04) in the lower
byte, in 32us units — matching the layout used in the rtw88 driver
(WLAN_TBTT_HOLD_TIME << 8 | WLAN_TBTT_PROHIBIT).

REG_BCNTCFG (0x0510): The value 0x660F follows the same bitfield
layout as the adjacent EDCA AC parameter registers:
AIFS = bits[7:0] = 0x0F (disables contention before beacon Tx);
CWmin = bits[11:8] = 0x06; CWmax = bits[15:12] = 0x06.
This layout is confirmed by rtl8192cu which writes 0x66FF (test chips)
and 0x660F (normal chips) — only AIFS varies, the CW byte stays 0x66.

Drop the misleading "ms" unit comment on REG_TBTT_PROHIBIT and the
outstanding TODO marker since this was the last item it referenced.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  5 ++---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 13 +++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3ca..4afba1252 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -878,8 +878,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_TIME_8723B);
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
@@ -888,7 +887,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_8723B);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index ffd039278..81105c55a 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -72,6 +72,19 @@ struct rt_firmware_hdr {
 #define DRIVER_EARLY_INT_TIME_8723B  0x05
 #define BCN_DMA_ATIME_INT_TIME_8723B 0x02
 
+/* REG_TBTT_PROHIBIT (0x0540) - TBTT prohibit hold/setup in 32us units */
+#define TBTT_PROHIBIT_SETUP_8723B 0x04
+#define TBTT_PROHIBIT_HOLD_8723B  0x64
+#define TBTT_PROHIBIT_TIME_8723B \
+	((TBTT_PROHIBIT_HOLD_8723B << 8) | TBTT_PROHIBIT_SETUP_8723B)
+
+/* REG_BCNTCFG (0x0510) - beacon AIFS, CWmin, CWmax (EDCA-like layout) */
+#define BCN_AIFS_8723B   0x0F
+#define BCN_CW_MIN_8723B 0x06
+#define BCN_CW_MAX_8723B 0x06
+#define BCNTCFG_8723B \
+	((BCN_CW_MAX_8723B << 12) | (BCN_CW_MIN_8723B << 8) | BCN_AIFS_8723B)
+
 /* for 8723B */
 /* TX 32K, RX 16K, Page size 128B for TX, 8B for RX */
 #define PAGE_SIZE_TX_8723B 128
-- 
2.54.0


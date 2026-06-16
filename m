Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A893655E0
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781638311; cv=none; b=PncsVNJHmO4sNAE1Ni2rf+fhOF56ttCgEaF9WLF5ncdoXyaGbZ7GGibsU9UqxZzq0Ddzt0h8lwrVz6LCaXsZutDwHGM11c8WE3DCQqdF+OgGrco1r0klhNmkmV/uTh09wUOWFlPTMjsIMzy/GUb/0kHsd/ofzsEux4uvkhVBPwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781638311; c=relaxed/simple;
	bh=3UyPmpWrfd3SVU+nu87UtjbJtvKWhfn4ZqGTaQw8w5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPZPJwLQAm9iprBHFyqmkNcc4ZkZNkGBPPbolk3y7i99MOSegwzxrgvWCDU7CLBC1Zd0oUdQ/jZCpr8sGmH68swvuJWioMgMeXsBBlH1zQnZfxAzhDDnB/ovILZKDw3eAEVS/ogB/AwlJBmlX/dBCTPUTU/V1M6a6KpewqRpTp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLQiH0yy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLQiH0yy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2882967f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 12:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781638308; x=1782243108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADHJ10MyAqhpiS/kGZ4gk+6ZPai50g4kBn6d1lBhZCM=;
        b=tLQiH0yyc2qUgNWKxejA3RMtBheq8Cc2vnqYL7Ax79YgIyfYhw1hd0CfeYHXzaUeHC
         5x7q6oqprhy26ENgPqvdPJnsSMQObuBnCf9tldeTa7gqD+1CXt7iK9OI65w2hMPH6D0H
         F8cXyJK7gmi3fZnMzrowxhPI/NcOo3cTssho5JfNHd7kbzI791bo91E559SOCpYi4uAg
         bC4295MvoyDXoZ7K6IYOsOLgKyIR6j4HTUzi/tjbG4zE8ifoIE+30TM6iw5kW9fymxMi
         eTeLku85igr4+wlLAIfgkEjwtBVljvXruwFRpRegEZ6H7Ta8c/nERVpePBPZbOG4GLZL
         Jaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781638308; x=1782243108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADHJ10MyAqhpiS/kGZ4gk+6ZPai50g4kBn6d1lBhZCM=;
        b=qWtG5DwJPPoQWr0a4nANvSyQ1iQDdUG9NnJ4q4FuJDXyOn0R4D8oVqdwlHKmK/2lkf
         YhVCYD+ttvvVRHjRNskXZFfFEHhPDVB+pHItDw+rSypACPdv7MQ4WTvurxJepaJT8q9g
         YMzaMSRQkF4QNztJ6hKcy/txBWPNDFl+q1Ek6TaUT7RTtSlpAVpmey25Ylc+SDPbJhmh
         VOqyrQ8xxWwl3aSD4pcfksA0JCmAZWUQlnrp0Xz+nIuefvEs16gJoDqmF8VO5BNSDsWL
         8C3LCH6BIQgmBIlcT4RIa4tcW0iO2/EgcXVexwgqH6dz6ak4B8q6PY2OybVjRfRcF6Cv
         wP0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+gnrias9FxqolQb6tEL2tsE4l8zcwEygLDgCqhLxoJtMBMBnXGA4hhAKAlMkse1zbRkljawOmR7iIjwbZH@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4z0yOnKyiOqGcBiAU6nOMVdFyy1wddNgaWgdXsXCgWx8dZcDD
	gfRFiSwj57UPRIex3q2QAFZQPQAT60708YOXG5Kzc6GE5kz0hE6WKA5Z
X-Gm-Gg: Acq92OGGaVoBIIauYyin0KaMg0/681zoiIdn4YOFa+WAeH19mjbvYT66ZX1LOUYi3ZB
	JC0a5YaannZy9Yb4CQ7aCLVTxw0v/EM6nBiR5rKr1U+TNeQM9yuInoVKKijQaw9twA3SVGWW2D5
	cDn79a2g2UEgEDpntHOhkMR/f1oPwJ2pkBswId9IutYMz8QxCcsbHKR4zscBTNj/Vv7CK7CsQ+Q
	Hqh99cbhv6G/WtyscuKVmlvOER1Ig2n32uXFXrQWnPgT6a04Jyri43zDb/uEUObNrE0dagDFhmw
	YBq7wjR9pwsVqldW1ZYTcaQVgVNpvOzksY5XvZByDGncABacB+Hp55L5PXDuUuPLp8TBQMmnrNF
	c2BmNrEHMhpTLszHSNnO31q+r1R+XRrNmSb8fieY6zoATitcbh33jxDF7pVdA+1zRvf60nNGFrw
	nTZyVi2k+Mxcwjht85yvSGHWP9PT8yqnmmnW37kyKUO+HPlOF/V1H36Eb/Nji2oQ8p2tj4JHm+/
	Q==
X-Received: by 2002:a05:6000:4006:b0:45e:f631:2c73 with SMTP id ffacd0b85a97d-46235cae48dmr1492516f8f.9.1781638308321;
        Tue, 16 Jun 2026 12:31:48 -0700 (PDT)
Received: from fedora ([196.77.26.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f726sm44346365f8f.15.2026.06.16.12.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:31:47 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers
Date: Tue, 16 Jun 2026 20:31:34 +0100
Message-ID: <20260616193134.1759947-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break down the 0x6404 and 0x660F in
rtl8723b_InitBeaconParameters() so people don't need the out-of-tree
driver open to know what these do.

REG_TBTT_PROHIBIT (0x0540): 0x6404 = hold (0x64) and setup (0x04), both
in 32us ticks.  Same layout as rtw88.

REG_BCNTCFG (0x0510): 0x660F is an EDCA-like register.  Lower byte is
AIFS (0x0F = no contention before beacon), next nibble is CWmin (0x06),
top nibble is CWmax (0x06).  Matches rtl8192cu which writes 0x66FF
(test chips) and 0x660F (production).

Drop the TODO since this was the last thing it referenced.

Signed-off-by: Jad Keskes <inasj268@gmail.com>

Link: https://lore.kernel.org/all/aiGMXBNQ0TbIGbpP@stanley.mountain/
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  5 ++---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 13 +++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b2893c..2cf1cd9d19de 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -861,8 +861,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_TIME_8723B);
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
@@ -871,7 +870,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_8723B);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index b6006110ad6b..aa7676828371 100644
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


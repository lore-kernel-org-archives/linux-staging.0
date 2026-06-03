Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26007335BB4
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497099; cv=none; b=bLF5Sc6oFMz2ru6gwbFZRfSu7ptvym3weQz9ndsCoAKRKTfpq422dINpP5sXXnyqEVwcAoQtl3pZrOoAE8qS9XcI3OfSKwhsnmUqPUAGd7TciwLwELQtrNP581/a/nbmGbXGsonaDrVxMyYkDsy7EjASVZPBtwgsg7XLAmdthKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497099; c=relaxed/simple;
	bh=PJVJnAZf4a7XwOjdpZ7SCRkj5FZGXwgZPu7OvbbLN50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tkDq7pp+jOUKtdAqYhvJT9qYfCHBIl3ORc/Ld3KxTBWDnWM3GYZtnSoMK9f7rnX/XMrHrt4jTyr/CaI3qmoevGaP7gcL8u5/s6jo0TZcia9ZvS5mcj0iCNGmEGnKrX/kDObLOfGQfbT88IROc4VqgMJnZ27dd4G/pbIN3ENV1Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p72RJBNm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p72RJBNm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eec22fab7so3570276f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497095; x=1781101895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3tQtc8uJKCPmpmDRcr+GJZB85OACAvXLNmzr/e668c=;
        b=p72RJBNmGyxp+W7ZUvINQPJVJ5zrXF2LPIsVRAV3vaMPmxzs5z+8uWjCeoZCXwQb5x
         ue6y9uXmoigmHb1UTpa9g74IfubHPfxpKgbiUCGPo31jWtA1Km8Pel7+YUtBtMh/RVuN
         JKQP4/x/JkySrFipOrDGxiCkzTaEBOsDzSAwMv1oBftFg6q1yaYgFk8ivSi0lSfQqjMR
         HH6GF8qzFDsdiraGzjzasRXm2jfZaOAy/sglXZC1bD6+MSonDQr5OYUw/PtGhKEo3fba
         U6QQdNovWovmnacBbPASnbNZh6uncSPRkzzKAd/Vv/31MAZ3jIusbuizy+Yyt2HLLgIO
         5VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497095; x=1781101895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3tQtc8uJKCPmpmDRcr+GJZB85OACAvXLNmzr/e668c=;
        b=C4RRH9pqEW5AvDV8nZ+gfM0YoUVPCTwDbcRU3mLrQgEMIvcRkyUFPmslxbaLv/Mc8N
         YrpZP8N7M8PXhGNLDMTX+XlnawVGMEigDlxHSdB4OVnxJBLFgAsCGxsAmitH2D8CIjiY
         2CSDvFJ1oAu9tMk3rHV/zWgZ8fJ5oDUs5mSH31CKQgk7ykTracs/nKzqRXAR09GNUX9R
         /lC9fBTX0+s5KBeW7PeEZlG8EXQinWLFUeFX5BVYncN6nDEURb3pvkPnFyaJtKajYrAR
         eV2ubheVA4HHWz+bYBFEIMsaw/SjSkTKYeqXbo3LY9CzxQ58AqbHw9wpbWWqJHv4gdhU
         H9Zw==
X-Gm-Message-State: AOJu0YzsbSBr9GJ3a6sk1RzN/GYGPmtyhkv0UPKPxrc8Ug0fQuIvYf46
	AS4+AyPY6HPF2jRz3ERyJ4hR4ACzrk5IOsiNodDxAR6jzwzR3sewrJoS7/cL+g==
X-Gm-Gg: Acq92OEfGA3xQrCLjc9JO5FhkFfPvydnuhpZvoGntcvLTbMjhJ0EZPTHcCLmiLE/aAc
	InQ1CbPZ2NUIevNtIw+KstnBFoiP6c8zJ271A9FsKczJejOefqB5Sf3BAnz7lTz6pVwX+ad40up
	0lC2dHhc3GvoFgmKWMz0uGEGFmS1TxUQuwymfiktPjfvCzBUcq+plNGo4RX+Os6HIMkPhg1lS9e
	aEctlosQ9SY+y7LsLOrqL9Q5zXk5gJ/Lg1QcXpISTg9OYVzIshRbFGEzBTs3ZXT98xk/6uX1Q6i
	nJSXmBcbNbZA5WZao7qkj2tAEHKiYI6an9QUiShkgaAILQ/EGdtWRPz6KibH9ES/l/Z7HzhmorY
	om0okF3Qzu8oeEHncHN5XzLmedu5c6cj1ezNHAIeJRVKF2yzLhJ0UTmlGrUywTYqEudar9ZKUav
	9mHafsLs1LOv1EoCqKkisbw2DuKFziKM9vw5f/32jo7VrADEI0LERSRygj3DoQsrwQeWXkcLJtU
	WepiFNup1wSQVfd
X-Received: by 2002:a5d:5e0e:0:b0:460:e4d:bd46 with SMTP id ffacd0b85a97d-4602181f3b3mr4268953f8f.21.1780497095168;
        Wed, 03 Jun 2026 07:31:35 -0700 (PDT)
Received: from fedora ([105.156.125.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm7448183f8f.25.2026.06.03.07.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:31:34 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace magic numbers with named constants
Date: Wed,  3 Jun 2026 15:31:27 +0100
Message-ID: <20260603143127.343103-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the magic numbers in rtl8723b_InitBeaconParameters() as requested
by the outstanding TODO comment. Replace 0x6404 and 0x660F with named
constants defined in rtl8723b_hal.h alongside the existing beacon timing
constants.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 ++---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 2 ++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3ca..c5da5d0be 100644
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
+	rtw_write16(padapter, REG_BCNTCFG, BCN_AIFS_CFG_8723B);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index ffd039278..311acfa0f 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -71,6 +71,8 @@ struct rt_firmware_hdr {
 
 #define DRIVER_EARLY_INT_TIME_8723B  0x05
 #define BCN_DMA_ATIME_INT_TIME_8723B 0x02
+#define TBTT_PROHIBIT_TIME_8723B     0x6404
+#define BCN_AIFS_CFG_8723B           0x660F
 
 /* for 8723B */
 /* TX 32K, RX 16K, Page size 128B for TX, 8B for RX */
-- 
2.54.0


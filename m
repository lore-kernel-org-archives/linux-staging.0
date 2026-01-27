Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311623BD05
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476903; cv=none; b=XvkXYLynqtyUKy5SeapEqPugpYJXYPeeLQxrFwoQsXsqH5r0Byw7d7WuclxEmR/OvIPjtrWGKdMeE3UVhfQFYCeUz5aOAVWieQxpak5ZVyMFi19A7wRoq99qb+ewnL7R9xtPprQQYOevyoEfPblmz9/ydKHzjiuPZyjerlEh3Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476903; c=relaxed/simple;
	bh=80FjncwGZuJ9Nro7Dr7mfYeXwQJ9ergg/exMx3Y6LlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQ4TSj1E4/xJo/81ZNVI9RDLC9bSWMyjpFOqPiuwM5K/GnIZu2hKW5VrC3Yfq6N1x2l86ZVLgA0nzYFx3LHldJFolTEqAmqeP/4CNxwLeU4VQviCD1dDFHD+3IispqPAyw9eP/TXX3wHSW7a8X7poxanQ+fhaxBLCj3LWFrkqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOuukDhz; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOuukDhz"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fba1a1b1eso77273457b3.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476901; x=1770081701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1gHCfTEYsbIh6B+hXKqc7pg35lzBRzrciYDcVDzMoA=;
        b=BOuukDhzbvhTUjvZiRxFyQus+2TPlUjRcNsFaH1Usdjha7SzrKKm7sxSEuQ6+yFjxk
         r771N07tBI9iIiAzzFz/xcShmES5huLxN+K83eXuafJwLbO3xAvy/59CRW1XcDinG0oE
         7IgfAOztfBE9rgvOkJ0/zw0oxY0gd6uhmAiKR5wW9Bus8cf86qyay7dVePwHcD7QvPyV
         N0fSt4Gn1cvgo1mMHin3+wXLABXWHDarfupidbMNSHE1zYP5w1ploDg1K+wkWsiMfHsz
         hEm4g0/DrTByNyx1YStY24L96YeT7YCpTjZ6A/ewrOP+DsWgCuPv2kc8Ep437ONyAoAL
         ++CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476901; x=1770081701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1gHCfTEYsbIh6B+hXKqc7pg35lzBRzrciYDcVDzMoA=;
        b=QHlxz2qWXYfpKGC1tZi/1JMWCjK2/0G2EYT9EGx9r8WeaZST1Xn1KhcfXGGM5wP+Yj
         aK42Ar0DB/rplGOxVwupU1x+DldzIxsVcwvv9FTgUXcdHmY3yHfmwYCwHrOk4FbZE3iy
         zV7FjRLWjB+HC3JVJOp/hTfmgSIakPSdKdtJzM3ejFMo/mNE/Wf3KjnLoIXqacsu5WBD
         8yLok6UcrPx/OhaPBUzKNsqqGn2SU9sYpX7asw73IpcKjP1sg1l1DsNNfgHmnEGCcycG
         fXyfJ8nbE+O9aw/itsScdVaepuU427JtvYagaK9kTjaMcgcr/die8GP3sRT/YqWhafP+
         z74Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdYtIrSCslmPOevv66iRl8LBI5v8KWZBIMe8c+c7vqNq4xddrJDOPHpgbHCJeSQ1U2LxA9wImk7Mww2/e3@lists.linux.dev
X-Gm-Message-State: AOJu0YzugWfy15E1KfssXO1wklsggzijfM4R+xsNmb6FPw/OOf97D1g0
	J20tfeQfznVK0jO+5OVQFuY5xJ+bRt6k/vrG6SNU0r6HPOYID7XM8CR7
X-Gm-Gg: AZuq6aJAxJeUI+73gxJQ31EUHYzRGAntk221kIk3KIGm+7ODonru0TaSEqqwbkd1h6/
	XvzD5b5UsMqJ4KDVMT8zQe1G7x9K6udlwLHDt4+Zb9FJD+Mqx2sM+p+0yJg+HmKRqKt+lmklrat
	cu5t4/l+dQyhT9WwYbizBgkISF7b/m/CSA7eIGhUzU9qP0FZFQwabICwfc48ud1JlO994981k38
	rLT6MbsYBU+bYgQ3qAQALL0v0uF0eFy4uT3lYXzqPZJecJwtIBNk/nyFDmIKADuGyQ2kzvLFlj0
	UElWQVelx7wm03HWRMV8NmcSjdxTyd3trQoGH5yiIa3etIBqur3IaKwoGIC99pYdDuKqYUIOQ6N
	AOlgcMPRQGK56W+FRzqERBzi21I2SUGLp1MRtm9eT0tYOP450c9VU1xCgbxell7vBdlI=
X-Received: by 2002:a05:690c:e3eb:b0:78f:86cd:5626 with SMTP id 00721157ae682-7945ad8d8admr42857867b3.26.1769476901347;
        Mon, 26 Jan 2026 17:21:41 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:41 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 3/8] staging: rtl8723bs: rename RegPowerBase to reg_power_base
Date: Mon, 26 Jan 2026 19:21:13 -0600
Message-ID: <20260127012118.43037-4-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127012118.43037-1-ethantidmore06@gmail.com>
References: <20260127012118.43037-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename RegPowerBase to reg_power_base to avoid CamelCase.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 3 ++-
 drivers/staging/rtl8723bs/include/drv_types.h  | 2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c    | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index e7e355b41747..1a9a4bb15bd8 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -752,6 +752,7 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
+	struct registry_priv *r = &Adapter->registrypriv;
 	u8 BW40PwrBasedBm2_4G = 0x2E;
 	u8 regulation, bw, channel, rateSection;
 	s8 tempValue = 0, tempPwrLmt = 0;
@@ -772,7 +773,7 @@ void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter)
 							else if (rateSection == 0) /*  CCK */
 								BW40PwrBasedBm2_4G = PHY_GetTxPowerByRateBase(Adapter, rfPath, CCK);
 						} else
-							BW40PwrBasedBm2_4G = Adapter->registrypriv.RegPowerBase * 2;
+							BW40PwrBasedBm2_4G = r->reg_power_base * 2;
 
 						if (tempPwrLmt != MAX_POWER_INDEX) {
 							tempValue = tempPwrLmt - BW40PwrBasedBm2_4G;
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 847f29c7f3be..e1efc14e86af 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -158,7 +158,7 @@ struct registry_priv {
 	/* define for tx power adjust */
 	u8 reg_enable_tx_power_limit;
 	u8 reg_enable_tx_power_by_rate;
-	u8 RegPowerBase;
+	u8 reg_power_base;
 	u8 RegPwrTblSel;
 	s8	TxBBSwing_2G;
 	u8 AmplifierType_2G;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 1558045f9366..02e01f0f0bf4 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -262,7 +262,7 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
 	registry_par->reg_enable_tx_power_by_rate = (u8)rtw_tx_pwr_by_rate;
 
-	registry_par->RegPowerBase = 14;
+	registry_par->reg_power_base = 14;
 	registry_par->TxBBSwing_2G = 0xFF;
 	registry_par->bEn_RFE = 1;
 	registry_par->RFE_Type = 64;
-- 
2.52.0


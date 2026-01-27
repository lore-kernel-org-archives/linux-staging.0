Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698323EAAF
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476904; cv=none; b=TsZijBheYXnTpVOe1+5rgAO0sAmMF5RdMEgrsJpFHPPuLXbY2Gj1g+LRHsb7UN7GlZ2eZMZaP4MU7Kfpd8BRnRlcv4OJBck54zxsj7aSN/ArMLuGQQXMk7UwmTvUl5DQ190DFRXjk/LFQkVgc9u5Ro2YT8LSlvzrS76TZSO8uTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476904; c=relaxed/simple;
	bh=x6OGEEPZObwhemIh6rI/KuoqEUB6UqPzxOiBV1d7xyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd/i/RovQb75Nisgerz13YCHmfRMmPiD736/cd4pf9LZWqTkRgME0qMcl1FUSKHCMHs/tU3TPZoU8Gp//EqEDahaVCsueJK+CQGjemo9TFDIq+65nV30yjAjbo+mwb49pYQShRtfaH91qgTMBhnZ4YZf2nzwVqoiW35IpjJmvqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWYkY56f; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWYkY56f"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79088484065so45672037b3.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476903; x=1770081703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFbj0Vj04CxifpaIIawJYRMpCdzoB9mlcxTLOX7l6dI=;
        b=TWYkY56f4eV9CB1xegi8AsC+PgXpqNNx5DOVOt6kdshWOESc5HBpa6O6AMWlEISnkr
         qBf2X+AtczwmwT6pkZVeB1rJiPKyuIKzEob+HvPSn5TYiqFAsyu9ZnPLTuzI7YrIvBGU
         vgLnagrE41cFlQVh/r0XDv9JJWZfMQGL2DWb+9gmsBqFbedTNQ5ZCyKKycB8nVtqcmTz
         86wgE9yXvQO/oP4Pycd9ukhEsd1kjtiHbM4IOVGaMrM2SjuJbi8CuVIEr/n1HHs7b2yN
         SvJ8AUhPECGZ3Zbc1FHiZ7k6lZpRWoJO6qpfZAI+y0QC7m+dm18CBmv1h8U82HHrYhrw
         PL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476903; x=1770081703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFbj0Vj04CxifpaIIawJYRMpCdzoB9mlcxTLOX7l6dI=;
        b=lnITkML82KfqmtOIJIa1e+bkmvxE7Acsy7JAoGltlywDKzKOIiaQsF7jiTy6U2Bv4N
         n3zaYcS2VSbZ4woOyi5E1q/TOl7MM1ZCOe9hM7yCmyUl1ZB4zXgev3nDdr3XLUIxFLKg
         T4nU/gP8T+86qbLmKupy6PYsGR8qzCov5V4FGmA6qSR6ujzHHEdw3h1NaaigtoPhGpsF
         YXqWymyY1O4itofvQkdN2ClSqwJMfPETSSY7hfpz6ERhWzTAI2JndlYkX+rLWbRRvkNq
         LIohWJW7ZsuqCUpmyE5jIKkpmNtk152NSElAmwj1d0vXkH234k2e09luTrTv5pNridbL
         EEVA==
X-Forwarded-Encrypted: i=1; AJvYcCVud0dqCakoUqgDRgAXdcJarHtZh5BcvpAoPu1NYxWKiPDLWl7Y8zzNXAA/Y1fQVnwyDi4bUCGp4OaGVMeJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzXWLcs/3nSGKkoGTlcBTSkyN9TlUC+r3eRRyOGZsAdb65Uu3CL
	BaHd1jkQyKwObORuzzDnarxw6lz7LSX7cRKxsd/+tVkAshVGkCbvCLP4
X-Gm-Gg: AZuq6aJcyV8wy3UNUNAIU+oPbrTZXaBHdNmvBG40TuFtjBYjgrjmYx1C50Qe2xu3atX
	4FHZdjLWe10x8fpt6J8toIs8W7rLqabxtQ1BbLE77O5vyyR+m4gfsVQHgGO99RpMnHikyIV+W4i
	u2L07TjUo89G68Gy4kLG5DM099Y3rTmp4qMyjlQeehblhAvT7G6LBdTRNRtYXSCcgU2IekffKhc
	QHDKrSZPOGQBsENRUip/4KffgWUHdWRbOyTH0Lnzbv1CujwaVjq2yItWWoIKPc8KltGDiT/Y2Wy
	xlw60yLsgttJfrrT2qzdEXbCiXYWN8OIDVN+Scg8jjjWB/2YViZXcNF7zxVaiUD+nv+zodqe5FO
	pHx88+VNhbUDSrUrB6jS5ixjW00lZds9nlfWc5sQTjy0j0ha8IR4InjvaXMR1tpZRuAk=
X-Received: by 2002:a05:690c:102:b0:792:768a:897 with SMTP id 00721157ae682-7945a9b5389mr108589817b3.45.1769476902673;
        Mon, 26 Jan 2026 17:21:42 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:42 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 4/8] staging: rtl8723bs: rename RegPwrTblSel to reg_pwr_tbl_sel
Date: Mon, 26 Jan 2026 19:21:14 -0600
Message-ID: <20260127012118.43037-5-ethantidmore06@gmail.com>
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

Rename RegPwrTblSel to reg_pwr_tbl_sel to avoid CamelCase.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c  | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 2 +-
 drivers/staging/rtl8723bs/include/drv_types.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 1a9a4bb15bd8..dc2da49e6738 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -696,7 +696,7 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	    (adapter->registrypriv.reg_enable_tx_power_limit == 0))
 		return MAX_POWER_INDEX;
 
-	switch (adapter->registrypriv.RegPwrTblSel) {
+	switch (adapter->registrypriv.reg_pwr_tbl_sel) {
 	case 1:
 		idx_regulation = TXPWR_LMT_ETSI;
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 95ddb34850bc..6d5e531505f9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -536,7 +536,7 @@ u8 PHY_GetTxPowerIndex(
 
 	limit = phy_get_tx_pwr_lmt(
 		padapter,
-		padapter->registrypriv.RegPwrTblSel,
+		padapter->registrypriv.reg_pwr_tbl_sel,
 		pHalData->CurrentChannelBW,
 		RFPath,
 		Rate,
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index e1efc14e86af..3557d7365585 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -159,7 +159,7 @@ struct registry_priv {
 	u8 reg_enable_tx_power_limit;
 	u8 reg_enable_tx_power_by_rate;
 	u8 reg_power_base;
-	u8 RegPwrTblSel;
+	u8 reg_pwr_tbl_sel;
 	s8	TxBBSwing_2G;
 	u8 AmplifierType_2G;
 	u8 bEn_RFE;
-- 
2.52.0


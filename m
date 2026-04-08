Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623711C5F11
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644339; cv=none; b=cBAIzyAftGDRvNkwe32yv2LYWHGlnIJgtLTg7S40hzfVD7M6CvvDcSShie8uOqFTcCxvpQacaaOQbMyaHC5uF0+tomfgJXQjZEYw7E1Et8eI66X0/XNLYOHFQ7kjPvRKlRBnVn635HvF9TdGsTQPuTU66IUnLjbYN/jSTb/837I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644339; c=relaxed/simple;
	bh=dfbguBsZjfIvEwmm6N598RhBO0V0/4pM0j9nNdjaCrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdRlM6XEk3AX5Qg0LvWQL8ukflSjk8EngqTUzMn5m2I0fnSB6mIJ3y3iLKZlgJTfidL8R0tHz99JHoKZDlPdxmNvL36P2rhLA3GJXzmEgcKL/NvatfT7xVNnsNk3llq9cFys27zsrLRTI2CFRaxItQmhWM0P2ba4WFr13H5QBpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmV93eML; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmV93eML"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c736261ee8dso2052258a12.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775644336; x=1776249136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bdZgLJOy5AUvRPMJkuud7eGB2yR+Mw/HA22zLvIjzo=;
        b=lmV93eMLhAklvMH/BwJtYqgSMpO1ke3xDw/smjkoz8cnXlaubAByv7NeCvnUXNuCeg
         kUX3TgbS/Mo4BAHUnYwNWrlkzPcABRFJnpf3mclEP1uMx5gQL3m797qubq54G8YrfXli
         bKyIakQmFlbfyFDU7AMTx/UeLJ2jji8X8Ji7uPIIiodYwnCSKf6aCBd9P8p7fslBXNS5
         SnjvX5Y1bB5Eh6/dEzj0rYBRsthtfNCBjaeWdevbkwujrjmbYi6Z33+aqup7TKaOd3iS
         Fa2KFfHUqOLe3lhFnATXRdG1fyRQAzgvUcqUFEhwvUC7y69ExlQpEnrHFwS3zhC/6q88
         +u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644336; x=1776249136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bdZgLJOy5AUvRPMJkuud7eGB2yR+Mw/HA22zLvIjzo=;
        b=dSbNlaUaByiFzVI1hjnDt7HZSuisn/6WDy8SXKr91d4p8cYziGUe1u6xkk4S5c6Pf2
         Fjb8V+qzHFtAOdlSISvSuEpFD+4kQnKtAZn9jpGHLriunt3l3exxCq6xzOhEQdjT4Vj2
         Duno5wPOS8AEYC0TuGlU+iibqe9a1bLhpfG2IuR5Y9m441z+NKOP5Bm56znbLJsfEv8a
         P5fm/nf+kkZh6tKzvSijnTX8ZRv82bJneIY2epHHX3V27shntuI7EWGqkqUJMaJAad95
         5014vNvUSxCTT23gu3Sc/WRtBeTA6HypYVsZaCfKHm62yie8up3Gns0RJC5F9fvtJWf8
         C3JQ==
X-Gm-Message-State: AOJu0YzUEszLNkkkbzg7rvocpIJhUwdEz84qDTR1XfAyBmsVg0AuiQvh
	1Lv7R86Av2/ft2weXyFMwRLFqTOTOfnl3Cs0ufRk595uirZFod3zR7mFBABoGw==
X-Gm-Gg: AeBDieurQn5SsyRZ9NQ49Qe2QfdR5XJDzDX9y7jpqxb0xvgY+ziRZs6eOBNdfElnQKe
	XO3lGM6igF4x0o3TRdxJvzaUaEKaLBNLN7FZxT59KRhanTQ+3Ocm2b/VR+a0yA9SJJCcXRw+54P
	6wvpbCgBogzXW0fZJTcQMUC7klGkLrE1H7bZKBAXiLvvzrKPWK9qcaK18dhx7DdAtP9z+psznyd
	uCbeYAvxRZrKJs0xaHcRTVhJ5OJHpjjqJVpX4K4U83OzULE1+sxYepOQh+YZI+LytQqWxo1Oc0y
	2TJeDLdPhPsa1DuBTCrp9Gt5dMiBj24ip9siGGKgowMasER6rrS83HN7ucDw3YIMGjfrCxj8uV5
	dRtFd4Xpt/WAhY9We9AW+F1zjHdfVT/pmtc8pcEsHVPFY1tzPIS/5fc5Jp5Pqpkso9Kh5WYKuyq
	IaB2NqLnUcrEQD6ZOyi09JivO+nExhnsshuQw2B1VECkg4OjReowMz+Q==
X-Received: by 2002:a17:902:c409:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2b2818e31femr229415095ad.32.1775644335639;
        Wed, 08 Apr 2026 03:32:15 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2b2749a2e42sm186003265ad.56.2026.04.08.03.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:32:15 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH 2/3] staging: rtl8723bs: fix casting and alignment spacing in rtl8723b_phycfg.c
Date: Wed,  8 Apr 2026 19:32:07 +0900
Message-ID: <20260408103208.7682-3-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408103208.7682-1-osjin83@gmail.com>
References: <20260408103208.7682-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: tas0dev <osjin83@gmail.com>

Clean up spacing issues related to type casting and function parameter
alignment as flagged by checkpatch.pl.

Specifically, this patch:
- Removes the unnecessary space between a type cast and the variable,
  changing "(u8) value" to "(u8)value".
- Adjusts the alignment of arguments in function calls to match the
  open parenthesis.
- Standardizes the formatting of multi-line function parameters for
  better readability.

These changes are stylistic improvements and have no impact on the
runtime logic of the driver.

Signed-off-by: tas0dev <osjin83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index cfa00775341b..498f7b25a2b5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -395,7 +395,8 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
 
-	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL|FEN_PCIEA|FEN_DIO_PCIE|FEN_BB_GLB_RSTn|FEN_BBRSTB);
+	rtw_write8(Adapter, REG_SYS_FUNC_EN,
+		   FEN_PPLL | FEN_PCIEA | FEN_DIO_PCIE | FEN_BB_GLB_RSTn | FEN_BBRSTB);
 
 	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
 
@@ -531,7 +532,7 @@ u8 PHY_GetTxPowerIndex(
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	s8 txPower = 0, powerDiffByRate = 0, limit = 0;
 
-	txPower = (s8) PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWidth, Channel);
+	txPower = (s8)PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWidth, Channel);
 	powerDiffByRate = PHY_GetTxPowerByRate(padapter, RF_PATH_A, Rate);
 
 	limit = phy_get_tx_pwr_lmt(
@@ -551,7 +552,7 @@ u8 PHY_GetTxPowerIndex(
 	if (txPower > MAX_POWER_INDEX)
 		txPower = MAX_POWER_INDEX;
 
-	return (u8) txPower;
+	return (u8)txPower;
 }
 
 void PHY_SetTxPowerLevel8723B(struct adapter *Adapter, u8 Channel)
-- 
2.53.0


Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D93CAE70
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160739; cv=none; b=bhcNlbVbISClOXZVKt2v3mctRpIGsOud5vOnZwlrugI6Mpy8lRYoT2wi+dhor2MoXrlXhERZPlzQUPxCq8dnUmuLLFSJ7GVJYLWKoPz5nyqA5eOWb25tAj+ktp+qwsePyTk8MKEGWn9uWXly67iDvO2tHoXIKzGduZYki6pkYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160739; c=relaxed/simple;
	bh=pxMSSpzTLO5UeiUp8CLwwrcEVNmCEQ/Ow0zOH+bQHBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LCM+Pe2XJG1U9auBTzCORZD6idSc4ceVFW5lH/hhEQdoFfhbw4vQMLKJwMnFWMIIV5s9E2kRNi5LqUoy6e8d4FDtpU3ULFfnTKxON0DOAoUB/ibGdhmtD6CT4L18+WY5KMTdUVGAUF9WzP1yzjgpR6Sce9FKJLVxZ5EQHEmjg2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcQWW+Xv; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcQWW+Xv"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so5153445e87.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160736; x=1776765536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4j64YQz7u7NwJcOeHpnDvtT07H4d1QhdIc8T2tCMk3A=;
        b=gcQWW+XviECqv9SyXc4MY257kQrwvncYyPLCXv4X6Z+JUZV0qCY8sMIX2N0DimY3nd
         s0Wgzn+rG4txwJmyiCekkVx6avK0JaMlHhW1lITiHnVClqKKCKH3+VU76+/PTs02aryM
         tbr/4KBVpHLlbOr3AhvBprsFNkKS1TUjGD9z2P+Xlml+SKMbXp+KBTqC40AIDyOgoDh8
         3vEDwyObNARmRYPflj9Y3IXpqJrLfsnO10PLuboTa2JvRafl7QkG4tfKlfztKN2hZC/U
         8HG40o0B5aW04mpCvJZqxo74i6/5U9zf52jMHEE3+DJH+LC3FHG1Z44p4isX9Cp+TjNP
         Gnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160736; x=1776765536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4j64YQz7u7NwJcOeHpnDvtT07H4d1QhdIc8T2tCMk3A=;
        b=aaZJs/RU+kn8H91l1j1tClZ6E+8ED8H8dmmEUuGVFb+IEO0vpGJ54PJNS+rBsTzj+S
         kOuT/5lT8uGWlEhus+Bg10ZxessS4Ya1rCt797FGTIrgxwWtLV3geA2GjWF8pMfkaTfU
         59wluEBqcxQtdnMSTjzVOwV7SE1bI3WZBOOny55npyFdkWf9iQQy+crI3bJJ46yR9tgX
         cbajmcvVPkxEYWHpAuFo6igV+oQmbVBCkSWOXFJGYhd8tJCpLCzk1rNNyXmx71hDkLTy
         cq4dK4ADgd5ptGO45ScIQo65ZxATNhXo1l5OmY2IJgZxWCYdCn0hbS7rsYmM+YgLH4dL
         gdzg==
X-Forwarded-Encrypted: i=1; AFNElJ/a2GyQtB09FgDKW4t7uoiUeX3XcuRnGCTBRRIYy6V24yfhsBr6xyiA85rxApDvb1TeqQipttIIvrQPm6ED@lists.linux.dev
X-Gm-Message-State: AOJu0YytFr7XYZy7ogPqPbqyTW5qiLk/MSl0g7D6bevauWoC/DisMde5
	SlZ96wAcRHziJKkwh9ab3ORM4UnPwDJedOYsLiOci1KgWUkG58dP8GJC
X-Gm-Gg: AeBDievVD3b8/p4Ycr5VXHmCWZ1z6TXmbPs8+YakUTdy9srSz98OgUXbeLyxVkLnpuZ
	MgTRpLry59+ymeKR7uKHxbtdpYLCcx1oU3HwurKXaApCaKDxUVAor7o5A6iE01g3IFCorafOP6V
	Ocr9SKRm9HjYZPoj5fzO/U0ny83gxy96xIduFhBG3wTMOonyLktZ1YjaiqWaTTlQtGa+NPejlGI
	uqh6n7IJ7zQqY4zf831TjkIhtAgvqtfnuIPJQjy7ETWzVfTolhdAskNlwWIahnNUB7YMoy+FY5k
	Nrj0yfV65d4ze2OCrx1wc/5SAOC7XJeG8JdPSh1ON6fQIdk3y0uKpIgQwQPozYysqwnzda/vlXZ
	r9WBbXYMaT7jIqiC7HOAJKnWxPjpl81wlDrbH0gaI6sj9pyvinayicr0u2RD3tmBKgpwpNk1ain
	kyFENLeNf9dGFyEA==
X-Received: by 2002:a05:6512:2243:b0:5a2:9bef:52bf with SMTP id 2adb3069b0e04-5a3ef7007ddmr4819848e87.2.1776160735710;
        Tue, 14 Apr 2026 02:58:55 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:58:55 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 2/9] staging: rtl8723bs: fix space-before-tab whitespace
Date: Tue, 14 Apr 2026 12:58:26 +0300
Message-ID: <20260414095833.76480-3-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace tab characters with a single space in macro definitions
(EEPROM_CHANNEL_PLAN_BY_HW_MASK, REG_RF_BB_GAIN_OFFSET), the
dump_chip_info parameter list, the pHalData pointer declaration in
SetHalODMVar, and the BK/BE/VI/VO tabular comments inside
_TwoOutPipeMapping and _ThreeOutPipeMapping.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 0c3e983a1b2c..07e4da49d757 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -30,7 +30,7 @@ void rtw_hal_data_deinit(struct adapter *padapter)
 	}
 }
 
-void dump_chip_info(struct hal_version	ChipVersion)
+void dump_chip_info(struct hal_version ChipVersion)
 {
 	char buf[128];
 	size_t cnt = 0;
@@ -70,7 +70,7 @@ void dump_chip_info(struct hal_version	ChipVersion)
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", ChipVersion.ROMVer);
 }
 
-#define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
+#define EEPROM_CHANNEL_PLAN_BY_HW_MASK 0x80
 
 /*
  * Description:
@@ -358,7 +358,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
 	if (bWIFICfg) { /* WMM */
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
@@ -395,7 +395,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
 	if (bWIFICfg) { /* for WMM */
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -410,7 +410,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
 
 	} else { /* typical setting */
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -708,7 +708,7 @@ void SetHalODMVar(
 	bool bSet
 )
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
+	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	struct dm_odm_t *podmpriv = &pHalData->odmpriv;
 	/* _irqL irqL; */
 	switch (eVariable) {
@@ -786,7 +786,7 @@ static u32 Array_kfreemap[] = {
 	0xfc, 0x0,
 };
 
-#define		REG_RF_BB_GAIN_OFFSET	0x7f
+#define REG_RF_BB_GAIN_OFFSET 0x7f
 //#define		RF_GAIN_OFFSET_MASK	0xfffff
 
 void rtw_bb_rf_gain_offset(struct adapter *padapter)
-- 
2.53.0


Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D759C47DFAE
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119879; cv=none; b=JG5YEyj27KT6XqVQGWUIU/Yklfrw8VMxVzHZQLHwF+A0Dq4nyHyoeZP4/hSsG8QVhZwd4fzT+tdabu4qItewOj4cKV1c7wpYEQywME43cEC7ildGdeL0lc4ISIhJX4sGnRURARJ3M0PBukm/Jx2GL/n7G6ULSN/oA6b/XGU4Q7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119879; c=relaxed/simple;
	bh=4UMnNqvjYlYoBVL98iCDufghaVBXrJyxQ7ZYTuAFCco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzy6dYKxUNcBX3siEiOdaaRF2GJMRPIPX1SY8rV5hwRfAxVGaew4TzZnEM5BBR4ldu4q9t3k1+iV85uyD25sf2c7iJKk3Ke3jqQvtckVbvGMklFrK3K+bEdkppiswJn6R/Q0cFRBIg+37697XBtTFJ4cJb1qmOLQVbVepNcGx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBlDg0eL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBlDg0eL"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b01cb18515so5051613e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119867; x=1784724667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4u9zgrmxiREjYwS8Qv0Serfz7FqeIq0lu9hAYsQr4Q=;
        b=IBlDg0eLiJCXSMCD9iVyLvng1z7T5Nh9bi+MNFWcEUNdf7I9JwXIrdRwVzBvJH1BCt
         FKJZ85od0Vqp2RP5q+rTbPXHVna/OtIWGaMVUo1lrFf0sTlla+cw40g6Z+C4Ez6I1Lvv
         xFrrg6D4uyX2fgPm7Bvzoyp+9Jp8f1GfbxVyLsN5y9PRQqWzQ4zM68l/R48a7ZkqtVzk
         9mMDY1/0ZdPv0DChEULtelaatXNQ1eb0/f7N8zMxHbWdOEjTP3sLmdRKMyuWzQP+6BTm
         TUxpgC9EY3l58s9RIhGvDiRciw+djViqJJigcPjD3C5Cp+WXBAioDr4nLX6gwQ0PFZwv
         BnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119867; x=1784724667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4u9zgrmxiREjYwS8Qv0Serfz7FqeIq0lu9hAYsQr4Q=;
        b=gvf24g2p1pZRM6o0rRXxDaw8i5KyWZfzlW4habmPIIk9+c+1Tleh6qFpqorqEE1Oxg
         MV8QYOhuv5vJYzy8iwQ1fx7lGF2iZaImitaBR46okxTG+AMqH1pH4Iw92ZEJHoiNDvDz
         8pF2RsKOea9pAXyu8HVJUGal3UJvIGPaFXaCo5bkgDRcqT8PoYxYJ5IJt2GYncvufyCh
         FiX9912jBhSoRq8HHvrAWtS0tOkH9cTCMkW4al6LLpl227XyrIVtm3Ks0DEV8WSgsPin
         raJ+kzISDXGxllC6gmGzu4nb2P6IC89u3yuFb726VMwv5XXVyFmV9SXIS+ve3uks6kPn
         Pegg==
X-Gm-Message-State: AOJu0YyfKR2RUeGKO6Ftm/vcC4m/9Kb5/emucZZRa45oY0/fNhrv1x7k
	9n1hRl8cvgD4XZsSN73cc3n/ESfugvAZNzed48iUQitZygZ8FbeO+7i4
X-Gm-Gg: AfdE7ckPpGukee0roUi1dIYb3Zqkda5V/ne2jpLQv5/8Pgcoq0oT6Qxi6Q8LXHr50hw
	CsHRy88dqDUnak1zZMNIJ6bao9KMtuCPDyiK7mKIM/FNopPgoPcIdWj7qw11IlXgw1lKQ2hkXmr
	xjOpqMQAW+HPsItfGYwNc0AU0f3dEcoFDOppuDwACAma+IaW3fuDPtJweHEwfp+56lFwdjsms2J
	CYSccYxNsg3umAvFEnN1fj6w351+2Q1kxrFCiT32zYiDmhPa74PBqPu5NoCA0LkuGrRViMRv+Ez
	jnp3I2NpfA5PW3OJvSIrJ1kET6YotQ/F78OTHdzo83tp16zhTvajPs6NydeINOvCVNX/dVEW33A
	X3Nk6+cfuvnjcqojquMpDSqikmAsQen9Q11rk/BZ7ypx3jr0q+ISfAr80GkUI4CTTanmVx5oTer
	TwUT48bIfh0J18d98qCF79AveLvrNwdDRm6gol4qzevb0VyGG5FfvWR79my1iLeqQMCDAKi1XDH
	ZPdmQSY+ApBBQ==
X-Received: by 2002:a05:6512:3e03:b0:5b1:5061:e5d2 with SMTP id 2adb3069b0e04-5b159b86efdmr1520546e87.30.1784119867382;
        Wed, 15 Jul 2026 05:51:07 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:51:07 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 61/61] staging: rtl8723bs: fix tx power limit lookup by using correct channel index
Date: Wed, 15 Jul 2026 19:48:29 +0700
Message-ID: <20260715124829.90290-62-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In phy_get_tx_pwr_lmt(), the result of phy_GetChannelIndexOfTxPowerLimit()
is erroneously assigned back to the input parameter 'channel'.

Since 'channel' is never used again afterward, this triggers a
-Wunused-but-set-parameter compiler warning. Furthermore, the actual
index variable 'idx_channel' remains initialized to -1, causing the
function to always fail the subsequent validation check and prematurely
return MAX_POWER_INDEX.

Fix this by assigning the computed channel index directly to 'idx_channel'.
This resolves the compiler warning and restores the intended hardware
tx power limit lookup logic.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 7ad04aa85..bbaedf256 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -718,7 +718,7 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	if (idx_rate_sctn == 0 || idx_rate_sctn == 1)
 		idx_bandwidth = 0;
 
-	channel--;
+	idx_channel--;
 
 	if (idx_regulation == -1 || idx_bandwidth == -1 ||
 	    idx_rate_sctn == -1 || idx_channel == -1)
-- 
2.55.0


Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67F45D180
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842123; cv=none; b=Qbx6dZdnDrR+/j0W5jQ2nNmeZzQUdxx8dbwck7wvpM3nyuG0kv+aPd7Iz0g9LWgSdEU67+i7ApIbCxIyTh1DGDV7YP8tRlb+ck1v0mZVc6bawGOpIQrPJEYZLyf8j7MxswfLFX9ATyEGmec90WClQ28DFPS6B2plhG0h+dgRjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842123; c=relaxed/simple;
	bh=uUSiEeKC5Jhes4/hJQI0INTXZFTq0Jt5W/fbROuMR2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vpci+fm13Eeotg5AM4Mafj7q/g6Ene2gXN2qI6HJcwmm7FmhzyrFx/RdcWjdjT9+wOaeXdJ8UEVJ7e6Me6nEw59A/hPDc9ZDMleLTVXsPPXfkVvS2+LJGfI0XuiEn04PkTaId9+VutswMz1jd4N1ptqbgDC5C4dZAeeVfdhIWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqDtXElj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqDtXElj"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so2730426a91.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785842120; x=1786446920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFBSUwUZyXCkVYgyiIaRGQdZLsjpXGpbkt70ey0xKsA=;
        b=jqDtXEljNxR67c2UZcJBTuI3eit063z20ztZ7QiWrgM8p9DTffMEXx3f41uEYCmhMn
         i2H5kWnTfgIo0kXp/C32wt8980yDiQ2XzK51TU8fyoUNIO62+yYTageZgihtRuGRWO6K
         OhmYIUdsyRrZPktLkVa555+E7d8odtBgO1qW0zToqARB+sCIktpGPzBYnbbRVN38NrmH
         rRSet0Ub1dBVgVj4x76TxoLGIovmr2Ac3P3R6TZk9BwGGN3lxn3iVi0ApU8OTFCSQSxB
         0caJsLBKqQ/XoKPndiSxiLxkSYX4c5CaaQ0NorwFooL/rjb36sG7LvBDSi8g50IFqvNv
         7cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842120; x=1786446920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFBSUwUZyXCkVYgyiIaRGQdZLsjpXGpbkt70ey0xKsA=;
        b=Rrxs1c+LmcdhWSotekzI8fjSGMY7FbMK30otqNj96IsPptGdSyg8gNdUx5QQmRqtS2
         8iSpV43xBCf00eBZ4vL409Vdo8/7lBpNnSveP8OJPYVEbTMQMmCVcohrYAs85gdfdE5R
         5oVM5eKuJJKgegFbZ2d3mlylC5230vnjdohA/bWm7Fki5TKU0eiPbPPIA0Lr0Nx5p0ej
         aHYDL5ScEoJ2Tq8HvDFoexaftcz/cujkVN4ZwRJcj2YqfYOo22qeySSXk5IWbceEVP2N
         lbIlh8Pc4ChAI/phHT9D87B0R6bGgDil5MoRjRm9P/AhwBvBOFA1Z9cSMFlqOsjtoypt
         XDTQ==
X-Gm-Message-State: AOJu0Yy2nMhm1DbBP5da8ODr7aWp5RRd+iucJ093sxaYq0oB33A+46Z3
	PtTna0F1dBge0c1vBIEx5FDSzIzk/ptz7oIxpdYURFBxeJ0w3SHvANoh
X-Gm-Gg: AR+sD10MH8/hK1gxifXst1okKUK92knBoajY2k7gBtfQnCgANQiZ6e55LMnVichB7Mp
	ZkqLldfpXFHV83Qm2UzkgTkiDmCLIUb88/zmXI5zhb+JJUIT9oePsqVT9sw8RfFrRLVVzsuJXtZ
	rDlK81Ogmrh+yWJQVs2/+5nPJI/OjXsNOTFGKmsCEJxTulaL2nWjiQ1ufSoHIluofl/kgpvf+rI
	mOK1Tvm2+jMeA2+I0mWTF2MIfdiphR34mzHnKibZhBXFt5+ENb8yaKfZWADBQL/mHXzSWknPNbn
	me/WweiYhoIFEIoJYDRYw3q+Du1pI4S0NlqSgmKPsOaKne2dyEm0sw/f+fOB5H6X5BHAQga0NkH
	dUOSmlv4wLDJybNUmrFpyemZTjxfQJWRlA4OHejQ3reMeYrqAxGQ3Ox/68brT7cPaK8FinxzlZk
	YHP7l0fxMtBZBW0H/NULVdXD4VVO1zs72JMKiiq7rFMyAYgzMMvqG3XCgwLUXKKqGcM6Hyib6DM
	F/kZd4=
X-Received: by 2002:a17:90b:3912:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-38fbc0a436emr13244133a91.0.1785842120417;
        Tue, 04 Aug 2026 04:15:20 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50acddsm2750601c88.3.2026.08.04.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:15:19 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v3] staging: media: av7110: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 11:15:04 +0000
Message-ID: <20260804111504.21958-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v3:
- Formatted as a standalone patch (removed 2/3 series numbering).

 drivers/staging/media/av7110/sp8870.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c03..83c6ee305d6 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -92,7 +92,7 @@ static int sp8870_readreg(struct sp8870_state *state, u16 reg)
 		return -1;
 	}
 
-	return (b1[0] << 8 | b1[1]);
+	return b1[0] << 8 | b1[1];
 }
 
 static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmware *fw)
@@ -167,7 +167,7 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
 
 static int sp8870_read_data_valid_signal(struct sp8870_state *state)
 {
-	return (sp8870_readreg(state, 0x0D02) > 0);
+	return sp8870_readreg(state, 0x0D02) > 0;
 }
 
 static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
-- 
2.51.0.windows.1


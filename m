Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E41624D5
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119832; cv=none; b=tI4cpfrbXuVyJS1WloSiODy1QZFOXRibAGjqNyVvlVXb7mByySN7eKaDwCXspxI8huUiCC21JoL3hcwf9Rq75HMsytZHhpj6pqvujTH+wuidtS9E2DSVgX6mTR/RTvV3HuVZBfhKGaM4dVujS7SU99Q/5Ljnvkfo7vIidpgaEKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119832; c=relaxed/simple;
	bh=W6BRbQosy9+VJxJ2NnAs6tVHo69WH7Dj+Y1Gx+AlapE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nF6cnuC9bhGzmOkZI/U6FlqB+RKQwBtUVqj4yWb3aB/50S5iKi0wMSxvzSIjCZrfxFkdpxABYUYBzOZ/sb2ivOmgna2QhaKhBtAbkGAiwyBLZO5YTkl6Cv9JoS9v9xMGh/t31Nd6tS0dRKhuPnHPKsdRmAM4n4MUD38DcrBlnGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PL/dTlVH; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PL/dTlVH"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b01910b499so1871676e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119827; x=1784724627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PFnaOg+lw5Xf9qwyUTIHf1OlvU0B0nTlj+WhmVz3kE=;
        b=PL/dTlVHa+njFRY+O0nLwqnOnbNjcCckPKgrwaVGYXXAHUv1xkKWGhxdyX4Gn0eKc2
         JB9Zepnjqd0q6URtWoE8WK5cY2bd0iIfQ3tWSoI7GryjoqMkwQHJnFSmVlTOWk+0157I
         HBOc/kx8wYZiCFFBYwr1nzezmKmU3MdvLKcEv5esEYcT9RnRMJAFx5Bte+DLyZMt6ght
         WaR2MO7czVGDETZbZVwxqU8kzh5QaE9Cuz6OmUrd/mwVj57X1UmsCPEyC88YQA3da+p4
         VHhAFtgPiG5If/M7WNwt28Q0LeW6xiINMIUL9H+meNwn2gEa5o7uuiNzLYhwwLQzDkwZ
         ElBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119827; x=1784724627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PFnaOg+lw5Xf9qwyUTIHf1OlvU0B0nTlj+WhmVz3kE=;
        b=VvGF7wyWO/nUZ/66sgIddXOADHp8LLxcdDswEsUxWw8FzotmsTgH6suIUiiOOKdLvj
         fgMl2YKAvjD6kGx8S8c/hsOmWppyHsDzqVOmVKKu9UcGG2XbemcnNYjVwpQlsNUJ8jpM
         ycbSrGpKf7PhecET1MeDhiyduAKIEE0CpkeL+u0TQ+CM6yqyfuEBby4lL/iLRpoP/U6r
         oOW20UdIAaLXB7RJTsm2oyT2GBau2XWh95A/zAZPv33BgFP5ikLpUAkJE72Z++BALoe6
         GWwnv1NRnA+ZEZ1CyxTAvJVIc5S0T6FsOMkrBPKdBSbXkCFLg6ooDxOiB+Cy3OICTOzJ
         8JYw==
X-Gm-Message-State: AOJu0Yy3O6LgnYUl6pRBeAHDORfj088LSFyKWiH2BrsiagX/ewZFTSD1
	lPtYkZNNq1AV8G2zm5bG6624dlXNQikR0MmzVMUhgbAhU2P0nXjwpdG7
X-Gm-Gg: AfdE7cmfl6fmh6u12KKktDwPXNk+9IGHR/ML86hm3cYaA+kZs+OORobH5rZYDoDDRHv
	P30dyJNYgzPIAVqrn3TB6A1+hGUCRuVrWDLeDN3uzoTHVrujRueHLlBgBXvAkoPBUpeWE4CEkBk
	NhPOt+KsD/BZXl+MRupQion6XbbiVkeIO2BCaj7eOGQHQRbWk0UE0t0R4/UNeZoVthhzvvT3fCJ
	29S7JPYompJxFf39n3xPXdtEzA19ybpjRdpYqglfcOZJ8Q8/ve5SVHpgN6uYME/T8/p/KWodTpj
	oPikCM9EkFfkq4BJS71UaZu5Nq58iDgKB9bPeawXWAdoI27N9KN/RenKcWYMDaKVNKC+XyhyM3J
	q2yWoV1UUT6MjXxo8Tq2FkHPgnvlz5f46QT8ak7wlr4rP8/MShtpcZVBZVdZHVv0Kv71+AuFXJa
	8OfRzRtJ+QtSq/3AV0Z31krMtZ1OVqPcouORPpgiMoB9SB7Bk70CfXstQ+hhA4C7WZpBzQU9u6j
	VWIzWsYutsdWQ==
X-Received: by 2002:a05:6512:68d:b0:5ae:b2d5:202f with SMTP id 2adb3069b0e04-5b02ba1e9a8mr3277797e87.21.1784119827029;
        Wed, 15 Jul 2026 05:50:27 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:26 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 15/61] staging: rtl8723bs: remove unimplemented halbtcoutsrc_GetBtReg helper
Date: Wed, 15 Jul 2026 19:47:43 +0700
Message-ID: <20260715124829.90290-16-ulijg308@gmail.com>
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

Remove the halbtcoutsrc_GetBtReg() stub function from hal_btcoex.c.
The function was never fully implemented and simply returned a
temporary constant value of 0.

Clean up the codebase by removing the function definition, its
associated prototype in the header file, and updating or removing
its remaining call sites across the driver.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 195ccc4b7..c66ca6f73 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -729,11 +729,6 @@ static void halbtcoutsrc_SetBtReg(void *pBtcContext, u8 RegType, u32 RegAddr, u3
 	rtw_hal_fill_h2c_cmd(padapter, 0x67, 4, &(CmdBuffer2[0]));
 }
 
-static u32 halbtcoutsrc_GetBtReg(void *pBtcContext, u8 RegType, u32 RegAddr)
-{
-	/* To be implemented. Always return 0 temporarily */
-	return 0;
-}
 
 static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen, u8 *pCmdBuffer)
 {
@@ -808,7 +803,7 @@ void hal_btcoex_Initialize(void *padapter)
 
 	pBtCoexist->fBtcGet = halbtcoutsrc_Get;
 	pBtCoexist->fBtcSet = halbtcoutsrc_Set;
-	pBtCoexist->fBtcGetBtReg = halbtcoutsrc_GetBtReg;
+	pBtCoexist->fBtcGetBtReg = 0; /*not be implemented*/
 	pBtCoexist->fBtcSetBtReg = halbtcoutsrc_SetBtReg;
 
 	pBtCoexist->boardInfo.singleAntPath = 0;
-- 
2.55.0


Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B5F48C40B
	for <linux-staging@lists.linux.dev>; Fri,  4 Sep 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525408; cv=none; b=RBVQmjt/ckY9pdMoW0NDNC+OTMFiJV+ekGy4Gwr8ZB+oDNvbcCiYvIOzW/F2BjtEVnVcghusQyxJis10dipweBr4PjfGN4NomjPxVx/4XqjDxL+e72ddTl8WCi8m6ir3ap1vVCQrLXBEpknSy8jByg5P5blNX/r7RL5jWzQTyOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525408; c=relaxed/simple;
	bh=QNNRVumQq4JEXJvTCZbkFGKfH9cZY/K5oi5R01sEvPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYFQJ1QG82hYQxVTZan851Y8VkGzgRN4UY3uL9koNUlQmPF1DuXD7F9nNStu87TeveLgNSNqfvZDZ05Ilr3v/2YX8jzjEMX1L4cOeFZYJFKkiRqkL9TfWwfaTzAGGAUneBtmjICNPBrINO6s8br54G7raRG88q7I0aUq5cl4t18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cORc58bD; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cORc58bD"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c65d654c23so403992e0c.3
        for <linux-staging@lists.linux.dev>; Fri, 04 Sep 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525406; x=1789130206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqgbPxH8oR+AVK0pC69qx0+ihlzFG8XVWwWZQ32tFQk=;
        b=cORc58bDbw1yWCA2iAneY0IZ1COB/l0nfOoCiArDydEMS6C+MKVVHwB0qAJ6mC01O+
         MRGNpkKH8UOw8ft3vG4n2Unl5qA4GfNlrvz8vcIhqo7gttZqFRzR9ixz5b82pfWztt0U
         xgpVGAOE5SX6VoAhzo6yz+XjvnCoA3TXdqGw6w7CDmmQNYuKPczneIksYeLfv/oOaoFy
         i3WuisLsubqVK0yFWhcDSx4IAoGgHB/DGhcGV0jkD5ANicB2hqsSR96WhuJoItziEwjM
         lBH+ZjhzvLCH4OZW61XI3Hl5U712cxOEU1bBBRrJJ7gDGLJ3H3z4IQH42q6LTH7/IFmd
         AKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525406; x=1789130206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqgbPxH8oR+AVK0pC69qx0+ihlzFG8XVWwWZQ32tFQk=;
        b=OsjEH3gMRlsynKSGNH9YBTWhlDsH3W/N9JiBnvacHdpenE5QA28sXWwFMrbXxszMoz
         FNAHmlK9aBaRKuTa1lBIZFAg52Ty3FyTER6RzoS0x/QyTe95Viz/bIPNNWCuodkd8Ozt
         U+JSR8A/4wsO6FOcLzWdewvq0T6Bai2O3FQDDueZPfXKeKjeD+pVipIW8ZLOGXzgfSVv
         GPtS+tYD9AB2CMg4iOl4AuhmuQTt2QwDK61lYU4+MKPlOWfINu6BkfcwMqvLaRpun5VW
         EL7+DHTUZLKrYPIwZtKvhwnNT+snm+NkFym3n8JgfOAij4QEKfU7OJJ3OSD3wgn3Jc5Q
         8tQQ==
X-Gm-Message-State: AFuF++n04BuDtK0O5zgUvbX7fYs/pHE1pM5DAW6184uDvpVKsL6GPPCr
	3+8KBl9KjhnzRjAJ+8iz1W37+oiTb90l6QLC7Ab3YO7JJEZQesZHg8j6
X-Gm-Gg: AYBFou1h0gbWVb+FlXTgwAOx+SxePMmJqXsnHx/1OSmFBDuHkpqiBbT+q7i4fMbXdvs
	kqPwQZ3eK2IUP8Q0kDBC7PK+tuLZWWXXuwkVcQqlmLvK63t0NBLa/iduRJv2Bc7LGh2CcBgvWKc
	CPuyZlZRza9WFaaFLAa33AS+chh4q/xWd5icLus/zND1cZe1rVtcueTaweURdUkxFD0GA2KfeZB
	XqhSSD6GQ23T4QNqZNfVwtGbmjhgV+jGVnpBkQlOyxVUsa5FlfDenIpmicA6jX1XSi4de4R1cfn
	bkQrZQhTUTyNjWeWGOVnV9Qy/V+IMaR6myk4m2iHt++2pportjvFMJm/86oX4u188TVmwRfD835
	4X3qQc1t5flooeiDM1BvnGqNX6fkTsyc5v80y8D1UaotYDGo9vEH5px8Y5HZndodnBCbgD8Rllc
	rT7hsX5mZtYzZZ+PPLW0gtqv7LdwtgRqfAyHuKVJjTzVinMokVqGL0
X-Received: by 2002:a05:6122:3128:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5c7ed3c7515mr2219527e0c.4.1788525405797;
        Fri, 04 Sep 2026 05:36:45 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b36cbsm1924498e0c.17.2026.09.04.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:36:45 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove unused AMPDU burst mode
Date: Fri,  4 Sep 2026 08:36:22 -0400
Message-ID: <20260904123623.175042-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AMPDUBurstMode is never written anywhere in the driver. HalData is
vzalloc'd, so the field is always 0, and the sole read in
_InitBurstPktLen_8723BS() is therefore always false. The only use of
REG_AMPDU_BURST_MODE_8723B is the guarded rtw_write8() that this
branch protects, so that register write never executes. Remove the
field, its enum and the dead branch.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 --
 drivers/staging/rtl8723bs/include/hal_data.h      | 13 -------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6a4a13544c..1389e5598d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -868,8 +868,6 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 	rtw_write8(Adapter, REG_MAX_AGGR_NUM_8723B, 0x1F);
 	rtw_write8(Adapter, REG_PIFS_8723B, 0x00);
 	rtw_write8(Adapter, REG_FWHW_TXQ_CTRL_8723B, rtw_read8(Adapter, REG_FWHW_TXQ_CTRL)&(~BIT(7)));
-	if (pHalData->AMPDUBurstMode)
-		rtw_write8(Adapter, REG_AMPDU_BURST_MODE_8723B,  0x5F);
 	rtw_write8(Adapter, REG_AMPDU_MAX_TIME_8723B, 0x70);
 
 	/*  ARFB table 9 for 11ac 5G 2SS */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 57a18da67f..614fd88545 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -12,17 +12,6 @@
 
 #include <hal_sdio.h>
 
-enum rt_ampdu_burst {
-	RT_AMPDU_BURST_NONE	= 0,
-	RT_AMPDU_BURST_92D	= 1,
-	RT_AMPDU_BURST_88E	= 2,
-	RT_AMPDU_BURST_8812_4	= 3,
-	RT_AMPDU_BURST_8812_8	= 4,
-	RT_AMPDU_BURST_8812_12	= 5,
-	RT_AMPDU_BURST_8812_15	= 6,
-	RT_AMPDU_BURST_8723B	= 7,
-};
-
 #define CHANNEL_MAX_NUMBER		(14)	/*  14 is the max channel number */
 #define CHANNEL_MAX_NUMBER_2G		14
 #define MAX_PG_GROUP			13
@@ -240,8 +229,6 @@ struct hal_com_data {
 	/*  Auto FSM to Turn On, include clock, isolation, power control for MAC only */
 	u8 bMacPwrCtrlOn;
 
-	enum rt_ampdu_burst	AMPDUBurstMode; /* 92C maybe not use, but for compile successfully */
-
 	u32 		sdio_himr;
 	u32 		sdio_hisr;
 
-- 
2.51.0


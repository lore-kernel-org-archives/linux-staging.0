Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0251B2C11EE
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564462; cv=none; b=rSUnkmdpPMbMWBzf9xwvVlN0WtVDvO8A8zy4uMy5WgCK99mZxKlw/Hc5VVrH5ePaS1b+0TvkxvcbJmujSsxIoMzS7sswixCSbx5QspYO4GLmNqYWUK6bFhXYwJwGaczTCzu6bL0rQfk6t/n03sWFC7hKwxZYa5RYUeiWQ9sXYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564462; c=relaxed/simple;
	bh=IDlpaUKStiQhQ8vyL1NwxNt9GUcyq+eQw9dshPXHi3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CI+DOi6majXKwz7E4WZQmnQOmSsMLnVMT+ZLMLPskJYe5ZAlnUCV/lMiJ+jUDWMxcvKla6RFYGKP4RQytfp0KAwLAfO3U2My5UrDI5Y5XymSCi1IVV24HWcdIdbbMoW3bIAGIWjSb9QCZNuPPAIjFPU/viJid3w6it2ZR2y3o3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7QPo+Kd; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7QPo+Kd"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e08baf860so7897763a91.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564460; x=1785169260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZMvj6kxLJDso/c99mnKL3R+TUdD559MAriWt6uyAHc=;
        b=m7QPo+KdA2u4q/zJmtbrypd3qibXxXw5oB0DH0/BgUIXM7ZHsaC+ecdtc4bhe6J8cY
         Vk9eU61zxoDxPpKddJ/aHTEv5bGyRMJpU6fUMSjchsT8Wh4iX3BbFmv7FQKPSIFBlJrt
         h8Oncs+lXb34v1ZSPaRhaTVKnkkCw5Pz4FG/jZkhJgAz6EgrAVbac2qU+f27eR00P3Zu
         tYghbUM9dMCKd6HbvkpF9kdiBMbWGdHeTU34Su23YGiErf+emXe9e6Q8CmQcscHYhwWo
         OwU6YANZN6fHnkWIC721zpbJtPtQSAKRDH5J7qhiXelqQyPP+gRlSMvcO/5+mu86taEP
         TU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564460; x=1785169260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZMvj6kxLJDso/c99mnKL3R+TUdD559MAriWt6uyAHc=;
        b=PYppzbstffhcKcV/44raiyRs4bRYohdobyPRhMzJt9XI44p02dmwrk82kjtmPdUxCr
         0AfV2BJtdz6iwyc6Lu06nG+/tgvlzxEaxo4cg5dKjtS1oSCe40tfLEBEaDTtY/V8DoWC
         udIcdCCIiCkTltjUY6ooLs2o6MKK6JwcO2FuLAqyc4b0b2a14NtfYBcBF7ulo8EYdSex
         oUlZfQ0XM7Oq/9I66qNh0wcCwE6erR++wiWcggGuWoTHx9rTLJXVPxLgVEXHUdI3h+cT
         haavsvl+l/qNKsDhDiphb/gPrBXBtbkBwgnQg0jZ8mxCRmK8nvNielxJbTkKgCffY+Qn
         9ENQ==
X-Gm-Message-State: AOJu0YyccaEIudj/cnnhi/cM0H1ZNfCPgPo7+DuO4ypYp3l/BZryM4Xw
	3u2/Aw4izu3MgwhOaGptN/fwXLSr4WXZ0+xK9LMEET2g8lX1b6lvqqUjUvJScMTy
X-Gm-Gg: AR+sD11qtgJOgK0LWukBKlG92rMSE5AXhIMvqT518dDiwHeezuhlHtdqRjU2iKlTwZM
	hsnRRi1VVHA2Hf/O/4Iz8eKGPaCW5Tu8+FnNa6qij0G1tglpuvwT/E5xkp/EYtFG5tZO3z6N3UX
	iYNYGwmC72Hdqo5puCldETq2aE04BoWEMnJMdHOUR6A1VbgnEm1JaqRFeNN62JYkvPmIgYYAuVh
	VXOsvCK0171ArbXH1bxEv2KizPJiW0QZNukfmNkOhXFXyZci6xDe9RqI7K2n7jQKpujmYZ39N59
	jgDmBanRC7ayx9FohBo0KejYjFy0kn2hR0K2ivhUNofypVm8qUS77rmDTR8Q9PeG3M499xdZxcW
	fIyjXUG09baW/9oyg8rm12BpdP0M7jyhmPKf9qgHmyyOeZWDAYSxa6jHAMhCX/VJf2IOWiBnjQU
	HdscfkdDLx49Qg8qG1zLqViNx6
X-Received: by 2002:a17:90a:d40f:b0:37f:eda5:5169 with SMTP id 98e67ed59e1d1-38e4b4474f6mr16026407a91.13.1784564460253;
        Mon, 20 Jul 2026 09:21:00 -0700 (PDT)
Received: from omarchy ([110.235.219.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd764fsm33218375c88.12.2026.07.20.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:20:59 -0700 (PDT)
From: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix space before tab in comments
Date: Mon, 20 Jul 2026 21:50:14 +0530
Message-ID: <20260720162014.641937-1-pratapyashkulshrestha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a stray space before a tab in two comments in
rtl8723b_dm.c, fixing a checkpatch.pl warning.

Signed-off-by: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
---
v2: rebase onto current master (v7.2-rc4), no content changes

 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 2276dc1cb44a..4fdda25969f9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -42,7 +42,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
-	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
+	/* ODM_CMNINFO_BINHCT_TEST only for MP Team */
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
 
 	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
@@ -80,7 +80,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	/*  Pointer reference */
 	/*  */
 	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
-	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
+	/* ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
 
 	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
-- 
2.55.0


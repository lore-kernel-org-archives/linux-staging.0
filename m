Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A783DA5A4
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742716; cv=none; b=BTtAkpQhGHGcueD9R0tyUFACAPrmKarp5sY0ilPtaKX3sVv7DPwSNnDjsYz0FoMpy4Scnn3jwwDpOsVYpFQqX7LF9fSFbCSaVZiwSViW65VkmmrBFoYqyKqUgjygZeRe8i/dK+N+Y12Zb8DlZV9GZUF3xjp4AF4Uy/n4+vYGPAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742716; c=relaxed/simple;
	bh=FRKDWcaI2dd+q/YHsz5EPwK/dwR9fegXhSXr8oRgp+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FzSGEJo9JOH+G8v5xn/K/pagxys1fa0YKjs97BgxXC2DLEnA9CWNfd4fxOynoBabctOUUq3qLdTa7bL6CRb4/4u+zCfofOnLaVP7ayABe3CV+lWLSH1+/PJa4Ew92J4NeWil1hHWanKWW3sCI+OqQvMQKq3dARtxbgyGn+dBzCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlMWkqT8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlMWkqT8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad21f437eeso5077415ad.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742710; x=1776347510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqVqgMnpwts9PCufMDBF0YteLxaKZEFLyzQXe30weDc=;
        b=OlMWkqT8wzo9uJAWWlV3LHFew4u+wrE9VcdWrnOotxw2no8jA7OmG4AG2ntQ65B3vy
         7mpf1THZpJTaHwVkRxfLgzXHqbh2WqkPQMGr3h6PLE8gYvcA9QFRr8dZZeMiyNSUQfHV
         bG1OiM66QNybjCFMJQfqCZiwcr0jcpRBFVZskiT9a+e8+SfbdfNoz3Us1gH5aznrmlzf
         cD6VzvtHqEKJSgo/Iiwx/J6TQgazJGW+vK85Rr3VYJgoPXeEvr7GJuXdQO4/4vef1hVV
         p2aetOPRtkS4w85FfBADUDchHu3HrHM2yeRhCws09PPTHJtGBSO20MfxpgLDYTC+MUd1
         t6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742710; x=1776347510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqVqgMnpwts9PCufMDBF0YteLxaKZEFLyzQXe30weDc=;
        b=fhZWZm8+GP7SrVI3sxdOoWunm57Y3oED1A07nLcjPEoeYIlBTfuYO9Tp4YIQ6OIM7N
         nHXa1+7I+VXuyUpxeo+/iQBd474g398Ww9ZA+tUZvNh97+5E/N4H2gYIF2r9y1BJJMus
         qvAoYnPOro5Lh8RoYoOnNpildXGRzuSIphmLg4+gVAx6+TMFsje+FzudQjJwb4dxURJZ
         fZe9eT+t5b4EPTwmBsjCW6SGEebTLXXfTJ2EZHwF6Mr3GKw+5JKyux6dk/e7kgS1fa2/
         B0aOnH1H/A3l3Uy5XerIzga/9dhk2cpH2Z4R7acutbrZILm2Xtgh+ajQcKxn5YoqzaiC
         1FNQ==
X-Gm-Message-State: AOJu0Yx2eFLC6yjY1oUAcL68B03mWqMMpiYWzxVpgUM69Rk7PXaGrJxy
	Ohs4xg/mmMdym35z+8AFxU6db6ItaMqfnF9+A4gjf98pycz2/DeQmPAt
X-Gm-Gg: AeBDietZCpVjiQdvn7q06nQSqBOKXELwDyOlKfpVCuNuFG4lqiSWbOSdVY8PoxZfvu5
	WrFlMiRNep02qYolPkFXPVYtwphnUKISHf4J8/xrwRFd8wOrxzjbCZcqPUays2clFMAONNG8Zi2
	72FG1JgNYLeEPPN9MRLEkulIiX6dbmJbVgveE6bSbGo8xgRjA2FBJRedvGCgkeGdhwPsM5o4mf4
	HeICIuZ66aHFy1mUp/6sm6cKyw/TGNQ89dVueLED5IU+q6NWlHoG0eR74pVYRDvPvzqfzEmoYAc
	M3/kSWXnsxN0SCrL47ok9gq895NMHUPtIC64i/Z8FYbIFGhQDAr7lFMS9i5lA5q3uWq2zMGDY1C
	0rUsASPLetiLuxo7GHIGS3S9M0vuKM3YyvN2RNMHWhTSQImUhdp4Wrns77KW6a+3C2LjF39TWsv
	gjXydrHb+wD7QC2VACnh3cGSRBwyirKWR2FOyYjaMfXu86YT4oAqE=
X-Received: by 2002:a17:902:b18f:b0:2b2:4f43:b49a with SMTP id d9443c01a7336-2b2c736e506mr23268085ad.22.1775742710472;
        Thu, 09 Apr 2026 06:51:50 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:51:50 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 5/5] staging: rtl8723bs: remove duplicate rate checks in PHY_GetTxPowerIndexBase()
Date: Thu,  9 Apr 2026 19:20:26 +0530
Message-Id: <20260409135026.137904-6-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code previously checked (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
condition twice - once for the (BandWidth == CHANNEL_WIDTH_20) check and
once for the (BandWidth == CHANNEL_WIDTH_40) check. Fix if statement
formatting to move that if check as an outer if check to improve code
formatting.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 2746da0a9846..45dbe1782bae 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -473,11 +473,10 @@ u8 PHY_GetTxPowerIndexBase(
 	if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
 		txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
 
-	if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+	if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7) {
+		if (BandWidth == CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
 			txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
-	} else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
-		if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
+		else if (BandWidth == CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
 			txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
 	}
 
-- 
2.34.1


Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF515FA81
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 05:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788674317; cv=none; b=fcAMa86pNVVFHMCFV0+PxQDVqyiZqebmmGsEOODR2hsHo0MEM93zvPKDQtFaSpRfBo+kP+JBPJQgfgZjaFxq3WTDLyIUom/pclQL5KT5d9GH2pgE3tJVxxbgeTbdWLVkQWH2Ch7qURXVOkIdyjSzFl51Bg+86zGTveE++fVzGMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788674317; c=relaxed/simple;
	bh=Qo2XfO0e0arylUGuLjHId9FyY+W+3JyvLngSyHl494s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TlQxK0a3cbZYJaZbPmAXffFIDbmS9YkC/1RVt/Py8yiLM5B0aB33jFMsepZHmTkZOBLop412F3l55zPX2K/KGsXmzAdZ0/+TE9fW9WgRYZKjz+MkAT96psPCmNG9GI0vRByppNxj4okMLR4jESCvKRNGjbqgZIwlAmzBhMNjc6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMFZrRPW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMFZrRPW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6d28aa26cso13452605ad.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 22:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788674315; x=1789279115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfCp5SBx8KY2AwwxsnN31uBIMlVP7WRHwnwz6trzEAI=;
        b=IMFZrRPWWSoyoboaWHzVVv6fvEdCYnY0kuLFDClk1gAIuGMFNsFKPIkQ8bmNJpwm8R
         dou9DNUBk53rT1RuMvJLsHzhouN78l/1Fu+QqLXBuw8nl4cBAucp6GEOcKMgJGGqgy8M
         AHPwqSq8w7+3rBRvRD5PQm+eENkCMeE5nwPmafewxvOttiamNNU4xVWIonDgQm80k1MD
         w+BfvKYFu8yIJzQy0DeLlbmbnfZEnf1x+KK2yka01+3hmtmvp/chYcsV2LyDD/kWEdDx
         /ok3Mm+ZWuG9ZU1TlGxzSL9KormfBuy4eYFb/GspN/nSFncyMjyKbalJKR4Tdf5djjfM
         OdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788674315; x=1789279115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfCp5SBx8KY2AwwxsnN31uBIMlVP7WRHwnwz6trzEAI=;
        b=QeUba9aA4dGx7aSSHejSxiq0YCxGL5PJHAP7ZihpTC//SYGnpReucQ2Re2rt3GtiDt
         bx1m0N4q9dLVaN/a4AO8mBVeulWgU490I642jpSnLVJlZx5kltNzT0dVcWLsVFGNHeQK
         9xBxuOO6uqo1f56ccJTWIiPMDCjau+ScXhDLh4AlsfSK5AQOMM3Ju5zsVZ/xgft3czwG
         XpVJzRwd7rYGQ1S1OW3uzCUAkONIvP+P8FR7LGZ/NnoWwGE3BMFXjaZrrwK1aOsgKTpW
         kgsD+VoYv9ZpMJresFZhF89bOsIBvOivsj3su8MLgybnihuyn4Eq/e0F3SIp/mWlrGFg
         E/+Q==
X-Gm-Message-State: AFuF++k7U8zmeoIupPkPCXef7NJhdZGCOx4H1v09nQAjEVF71XwD2wxm
	hlajVUe1yfB1+L4mVO0IFlckTuSZK+qB6jdJLqmUqVYL7jUjjbBIUvZc1BdvsJlL
X-Gm-Gg: AYBFou3WItByWBEaVZ7EXOGIVmLx8NrN1jz9NYq6Bg5Y3l4dohdJaFT2v1VL3/FZhQ5
	htrlwuRljFHTWire5S5RazpDVsARTq8YaUKBUDtK8qwfLTwlZ/Yho31J+HeGYrHp/ZCUNUFxl/5
	8uOLD97OpiSfthZZFQsxv6HTniVOco9tPjUyNGhpjWmFnA0oUu5f/oDJU5I7Ca4IP1C2lwS7j2G
	Ygb491Ly294GMhF+r0CrrGpvm4O0dN8Mo97XnZ4EAxtroNXadkl6/EvTN2VQ1OiXph3DMid2RNw
	tv2bXDp2aWwEglNDOnnPWbf1uijk//YzI7nUhem6dWKrEaIQQcwUG/2SzzJgMNmWcQT2ClibZ9V
	5ZYLi+WnLmsY5L+8b5J0TV5AyX1bVk95Z8S354TyzSOogOogDX9SWWa3WtgveObKmPWLO/GC9v/
	HMnHCB/R54stG1Dp6DTRh5FrAW/vqs8Kb89HieEJoPQK1KfFFyXXG3HWYqqNAc+a32srKrpLo=
X-Received: by 2002:a17:902:b114:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2db12757f17mr152875445ad.18.1788674315089;
        Sat, 05 Sep 2026 22:58:35 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm14067850eec.4.2026.09.05.22.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 22:58:34 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove commented-out code in HalPhyRf.c
Date: Sat,  5 Sep 2026 22:58:14 -0700
Message-Id: <20260906055814.6988-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove this commented out else block.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 449db21e8a0b..16a47197037e 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -225,8 +225,6 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 		}
 		if (pDM_Odm->RFCalibrateInfo.CCK_index > c.SwingTableSize_CCK - 1)
 			pDM_Odm->RFCalibrateInfo.CCK_index = c.SwingTableSize_CCK - 1;
-		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
-			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
 	} else {
 			for (p = RF_PATH_A; p < c.RfPathCount; p++)
 				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
-- 
2.34.1


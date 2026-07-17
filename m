Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16237E5FB
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314464; cv=none; b=QlE1KNMfEXYQFLwunMrxPMb9K4rc/T4vVpwtTe8sQbUsEIdWg7PHOsNap8YvIPZOqYX0Mm3GeK8jpUqxTxiQ7rpFOdzsMJp0ymsrWRh5S1/7ssaeBufnW7cMUctj23Zj3ZXgsXmbWNI3Pms8Arxe3p7Iv83vktcxwq0BiEG/As0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314464; c=relaxed/simple;
	bh=bcmy07aPHKD/vMzTJ6gG12H1lSMsm8ZnYB70z7beDIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYXEulGB9Pn0dfDSmQnA7jd106BKQzvFAAVMpoQxAVX2vRmZNAZhfl/dE1BAeEIjPeK9pEW2BmPLZCzF7ChcK82NWVZrx+jcvcmSEw7NOex973fSj1GA3bD3VwoE1MneZV7NpX1uD26xqWDiaPo35Ff29oeG/L9Wqx1qMqQYBmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkbZ+ge+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkbZ+ge+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c167bda216fso554835366b.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314461; x=1784919261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fruDIKtmb8LrryzopEwKTZuEWpqvvfkSG+eKtk7qTjc=;
        b=AkbZ+ge+Xk4lscwgcUQ/gG1QREwaOYBXFamY5QQsbVDC2HIelRoWkcIDmikskJabcX
         4Egr7c5yHZgCA0AhRPLQcsSg1/vLm35cShvcvxSW5NhSGjWyGbs0uqqA7gpgQiY6lAJy
         awoPclhfRuS+ONtb6SGRT+OiUg/6GWp3s2SquOs9E7sHxZZXQ9El63ZVNFNsqmzPitE1
         Ll6OEclXPacsWyOKL+0296nhs0vIN8bWDy0OVYIFY8PRVyMxVBC0OSVW4NtyNsvRl9SX
         BfNJiO+xMHrTmv+nazCYh/Q755neADtxwpDrBSjq2OQ4h2wNOhgkbq1k4kSID6xpqT9e
         weeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314461; x=1784919261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fruDIKtmb8LrryzopEwKTZuEWpqvvfkSG+eKtk7qTjc=;
        b=DiU4BYTMWEfoZDdQDajgPfm5Kr2Y5YyQjzTVkjxevgCbOyoLG6Njy/kAT5KvaGbcSL
         TmlUoYxddgroGg5r7HXN4VFTcR81R/BqtgU/lfPwM68a5VQ0JeKgzbLUMzl4UlhDdJTX
         pS2Hjd8AZebfYT4hflOx6hnDnri1hzZWhCEXFIuzaBYhl38esvS0JbW7Fv2Dbj6bKsMO
         iLSmHciTwCN5oyys5sNInbOueEp0has2rQ/WJ9Z81GKViOjiKQmXaU8PxwvJOzRibZPx
         FPyJ5Qjf7AOraOLDmYdPqpdOa3f4C9OLOYo7/FAzmBK7uZlmzfVrkrg+jIBufqlBWlpm
         gf4A==
X-Gm-Message-State: AOJu0Ywz1kcLPen0VYkPk3LKK3LAFnf68yZ8r1OArHHQ+pKtZIa9rUrl
	jUFMUw8l0ulfG8EpzQWe6MGhn3x7HvxXTnP/yw4YUcNL16s7iKJZdrGt
X-Gm-Gg: AfdE7ck4si1jth1Gqu9jJvPEFomDw2QbrTGYk8171O2EDWKpBZz1sI9/ir8Z2k7s7XL
	NTR2Nj+xCLuieW1FKdVHOAJ2SX28r1j0n0RjnpypNMXK8ZHgVDjH+EHq7kTeZ0i2wbLWS9w4plS
	YdvwS01l+k1MplQVgODsFhHggseiy9GHTzJYmDnGn9YQJCQ+5QFchMocJ5DgNditSQdiMDK6Cfo
	/btmuaMJrGdQ2Fgdzce5qFx7gluaD3KQtyL133Sj9KFLCKTDDleSk0XnKsE0R2mg12ssWxEMBw0
	M4Ji2FeXya3toPpcYBlohv5qqqOkLd7ckQQAYIv87Q+JSCYZ/RfGOw7Zldh5US7H6yNeRsRzkjQ
	y/3Q/SYndqvUke3y/b8UhCOksdRlT/2+JCbNNhPMlODi1WX76v2nkt/ZmFOswTaR1HfC2bzQx7h
	uJ
X-Received: by 2002:a17:906:c115:b0:c12:80a9:d571 with SMTP id a640c23a62f3a-c16b476e6cdmr195147366b.24.1784314461122;
        Fri, 17 Jul 2026 11:54:21 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:20 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 3/9] staging: rtl8723bs: remove unused 'bIQKInitialized ' from hal_com_data
Date: Fri, 17 Jul 2026 21:52:02 +0300
Message-ID: <20260717185407.56513-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717185407.56513-1-nikolayof23@gmail.com>
References: <20260717185407.56513-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is always initialized to 'false' but is never used.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ---
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 83e05693b5b7..ac4bc18b6f93 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1047,12 +1047,9 @@ void rtl8723b_init_default_value(struct adapter *padapter)
 
 	/*  init default value */
 	pHalData->fw_ractrl = false;
-	pHalData->bIQKInitialized = false;
 	if (!adapter_to_pwrctl(padapter)->bkeepfwalive)
 		pHalData->LastHMEBoxNum = 0;
 
-	pHalData->bIQKInitialized = false;
-
 	/*  init dm default value */
 	pdmpriv->TM_Trigger = 0;/* for IQK */
 /* 	pdmpriv->binitialized = false; */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 8b1b61e78fee..532b1635831d 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -206,7 +206,6 @@ struct hal_com_data {
 	u8 TypeAPA;
 	u8 RFEType;
 	u8 BoardType;
-	u8 bIQKInitialized;
 	bool		bLCKInProgress;
 
 	bool		bSwChnl;
-- 
2.55.0


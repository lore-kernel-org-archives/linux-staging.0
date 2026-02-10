Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7A22D4C3
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741164; cv=none; b=oa5i9TVkrCWMC1yMLoavWR80/6rfEwc+WUjNe4a3hOcoy9OqTN8lme/5AMLGSLE0jc18FpkAgjTthZS4Yi3f2LpRnYFfrX7RCQswgNIWTUVLUYd5r4MUXM2iOSgtpRcGG3E28vwb2DK/T0cMD4xdZd5fkZIaRvOW4ttQ9nZ83MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741164; c=relaxed/simple;
	bh=ITbvfcL/Ycgg3qiXKaiC6Lzj0GS5wCsE+setvUStlz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrJIB2hyERjRKIdiQuVkEm5FFvJQy9ikOMh/z7N2DUbw5+JLvsEJo7Uv9xcndi0+l1bZCw0i5TGRVyDE1miUrwrGQEDMhCz+sp8emn92SvPRMCS4cZdNDEd4DClzlk0AJEhZfjwzsQpnRl+I3TzeZUp2HaJYLpTR47XjzkH8rME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvYMuVm8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvYMuVm8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-658cc45847cso1599189a12.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 08:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741161; x=1771345961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Woa6LBV1XtTUaEfN947/YSiaGW93vqXWP2GeheCTD84=;
        b=QvYMuVm8ngzkQdU1ogrLGYZsB2SxFIZcIPIdy1j5B2iVJU/LTsles1ssZOqVLeqjYB
         VsCGTq0e7tHaSCPcjt7TIJ/nNE4X8mDvikajHsxupn3Qd8dtFtfEGBTwcO8W9b5LahaJ
         wn4ViVVxjqgU/Dg0xuLYKzc1bQNsM7LEAgw+eQ0j3sDLusaGVwaD1IPhlY5fuljuMa0Q
         jt3oBV6AbJKhEit9HMKZX6zqWC1CSxveKSoTL0XOAcPzT/KEHqVNSy4pMRTpgrjvU/RI
         tOneCnBHv6B3lBLGbbi802fl4b1Zp7ggAj2rHqR4i8AcA1fQKQL8nexEIl3+IphpQeS/
         zkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741161; x=1771345961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Woa6LBV1XtTUaEfN947/YSiaGW93vqXWP2GeheCTD84=;
        b=WG5kzKBIPH+UwMnkG+uzQ2pFakQY05qzXcI3AVhRcuUmRJokNRwWWuLD7m1FHNzvYs
         n+m6NHPxSI32VIWb7lMf+IOIW5TzyeMgSFOb+1kpy8Tm+qbmpauoLur869z+bXEzLOh4
         ITczZ+LCu4s7QqShplxK5qTFa7ntjyyqHpbrpgn56RJSuGzv3REE1YrUftGBbq/P3KGx
         czpGJIw40vBRUWTYncdpAJz87ksahcb4QI1inrRCRp0In9JriD9pb4JdhiW2UrJwawhC
         xu1rXxclyST6vdzNhFiJjDrHtoBW8g+jjJxzug42xcKHHBDKcrkTrlliPNf4sL0eHHhn
         ZqlQ==
X-Gm-Message-State: AOJu0YxwU7mCGYRQoMVXLrdZ6nern5cpmwHmlLy0SrCvO9Lw9FF0ja/6
	t5GqlXH0iKx4TMJcqOpGePlfQ1TP1hpcA05tLdxzhzfcuMIcGeHPjVEV
X-Gm-Gg: AZuq6aLD8Uaq1/To2MIESyFvcfH+xF+22e1JiuwwSuw4uJk8SoR1L4m1lxPM0QYHFzQ
	nVfw5YFwmwaT7Y/ZNMHD8sqOXyTMkpSrAVmW6/Aj2C37xkCQa+fyIK9/6wxxtAg3aDKsEXGiysR
	4mHtAYorkLUgsTypwWjczjK4hAu5n6i5Cynb0LMqAPImXZZmz8Rflk8hDsBRfP6Pg4uzsMA3pTm
	3EMNl09jOncnqhxnbsFyiGCj5+rvnRh5cPhyLkBYRfk6DQLFdLfH3a2zbGHt6NFZlY5YZmh/e0D
	BthbjL746KMmicnY/U8t3W/RgQrNPltKnLmGRJiRJlgNckw5AW1dzqsbix2mA86/x/yoduQkY3g
	y1xnpaITOA/EubiQ/tqLP3Kxyt9FWt+OoOvkXSvsa88ppXJgrFROajS3K0J1wq+avXEikYeU19O
	hUXymgwUzaIRuTXr6x1zbCZC2r9pNVk3dj8WmvAA==
X-Received: by 2002:a05:6402:27d3:b0:658:134d:d1f1 with SMTP id 4fb4d7f45d1cf-659841192acmr7950502a12.4.1770741160759;
        Tue, 10 Feb 2026 08:32:40 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3019c8f8sm211031a12.8.2026.02.10.08.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:32:40 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant 'Adapter' variable in HalPhyRf_8723B
Date: Tue, 10 Feb 2026 17:32:36 +0100
Message-ID: <20260210163236.46341-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable Adapter was declared and initialized locally in
an if-statement, but it shadowed a variable of the same name and
value declared in the function scope (line 169).

Removing the inner declaration allows the code to use the existing
outer variable, resolving a -Wshadow warning.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..f712d0345b99 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -208,7 +208,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
 	}
 
 	if (Method == TXAGC) {
-		struct adapter *Adapter = pDM_Odm->Adapter;
 
 		pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
 
-- 
2.53.0


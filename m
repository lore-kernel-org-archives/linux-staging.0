Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528EF15B0E4
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621696; cv=none; b=WX3phRqT+d8yLn+sPvFC/ovwOe304JQe6rZ5IAkh3ISR56uLYLZTFfqPSODMg+wM/aqD1u3wGVTZI55SzfBbbH0ykOAUYuIvN8b+Mt82j4Ssi05t2TsNfIA49uEe+55EtyliiCEkOdSrKsJiVAe1+FIQgVSHqNkHvhrAq5sF8zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621696; c=relaxed/simple;
	bh=NwG1+Wj9EwKQULRNQC2RBaRfhLvBJD2j01XeEUWx0HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=noaIe8W9Te4HnJ2SDQTc48mzfUuAPh8aazg/ls9XNfE9IIcWzLpCZp3VeVKyme73DdMc7BEtK5rrk/Rer5RFqlN2fLQyingD6Q7N3FiB3eMduzxeKoB+X41lruZBtyViw8F2/CJyQrm7lgZFbs51H/1TQq2nDi85GZFLyS4IGaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyGO2o1W; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyGO2o1W"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so4168294a12.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621694; x=1731226494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhrqh6evD3D/ak3hvNLHVK8bkDBFpxBe3o3ECuiVp2c=;
        b=AyGO2o1WecUL5F/ltKIruFRwZDXyXJEKCnKVn8QIMA9on6zoPPIZrb9lUhtkuZMNDv
         4ZS8/gujXKF32e3sEajrhvOpBaz4SQsDSedqDjtydBQbH6KIk3vRlPtQfJLeFPqwNFy4
         08madhYnQlCnnF0JpNS1gCXSEQrC7EPJAxoAlynVQbUhhwEcaSCEjXZn7qg1CbHGP2nA
         GJIja/VSmZCfDhkfFyL0UMA6Hg8Of0VHqHl7g/PZw1Ogd+epf2PzvFyRqbht/KQ83qdN
         KNY4oN36segfryoUzq0cfvpp8Y/qKiAIatXDqLOROUdY/907zBeu0/PiYoLlrjJvuTsA
         VX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621694; x=1731226494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhrqh6evD3D/ak3hvNLHVK8bkDBFpxBe3o3ECuiVp2c=;
        b=CG7ayERglD6E2Ynwz/mwha2rvdKf01e2/Tqd1iqWCzi8z0Z+BHeizxQ71OUlvvMewB
         mnitLw6yDFaYRkZtBroBno8zVkbm8FOh6I8i56Fq8luDR6PedO5riTDfUGO5mFfEGQNb
         20Gb/cRRWXQMZKYRLljb18+11nmjTZjGATJEllb3xLEAhF0SQ+sp1OjMWTBIgeeO+4IN
         VXLXgPDrsOjpZlmj0IKuT4RBTvu9EQlwhYZgkBVV4x1mMJRb2TP7X9r+dxU5i2TTUh4y
         Xt3Vrj8gyWcyScsRPGIt0UAcXtZbkuop18rtA2PvasLrKbUMb+kJ2cDwWFAoC6vMdcF+
         9XRg==
X-Forwarded-Encrypted: i=1; AJvYcCVaaYpBurlsewU3N/U+kCLVTG5hoALExrDcfjRS8N58eBfpZFwNcaHW8bNBfKsrbU8QStqCjRSxDSLhUOlL@lists.linux.dev
X-Gm-Message-State: AOJu0YzvJTUHEPjP8NqY61d1HuTVCHRrvDK0pvCSeIrwc6so5P59EwxS
	aWPS2k24PA0DjSg9ETM+/4Ai+tEj15obE1VVyRDwxII3zDPSL7+RsO0Ijg==
X-Google-Smtp-Source: AGHT+IFrII9FEvZRo5zbQYZe/IbDfG8BuKA5hR8Ye5W9KT3hoFXbU5FmwNTOB6bH14GaPocg7JnF6A==
X-Received: by 2002:a05:6402:84f:b0:5ce:c7ca:70ca with SMTP id 4fb4d7f45d1cf-5cec7ca71a0mr3751445a12.34.1730621693485;
        Sun, 03 Nov 2024 01:14:53 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:53 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 03/13] staging: rtl8723bs: Remove #if 1 in function hal_EfuseGetCurrentSize_BT
Date: Sun,  3 Nov 2024 09:14:24 +0100
Message-ID: <9259ce43226333a4ab4ba400bbfcaa2eead3f5d1.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove #if 1 in function hal_EfuseGetCurrentSize_BT to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 28 -------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 2659999404a3..49b6507f991c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1028,7 +1028,6 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 		/*  only when bank is switched we have to reset the efuse_addr. */
 		if (bank != startBank)
 			efuse_addr = 0;
-#if 1
 
 		while (AVAILABLE_EFUSE_ADDR(efuse_addr)) {
 			if (efuse_OneByteRead(padapter, efuse_addr,
@@ -1057,33 +1056,6 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 			/* read next header */
 			efuse_addr += (word_cnts*2)+1;
 		}
-#else
-	while (
-		bContinual &&
-		efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest) &&
-		AVAILABLE_EFUSE_ADDR(efuse_addr)
-	) {
-			if (efuse_data != 0xFF) {
-				if ((efuse_data&0x1F) == 0x0F) { /* extended header */
-					efuse_addr++;
-					efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest);
-					if ((efuse_data & 0x0F) == 0x0F) {
-						efuse_addr++;
-						continue;
-					} else {
-						hworden = efuse_data & 0x0F;
-					}
-				} else {
-					hworden =  efuse_data & 0x0F;
-				}
-				word_cnts = Efuse_CalculateWordCnts(hworden);
-				/* read next header */
-				efuse_addr = efuse_addr + (word_cnts*2)+1;
-			} else
-				bContinual = false;
-		}
-#endif
-
 
 		/*  Check if we need to check next bank efuse */
 		if (efuse_addr < retU2)
-- 
2.43.0


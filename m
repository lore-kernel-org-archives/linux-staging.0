Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21242F3C06
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665867; cv=none; b=hTXTxn8wo206EuQrxwdL28iVQEluIQgMMXFv9t7bDSZXfn4JEpJUZUA6xY2VPNE0kAU8PdiPbNsr6KYdKAJZQ9UyFW63fyzmCjeZmvbLxUyaI9w6NCWiqRGKZW/Cz/AjJC4R58TaWK2KtXEY4qJVAHbbwBSSBDLL/p2DgYpGCOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665867; c=relaxed/simple;
	bh=2VFoAxEsXC9kIU6YlGV+sXjGJjO7a8/yiV+fjzBXlQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=szSxmpID/jc/IPKb6iVXIOgrJxQEQRZpp675UCS/07uQjkeIF5qJrpwQNkOLb44s8vv/BMWrPSNwKxPkn6bOv5/JWDKXHrY2eD7E492z1KG37cwTNK812TRN04ZfNOTMuNIBSDq4R7uP+in8R1w+nRefTHMXDHJGPp7xWUQS/c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKv0h6rg; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKv0h6rg"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73cddf31d42so478040a34.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665865; x=1753270665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixmgEAzznPLZ2ZzWUNtrUOJK3M7+ud4I62i2D1aBa3g=;
        b=lKv0h6rgAkLpl2wZbVy8udWv06z1W3n3BbUDjhS0+q0Es1aeN4F49woQAYaxMEJ8/T
         k5pCGZqIVbtHx5J65eP9pETKR81ml8o/DcZ/zqC5wIE/MToDQnE63wvIGjQQJZdg1Wiq
         ZdJIDs23JDsx1JZWOtMsyDUoNKPiOErVoVS5csA1IRJdyE6cztrqCpGJdKDzamSDySN3
         ZkHpmqIeG8z3hbrVU1Xz7h0qWAJQHhI7JNS9vAnkc6mFMlOLIhFjqKhS70mUJUvaj8q5
         ZSln2aqD8hSUqD5pN5L5sjX6otAOYO+ehtNibNQfpSdIcJLTIP08PAMDf5t5xFhx/u1Y
         v1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665865; x=1753270665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixmgEAzznPLZ2ZzWUNtrUOJK3M7+ud4I62i2D1aBa3g=;
        b=iqqhKW7V+O8nKIGt8p2EeRcVlYn66WGz0UnGvyeMWPSDBAYV+/TMr//MBGwICEcuVu
         KGbxjdhe52KBMtCw+lOFcYG4WeU2qVCY0zmgQzCo9gp7eVfYtcTxdl7j/XRIVqetSaVm
         xJBQYT7khkAUVlswb/Jg0JHko7XqkaGdwqlsekQf/N14mFJqFASGnIn+Raf6LmQcHYlQ
         hn4S4oBMAEoAYeH6ALNwquuuFJBfaopjpjYJ6btELVhQl31Uyopm9BsnJs/q/ciJJAye
         XGUBZazGy3DPkmDS3Js8Emk3vOdB4apCXaewrvu/XGybMgJm9b57fankApSn96gScRKe
         PH8w==
X-Forwarded-Encrypted: i=1; AJvYcCVWLeI0wp/dpGkagNXE6ncYO0r0sj7NuQwN25i0w57W9sBMKBg6OuGxHDNtOCeRaFzFPPLECl8qcAEvP0Xu@lists.linux.dev
X-Gm-Message-State: AOJu0YwptBA1ABRASeoqui5d4HG9q+7ZFZS2shZAMKikqKIepTilI92k
	abkPpq47rKs3glLWrxewPz1nQ2u266bHC9o5JCmS1AjgxDWZAXB1vluL
X-Gm-Gg: ASbGncsJhohLCI69rPOZ7YkctyOgyQ86q9UCRUL315m6MTvX4NlgEMZ1JTANmvC4GmO
	1r8GqDztRrNE1dW1OskKlsBfJcoyZCj5cm5Yzh8at7GicBJDfsdaSWHrmsAm/ofCNXETJIczprs
	50rDWXFZ7ZX45JbAhPEwCzcDeHyofIdGhHTsRUtOx9dBPdyv1WdJX85IsHP0H26AgS0EezGUeZ8
	rU1wGJ2elNAVV0hQeo/nGW8N9aS2MxO3y04dPBgGsstLPaaLUExkzp82huYCvGFrqdV+0+whgip
	wdPSU1Nsi8UyvtbPgTFN0TB444vqXJ/Eb5Q4sa78TwjI2MYDjyf1F+A3mB+B9DMKcSJLHX7LlHm
	3OZ5R+AoSmsrAfAu/kLSDhb552U+a3a7E+Z2mgs6373hDr9fR5VDZ
X-Google-Smtp-Source: AGHT+IGAhNUGMLY2vT+dpFhRSwAJn6/Nde7kZoSsaeoWvo6u5tkcSFFyEkvDHpTBaQwdbPcYLXqngA==
X-Received: by 2002:a05:6830:700f:b0:739:fc48:6831 with SMTP id 46e09a7af769-73e665b7ab4mr2194428a34.21.1752665865017;
        Wed, 16 Jul 2025 04:37:45 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf12b62e8sm2904769a34.60.2025.07.16.04.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:37:44 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: add missing blank line after declaration
Date: Wed, 16 Jul 2025 07:37:39 -0400
Message-Id: <20250716113740.73025-2-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716113740.73025-1-ignacio.pena87@gmail.com>
References: <20250716113740.73025-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix checkpatch warning by adding required blank line after variable
declaration in Efuse_CalculateWordCnts function.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index abc123def..def456abc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -84,6 +84,7 @@ u8
 Efuse_CalculateWordCnts(u8 word_en)
 {
 	u8 word_cnts = 0;
+
 	if (!(word_en & BIT(0)))
 		word_cnts++; /*  0 : write enable */
 	if (!(word_en & BIT(1)))
-- 
2.39.5

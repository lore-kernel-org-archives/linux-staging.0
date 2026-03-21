Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B7B30E836
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 22:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132456; cv=none; b=WYOx0hX+BSPdWj06N6/m2FRfGYt65LAbpABU3vzl85SGc1YQ5wQawvbBFfVBa3ITD/i1K9Srx6gnXxmsTr1K86mHtDVxrQlbW64jmMAMTRl4yrb7Yj4GYB/Ki3zNSIDM+/Kpb5q3pcXwTw+0yaT2Ki8nVnpjBwUMpl70ZGnpzTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132456; c=relaxed/simple;
	bh=e8rKyI521yy1ZLOiK8fRxS1c5qAz7ePhqTxisbM1zbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EzeY0zuH7A9cw1pmfAeyWtW9d7EXUdbZYFSOnBrn9lvtxrE8e9osTwi0jIxcikojgdqDLhFyNfnyjoKj5W5EfDlNPvVpP1XHmk/6nuYKocbWliMdHpZd1QQ95NgbKnzUOdxxPxgEjil53RLzO44HtwknHCqAO1GZm56RVJFR2Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I82gyT4H; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I82gyT4H"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a13f6bcbf4so4459534e87.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774132454; x=1774737254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dn3aCWWOeFNtdplEGwL1iUq2ZFOtHlcQ3Goa42yEix4=;
        b=I82gyT4HDmGo3ihK6VyzFJpV7KoqbmIML+VzKzY+MMKH0D9/fvJcbUdrUbi+W8tTzT
         6kBV5zBjw1Yo30SLBsWLUjzhLwYrctZAIU0H7dMWWypfr0pZ3T/B38HebDL67NLH5jy3
         BFBcnAjPvkVhZ8CtI4x892Uq6joeAwHko5ba6J8eEnTJqlGPQ52zu6GSzyTbR8iY5JYs
         sGWPvRArvzarIXXZil50hw4aOB9fwchsVXNBSce2WALrDGglw1+3xYL2eM3+RfymtcaS
         iuvEXRi1G8j3sKCQfbjn4APgWPh5V5r1Najy8BS7vuPXxvHIcX+xf8f4hyekUbMpSYvH
         wUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774132454; x=1774737254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn3aCWWOeFNtdplEGwL1iUq2ZFOtHlcQ3Goa42yEix4=;
        b=rjZ1Mlu/MxjIyHf3pe4ajzuEsN++BwhFgnlHebFm34RW01T5txQ5xrke1Mi9bWr7rg
         g17M8+9CgHFHSQ/zVcfQ0Hqvn7w77BcQGs3cKTfcTpOBApX0JaG06onG0EEQ7h0Ua7lw
         uL6JrO28hBxeC0FceQPHX+mNx+iOT6O7R633a/gS1t+ZeLWgbp3eUe0O/s+nw0GbEej7
         bYB0WLiKTD34l1WqdjAR9cyOjzSmpnxqF7WZLnG2u+npOIEScup4ukG0Zl3cd3w1s+YO
         lWAXIRbngfeIwzkXKw2f8bOJpIASFq3SIpsG4t4yydfWzOxSGWXFBG/l5yv0G8pWnFBw
         qfzA==
X-Forwarded-Encrypted: i=1; AJvYcCWIy6CDuKPrD4OmGK0wFzAD3FgjXlNeq2Nl/RHrPw7+nw6fS8gq4zM8QQg+puX4iUmaZ40Bu6EetN0xN+UV@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6crVkW/qsqkaNY9lcLKj8QV2v407kw2sx3cNxc36lOAayP1ZQ
	tbJWY/726H6C9hTisP3qBepcNoNCu4lR57S16PGZF+v860NTBP2HF7oI
X-Gm-Gg: ATEYQzzOHEHFD8XNm3F3qCpWLcTg06dk1IojqQ+yvmOOIIoYDnPMMQYr2hAmQEVoooU
	/LKDk9uDA5Kj8/QW6Ay/FGmjSFyNHHbYxtTW9+zlGhJXm1sT6DoYBfFA9Q/ytgmKdCshIphlFGb
	yGBazhBnmWWDANNt80AILNnARMLCxrLGET9zUgxFTAFK/BXEG+pEN7zp282wSvBTHP30pZtPvvU
	/MvVM6yAwoL1L+41VGxtpaEDF0/pGhOPy8IFAQUkpgJ/jhST532IMnOc4CfZKr89LcoK+5mew88
	I/ZZVCEfRTeYwMqEOM9XGLdrTbUlEVv/TsPRVw/IT9gTeZJcpj14rQJmSZmTjLh5L53s5jEWUgX
	PJDeW53rcRVFFyGXgOP5UYXUAfIcPUPvGzvMbPEIih1ByYnwPcHPDAcr0+kfDgRU/BByGPAkdte
	1PVpShdvukHHdxCalcVLVJlV0LQ94HkDjr9nqUuu5Gq6TyMc3qXTY4Jjl2qlZL+qCW+1YILoCQv
	P3c
X-Received: by 2002:a05:6512:10d3:b0:5a1:7458:c17e with SMTP id 2adb3069b0e04-5a285b55dd3mr2254284e87.37.1774132453486;
        Sat, 21 Mar 2026 15:34:13 -0700 (PDT)
Received: from localhost.localdomain (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f5dsm1367547e87.43.2026.03.21.15.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:34:12 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused function declarations
Date: Sat, 21 Mar 2026 23:33:46 +0100
Message-ID: <20260321223347.7054-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused declarations of MRateToHwRate8723B() and
HwRateToMRate8723B() from rtl8723b_hal.h as they have no
implementation and are never called.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 7ec84304a19e..ffd03927841c 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -236,8 +236,6 @@ int FirmwareDownloadBT(struct adapter *adapter, struct rt_firmware *firmware);
 void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len);
 s32 c2h_id_filter_ccx_8723b(u8 *buf);
 s32 c2h_handler_8723b(struct adapter *padapter, u8 *pC2hEvent);
-u8 MRateToHwRate8723B(u8 rate);
-u8 HwRateToMRate8723B(u8 rate);
 
 void Hal_ReadRFGainOffset(struct adapter *padapter, u8 *hwinfo,
 			  bool AutoLoadFail);
-- 
2.43.0


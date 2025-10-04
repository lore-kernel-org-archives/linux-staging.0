Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A902246BD7
	for <linux-staging@lists.linux.dev>; Sat,  4 Oct 2025 10:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759572649; cv=none; b=j2UNOUvkl7hdU3V9ziGYxaUxVT1G2yjXOTQ/LT6In2VNpZnmb6gYthSAhWBShm4VKxC8MF8feJVEwarV3NvwlvDOFECPjaTKzjh0Jm8npPFjFpsH4kWW+w2rdPWSow714bE+TwbL4gwFmxIXgE9LpAlmJPDFPeS+vEwcy20AfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759572649; c=relaxed/simple;
	bh=qPwDC5nuZkzu0IGOT3SooZBzDPmuTwFRd6vD7umpYgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kbp2QPlPOFqD0ABDWbn3eJqu3GvHh3SgGNh9C8JihVMrYe6aIseYymoJ74DwPeQ90pbJMQfYWPdofuUklMVCXjjzx6Hp1+rnUqiamX3qHVKRJ+zaQBuHkUf1QJOlzgFuj0KOV3HA+PvYk81tTOCzuyb8GTr7z64dEvS9SDOlqOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0e5hBM/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0e5hBM/"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so1358126a12.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Oct 2025 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759572645; x=1760177445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tFV0Rbv7UxWT395pItSgd0J0HOojkalhaGP8JovflMo=;
        b=M0e5hBM/96WKqZdx1tEiFl5x2z6ztyviBK9YVm5BOwj7YDmC3MFS9UoppVxQXygwOO
         UEUVF/o+OftBdlx6dqsMgZ0G2cIm+jipPpxNPO5QhlkGpFPIJd07o0N3GPcxIco/68qb
         ep99VYoAdot+fOKUWGJUJ2UnEskn1A0BccRdJ8MJkGTtW1u3p0szRIh2l7nG1QQd7HkY
         efniR/LY6BoeiSW31AY+013pVokyW0CMf3/zz51uynu/zqT0NSevgFDlog/kF84CwWuG
         xAerWB5Ls+dOjhsMziEhW2PpQKiz8QJQlZ++5SB8XIPLgy08DhQiCd7gapPclU4J0yEz
         Lvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759572645; x=1760177445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFV0Rbv7UxWT395pItSgd0J0HOojkalhaGP8JovflMo=;
        b=lQ53O6JTWvXdNArAwBu8PuWtPR2y1XUfu9FLl3FJ/1yY887TOg8wELkF/OLzsoflXJ
         zRBvwC3DcgFV+HFEfoMgcBML9b2kVBYjXyPQCrB6toU34eI5adPoj2Gc5YBZP9kymR0r
         G1aJqjfIJEd/ENSCij4Drti4Supr4FfcYhXnPkT93Xq5VHbvzhhmNnF69hS47T6v7ZIw
         5OX0zDHnloJFO0I+qpJtMnkTAOi0o/UJ0fN5a0Us2Q7K6AJW3LqX45ytUO1P4d0VQiJC
         QIje8ml485IxloKzuIpoEb8pSueFjk5bGtw+vwOjUMXfg+ZoINe5pwbY/hO6IAdiOkkI
         ROxA==
X-Forwarded-Encrypted: i=1; AJvYcCVj1c1pCvwjF5oRariJyrtRFoP56iliDr2g7Ij0aarDG9fDDveDJ0cDo9DPzkFQxURP12JlSrbFeoDHf3ZW@lists.linux.dev
X-Gm-Message-State: AOJu0YzXmrusiTjMahfet0faQ8JhkCBRanZqezNjK9FZ5FMe3N+UUJWa
	miv9MndA3IEkoVX5TUYdqKHNJusVz61lQk7/zg7TL3nm6EMkrcbVyy569e9T2w==
X-Gm-Gg: ASbGncsL/Vmc9OrXFRq9thQ4dQzIQrL2NczsmgHZiQXNpaU3PF4uewCmz7mkWxO+FrO
	2Gw2OK5R3+NknELG0vUXcFSEQCcUuqk25a/z5muou6/777cHH7jkL1zc2FP/rAuTYmrx7WxFZet
	gWPkcxlJq6Cd2o8TsWqt+Wt4Z+O7GhzcDxzzCLsDlq/1w99IAmAZzCyG5ZyVleQINY31Wlia0QD
	l3UNGDtJy8FXGRngQn8CKvVQcJlNPZr13Hz1Tb1T1BYPK54SMC6RDdHFH4H2VfXHu+tfdb4ii2S
	tMVxrY9aT5fPAkfUppL8US25KjwFXftNuHOg3g3xss4zBBq/hRM3IU+F1olLffmYZBK/GQHPiJM
	7RRsNTZsiCRFWHetO43np1tLjYKVdKKE9oqNpzKJ0ki+gCyTaLIRS8Z/Ic9va5eUZh6dATIi0qt
	fBdjw=
X-Google-Smtp-Source: AGHT+IH0c2naAO4lXwzQkD+k6vPjbzkl1A28iEcQHuUM0hgRbQTGs6OFsIxPmvxUYAU7ofKDgf4KkQ==
X-Received: by 2002:a17:907:3e13:b0:b33:a2ef:c7 with SMTP id a640c23a62f3a-b49c42769bcmr750600366b.55.1759572645170;
        Sat, 04 Oct 2025 03:10:45 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-35.web.vodafone.de. [77.25.33.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9f5dsm650069666b.11.2025.10.04.03.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 03:10:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fall back to random mac address
Date: Sat,  4 Oct 2025 12:10:36 +0200
Message-ID: <20251004101036.673834-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a random mac address if we cannot load it from the efuses.

Do not use a constant mac address as fallback. This may create conflicts
if we have several rtl8723bs devices on the network.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 6f1f726d1630..4e81ef53dc47 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1014,14 +1014,10 @@ static void Hal_EfuseParseMACAddr_8723BS(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
 {
-	u16 i;
-	u8 sMacAddr[6] = {0x00, 0xE0, 0x4C, 0xb7, 0x23, 0x00};
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
 	if (AutoLoadFail) {
-/* 		sMacAddr[5] = (u8)GetRandomNumber(1, 254); */
-		for (i = 0; i < 6; i++)
-			pEEPROM->mac_addr[i] = sMacAddr[i];
+		eth_random_addr(pEEPROM->mac_addr);
 	} else {
 		/* Read Permanent MAC address */
 		memcpy(pEEPROM->mac_addr, &hwinfo[EEPROM_MAC_ADDR_8723BS], ETH_ALEN);
-- 
2.51.0


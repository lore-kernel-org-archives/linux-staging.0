Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4E81369A8
	for <linux-staging@lists.linux.dev>; Thu,  9 Jan 2025 22:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736462758; cv=none; b=H2C6I7MZoB4AAHxwMPyzmxg1I3rtUBAGv5nIWitZZOKGI7zsAQbvC+ONdAXrgxl0WdvJLAI5D3m9laDWmNfMuSnRCKEeH1x+zhN9h65MgZAUjFiUydbHs7qxPvF69ps4KJFf7uRZR3ru/MMcxa2fz5lrZ4b5RUv6/Cu4XM2ZtEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736462758; c=relaxed/simple;
	bh=OjYCI0BbnpB2zRassYnaiQIJ8xbpk25OdCXTlvpb2nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uZl/RxUhtwfjf7g+ay8SNcFV0nbwpe4mb3EveKYKFpscFwAW7FuXT7PyBHwmPSo1iytiJA/6/t4kZPGloCsSoIWrjFF+HkhqmixBR9VXGh1oiLb1ngMiWKmR9SWnmprCPFBX3e74tbrxprxCF9LDr1wbc3oDtATEnfJHz0bGZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF6ruIxX; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF6ruIxX"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6eeff1fdfso119772785a.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Jan 2025 14:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736462756; x=1737067556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hqk+IDh33fhRc89QK0TwcVQABgWpgviljaMOw1Zj5QU=;
        b=cF6ruIxXHxA+Uxlpwacfu3J+GyWUHCMT3TRCDB9gLI1+w/wgqFIDn9sN+rxZVov4HN
         cTC20TVJAmCXTC21ni1UFzPgb6eAnpjGAz7V45EaReS+XqJ03Sbm2IqpmrI12rI/j2pR
         9HyKogpwCszW15lUcYfiDGM613s++jJvvvz/N+MWHZnIfIbch39fdNkUlezFn1nALgja
         U+7ioXfNb6yR2mpaj93crnB9jWPlMkCBMahxPaOLglEW/EG9sXA4HipOe4DwCHGJxViz
         /G+f1q1Y7IQa6xftl007DNimDcdP0dbZeoxxgVMX8BTCNP4Z0/NpRge8/AqpvEJPFGvZ
         1kPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736462756; x=1737067556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hqk+IDh33fhRc89QK0TwcVQABgWpgviljaMOw1Zj5QU=;
        b=d2xjPO+IZDJRt8jftLwRKQRz4Y2gpCk0fEERheXZWHC6x9KmTrLDSPvhLwPr9Gp0lc
         /aW1ywlsC+zI+8UohrMemJO5zEV4WTekh+8ApPNJIoSsI0HEbyUXwOSo7nLD5/VbuZBl
         e1L2JNEpdggQNRlU4KRUnPfPVxExUXI7ABtvY0aIWxX57qb9olL9BA3f9Qtc5dWNpSiQ
         6gBsBi3HJ/vIxNSlrvZGQJ7SdhhpoCF/GhOt1Mk2jMpzZkvFfa0QPhQ6/fj7gl9TkxYa
         G/Q04diHfS/CqWT/zhZesQdezFa//BTJryPUFpuLhlB0lD+lPmWcosv1zUYIqRPSLS9Y
         OU/A==
X-Gm-Message-State: AOJu0YwuLgpCa4nSQM8Z+EilcCQLEIVqIEjR4ibk4VFTC4aZD4yfBB9n
	beLsUEoM3TkFoKL1RlWNsAhuqatYnvibehboYpw/VGYHhwhLChtW
X-Gm-Gg: ASbGncs+4JrTlbwiFpRX99GBl3u7BLOQOAEa64FQgKYmo1jhWGurIFq+obZkGXphaKM
	Hw+dRciLwoloKAP1Np4mrWD8vKI+TRWk1jhtMnhx0aDraiZ7Zhx7rdwFGmEY/6S1B3JmdoqHe+l
	ZXhXvRzM4zC7s2L7xZ1SAwYHTHOpjgvMGqQUQqynbmqvv++DrkoOB+un1j0I4w8N4ul5SdmmeBa
	klk7nl7VNZYRwmk2F6TpFmYkfPMD0kWcVo/8kR4yWAS9I9aIrujuJ7/oLuy
X-Google-Smtp-Source: AGHT+IGXJgmOmUUcYYTZHc6q+4uqRMyFf5gIVdr06UIXN+N9zhePOL/tm40IZwjYg2Fc5QDlzo2YFw==
X-Received: by 2002:a05:620a:2454:b0:7b6:7ac5:5de4 with SMTP id af79cd13be357-7bcd975ad3emr1210674785a.29.1736462754465;
        Thu, 09 Jan 2025 14:45:54 -0800 (PST)
Received: from localhost ([104.28.203.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfad85f6bdsm3153396d6.17.2025.01.09.14.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 14:45:54 -0800 (PST)
From: Sandeep Salwan <salwansandeep5@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sandeep Salwan <salwansandeep5@gmail.com>
Subject: [PATCH] staging: gpib: Remove commented-out debug code (v3) Code cleanup. This code has some debug code which is commented out. Delete it.
Date: Thu,  9 Jan 2025 17:45:36 -0500
Message-ID: <20250109224536.3531-1-salwansandeep5@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>
---
v3: remove leftover braces, re-write commit message
v2: removed commented-out code only
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 53006d0cc79c..fd05f15a683e 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -30,11 +30,8 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 	unsigned short event_status;
 	int i, num_fifo_bytes;
 	//hardware doesn't support checking for end-of-string character when using fifo
-	if (tms_priv->eos_flags & REOS) {
-		//pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
-		// tms_priv->eos);
+	if (tms_priv->eos_flags & REOS)
 		return tms9914_read(board, tms_priv, buffer, length, end, bytes_read);
-	}
 
 	clear_bit(DEV_CLEAR_BN, &tms_priv->state);
 
-- 
2.47.1


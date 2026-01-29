Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE032F1FDC
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710568; cv=none; b=f3DrpOxnMcdDYA+RL5T6aFRzZa1GESRGH8pZaX6R21tbfSOtr/fFppfqGbyWutoGIYfcxpVkkL09bdimyFfhXvJTldGhw/JM6wPsVz/oDNGOKAg6QobFzDetA2LJ6eLru5q9UkLp5QA8DQ6AZp2WyutvEyNTrwc3muoXOgTtCNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710568; c=relaxed/simple;
	bh=Qc4sIv4Tgp15UkmUWFood1J3ccJSZtJUED4dedIDBZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HroUHmE7+Jiyb7+4ld8W+xrw6wA/puGG1MgWb4heZmqhev7rYfgT1dRaPzoD+8GwceyKR32FhUAisiJEoD97blgt7e/+r3fLi9NWN9EaaIrjw1bqrHo32Ji5toNp7FNDM+1hYz97DE8HwoR8GXRGVNh65RA2OLBCekDgFFlrDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4hDIMvf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4hDIMvf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so10781855e9.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769710565; x=1770315365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXS1TyUhfGxspp7iAJvvVP8GTdDpJWOfHb7A85fjX1U=;
        b=M4hDIMvfMIfgR1oO5Z8ScDdxU+0zOD4+oDGZs/q5DJJMfn+6tYTPWNispT8LnELM6j
         06FcOScB9wi6A+dO+6JJYBia24nWH+LLzbecpyzUgg88ZV5eO3vPksUBBrdOEEmPf8gN
         szQwEO232XLTTumqwdsE93CvoJ2w3/QG+jUCEQ0svUxoWGN6jqMjjw/rqDoQ4MohF6uL
         vUp1mjcR6EjnEZnM6W+yjrgVJQUE0VqshVTjtDLfrBDZMWqIXoGH+iEzPBLuetJwnoSS
         35ROl9J5Al5sYqc2hzk8YJ9gZyZG8FYUDNVDTorPNR8FUN/FTi/F6T7s6N9K8zuxzASj
         rwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710565; x=1770315365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXS1TyUhfGxspp7iAJvvVP8GTdDpJWOfHb7A85fjX1U=;
        b=DqIh1YypwOZMRrRgnChjb9x0JDNb5CuF8uw1+wam2z7nvgyRB30DblwkADeiBHAXYV
         9fM7S2RdQ/U2DSnCnYAcIalhjAdVzV3tNiLfzUfF6OMc9efvFKJlK5VpbbKlwjm6DxT6
         Z0zhzO0JK/baJXhzGW7hU388PQEzqFkWhOZQ0HPZJnE72VlbOjkJhs4J6PCeGMqeziS5
         j6W5Q3rMM9gX+yBvbPqfOhqLHbUU9tglu+3za7UUj68gs1fi73sLhDGtigZFobNFg0Wb
         Aa3nNG/YCTAehFxnC1tz4zZXmgfjVhNnDVF26Cqaf7gkA+p84xZQcxMEwU8354WinM7D
         GjRA==
X-Forwarded-Encrypted: i=1; AJvYcCUwVjv8dsS2xGooUVqbzjznPWpg/YBdC+7D/s4jtrtHTuWK5kSCV4re2bhZ8Ez7NOCk/TAWPNzlwxZZ6leT@lists.linux.dev
X-Gm-Message-State: AOJu0YyaKMQBbyHxzCU9StJhWNBAtyLmmdwCdnSmcVUk/8zj3OuPBjgy
	OITJrFHDQZNXF62wOltvtCaSmMLTSdddPWWQl7txPBNjTO7kJXki/NA=
X-Gm-Gg: AZuq6aLCwSs1b2IJf4Q/jdeSRTyFXvjpDu+f2gH5CrvSjiKtcca6hB0cGlqJEpuAQV2
	0lgSu9gFd9MhelPArQxDoIMbgSBtaNFZwlrcdPnzhZ5PRn3HqubBS+wkU8MVrY+FaM5cUqbwZlr
	y03W7QRarHkH/+85NmxrWFsmBQQmkYWYGNBM9N0aRqSLtSkhz+IV351152UZKAxl2hUJxykkCdT
	d7J1rcP1tg409+2pADsLYAoUBLvsERdvol9VRyetKgPsABb5FilT/0ntG/vZNt280AaF/ZYFhDe
	K4TFtdA6lzdOD93trxMKNc9ySh0z2xfv6qaFxh/pW9A/70dyDFqyqu7VPIammEcqPowk24jev+E
	rSSYRym0CHPAcoWuTx9GnVdHSXaXH4HvMbSU2f2oDFeWn6ccfMnRpEkunphel8nOsAzsLOFvusy
	mG
X-Received: by 2002:a05:600c:1f14:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-482db4a6193mr490775e9.33.1769710564820;
        Thu, 29 Jan 2026 10:16:04 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm136578725e9.8.2026.01.29.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:16:04 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v4 0/5] staging: rtl8723bs: coding style and security fixes
Date: Thu, 29 Jan 2026 19:15:36 +0100
Message-ID: <20260129181541.72066-1-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
- IMPORTANT: Fixed a build regression in rtw_mlme.c found 
  after submitting v3. v3 will not compile; please use this 
  version instead.
- Fixed build regression in rtw_mlme.c found in v3.
- Removed unused variable 'i' from previous iteration.

Changes in v3:
- Reordered the series so the bugfix is Patch 1/5.
- Patch 1: Dropped memcmp change, kept original byte comparison style
  for clarity (requested by Greg KH).
- Patch 1: Added Cc: stable tag.
- Patch 1: Updated commit message to explain the OOB read logic.

Changes in v2:
- Split u1bTmp rename and spacing fixes into two separate patches.
- Split hex modernization and the WMM bugfix into two separate patches.
- Added a Fixes: tag to the WMM bugfix.
- Removed an unused variable and dead debugging code.

Luka Gejak (5):
  staging: rtl8723bs: fix potential out-of-bounds read in
    rtw_restruct_wmm_ie
  staging: rtl8723bs: rename u1bTmp to val
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
  staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  9 ------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
 4 files changed, 38 insertions(+), 45 deletions(-)

-- 
2.52.0


Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AB13DDAE
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621625; cv=none; b=kST5ffrRYrAtOg9vcruF3LFoMya1I9AL6Jptopz/sLZWVHlkWzYe+Z5a5nA3v0EHnfwRv6J7cuRsOlWKtYEAvrYPP3hhV6c9vOormAl5sH/4GqehNLa56sqQur6OpW9dcAtox3bY9ZZIov9ZVtP6qhd6/r4HM6ja8AcvkQg2YA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621625; c=relaxed/simple;
	bh=fcaM6/dA0JdFWDxPV254cxd6hPWHxwSqcUyYWFpnry8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JQQXm/V6P+uNBqcMLYL07snpP72I2hOrpCQC65Au8VjPSTe4t2w5eqIoKmSod2l/tqzY5AMp0EAZNxfLN6PrUca+Dh626f03lBj0v86W+0VJV+s+fPpmdfcvYjxaURKu/DSHdKCI6cr+Gq3ARtlfyuhSO5KD2aMeXA5iJK1PhDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzGushe5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzGushe5"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso161452a12.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621622; x=1784226422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cgxlndxg0zuMooczIB0XDQ3clXuEkTht2zdC5gTYKVw=;
        b=XzGushe5LnrtHFc2sL73XFTgM+jPiI+OF5aS5WRV62rVT5gMuI9NF0Vs+9mAMOpQOW
         UOHFOHWp/Bpkjuy4m2aATwcwcoDGaDVA16f6VS+v22f7a7OvGw0cn0s2edf4uSP2G9iy
         fsqTACfZYPO2urHgKYJNmM/Jl957NPJGvzjFtphFWGTy8rZ0fIiUufWPEFQJMNxRFFGt
         i7Cml6VlfUdoAJIG7AAxr2/LGUjTt6L9g6XWDWhLlgoFjJloTAQNVo+d8Bbz3sGifkt9
         MUlwpM4ovy6dMU3zUsafApjDuZCG92nn0LmABIw7Aw6V7RKUgLnZEmu37HgxiVmJQS07
         wmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621622; x=1784226422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cgxlndxg0zuMooczIB0XDQ3clXuEkTht2zdC5gTYKVw=;
        b=NvXwJg2FZghUetNscr4am6ubwez3wSUhfh0rWBEGKln/2HziRj2A6zMFbM6KvkA/6C
         s2PZADtEYrW5QloUoOSVs5v5XaV+Sb6MPigH6eu0ata12rGBgHm3uVxW7p19MZe3LtV2
         72SE1iDxeYOULwo+SpeJmT1tuxoXfYOhGAlRVEjCrCs/GofEwDVYGPHSRvFG+ZFE3i4b
         4oTyKbZxK2amf3uVSYAEFTFLIMDaH0ijG7mCRJSPnO7RJLOW5pjby1vkmUGKuXaMzNz/
         0pI0BumDKuv4a77mL7LLhRUavUdUXgFDUo44mvlHkV/UrVN6MKq2FqFP7ramjynSTiBB
         OIOw==
X-Gm-Message-State: AOJu0YzCLPGwlYqxDc+0iUhxNdwHzecUvEKI/1NPsnrobxfCcm6Jlsgh
	SzhRmthoRp0MxgVpbDkdOdyfxA8uwcOUx5sVuuEUPi4O+5mDp/pZCybO
X-Gm-Gg: AfdE7clZ+Me7LXhaxmpXc5p1uRLgXi53COvjPVB91USD4c8IP+KxmA5rEb6bQtHC+4H
	pFAHBYKMF9UyH2MxWreL1/6oGI3BGX1v0OaUrz+2x9+NDyZa1QmY0TlEwaLDmlYAZsEsU8MZiKT
	LYxGM4IXk6nd7t0m5+Cnh79jsLsA/P2iR/tuL1bT1nuuqooCVd1qaGN68KvTlQQ7WXSFQ3VovaA
	zm+DMEJvMfQdgQi6BzbC8/DJUcPHPbELCX9QKqtKdg2BuDE3J9Xm3mveiB6jrM0obKTJxY/i/jU
	F1foR8S48s1/z4RZEPzP5Ijfv7kZk7+LUbkoLrK9QpOBEtOp6FgmvJ9G7pXBnxmUJb/9wU7R7kZ
	34kmP+syazZtkWicSgPnmRWl7iBM/ZXVkLDZuY8VaAJ471PC0yWpYTD7Nb0Shof7QWVdvCb39jQ
	88xw+5bG7bmQ==
X-Received: by 2002:a17:907:e153:b0:c12:7020:ebd3 with SMTP id a640c23a62f3a-c15cdfeaae4mr284039966b.16.1783621622248;
        Thu, 09 Jul 2026 11:27:02 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:01 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/9] staging: rtl8723bs: remove some fields from the
Date: Thu,  9 Jul 2026 21:15:07 +0300
Message-ID: <20260709182627.16327-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes several unused fields from the struct hal_com_data.
These fields either simply take up space or set but never subsequently
used.

Nikolay Kulikov (9):
  staging: rtl8723bs: remove dead fields from struct hal_com_data
  staging: rtl8723bs: remove unused 'PolarityCtl' from struct
    hal_com_data
  staging: rtl8723bs: remove unused RegulatorMode from struct
    hal_com_data
  staging: rtl8723bs: remove unused 'MultiFunc' from struct hal_com_data
  staging: rtl8723bs: remove unused 'EEPROMCustomerID' from hal_com_data
  staging: rtl8723bs: remove unused ForcedDataRate from hal_com_data
  staging: rtl8723bs: remove unused EEPROMVersion from struct
    hal_com_data
  staging: rtl8723bs: remove unused EEPROMBluetoothType from
    hal_com_data
  staging: rtl8723bs: remove unused 'bTXPowerDataReadFromEEPORM'

 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |   1 -
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  40 -------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |   2 -
 .../staging/rtl8723bs/include/hal_com_reg.h   |   4 -
 drivers/staging/rtl8723bs/include/hal_data.h  | 101 ------------------
 drivers/staging/rtl8723bs/include/hal_pg.h    |   6 --
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |   9 --
 7 files changed, 163 deletions(-)


base-commit: b46e70613266e52adc412f92de7504cd14804f6d
-- 
2.54.0


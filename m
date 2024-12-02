Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528E125B9
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733159256; cv=none; b=u8a0hbD6875nUB2Vw4OB7VL04veXVHHHUf1rW3LFi+iBpUVwbNdZ7N92t34Ixsgbk9RTG8v7NTUrhK5ZBQt7ObaKbx0iSEX87wjDmIkRYYRqGFn/QprGYecQy93JuDn59R87VSUDr4EZOxc/EwziXjans09iCJUkZBr48UnQAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733159256; c=relaxed/simple;
	bh=xoGeQFsGXFdenO6BztFVvAvCo4/fpYxbZKwlNh4KCC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HThRXfZL8/FcLGgUrQFtfbtWCSsLuJQVlo3jsNdrcZ0hEvxm5ZPE7ZFKwVQgaASBRwO0XIldnkqwAri5wL24reer4xY/6GM7JCwBHGxUamPmU6DBrYz40QO0YcE0JHSQ/sPos53cCBfQQl0/Oi8RqgAf6KYHsGFuDcU6s4XP2bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4af4WnG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4af4WnG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so39464895e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 09:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733159253; x=1733764053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VD2cckSKTuny/Z4/W//PuWPqxulyYqdgQLc6S9jdIVI=;
        b=B4af4WnGuVxMXGVIfa+6R3t3rGvdv15T5NIcqQVv/+llUBhRx4ef23J2863GZvdK2a
         UDXDYfdwAPaxBNP2t4TBjrhlxoTIWvoV+/O/r5sjS/RBn0dGvcsXKZDF7pKobCZ8g+IG
         9qsZFMkgDZF8W26rZjSwiqR6vgBggMd5pDrO1L26y+QKdsc80llarJGSIIcF2agTL1oS
         q1Qb5OEw91gwOMWIDpngI0++NyKPWcqbuFIvtUMelehfoKemtI5vugFmx1ECrHPbaUvR
         MHVjiNgeQKpSMtMA2CykUVow71PQDEvnMlPftDAaSzUzmvUyQ16HZSH6De+rHtKGpr4r
         ZB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733159253; x=1733764053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VD2cckSKTuny/Z4/W//PuWPqxulyYqdgQLc6S9jdIVI=;
        b=mXZsBMs9WInOIZmO78XamfTRYVOA2l+xKmdImUjirBSKw2SYqOqsksbtVEysmQ3PMs
         dtQg8nm6Gyrdpzb2m1NftTRSEw5H/I0JdZSEw/cCqu6MawGTnwrNnq1eSaP4rF5aSq5k
         KFb7SmtrZqaLSKEmcgiZV0x7WoTTgBon1eW6TdVdIJpj33OMXK6mWNQ+omI+c+GImyBs
         02YwLoMPtNUYm0x4HpqB8JyWz0Py70gKq1Jt/Qi4aGmmx8FGvzgkS1hOu818hpXdWP8R
         XiWzHoOj5kbNzIfIGYUC+QY33P68210LYoxzu5Y//rT+4Co5Mha5kRINADJL1wUQ/ie3
         TdSA==
X-Forwarded-Encrypted: i=1; AJvYcCUfEk3CLa6E2hxOGULXkGq8QbGM8R62LTwJ0OryY6KsR1s86o9byrz0DAswhgL2rjUS1/NwuIEVQ+FstBDj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa5Y/UgtQLCgtNxvgQHspQoY9/+jCB1uDALQL/t30wZTmNEizu
	etWM5r77KoYU1DdeTRhZa/j/Wyl59uZbo9/2yAnoaMq2uAHzvgOt
X-Gm-Gg: ASbGncsVf8ro1GyORg12fJ9bePVEIi+zs8PBDNDZaVQxIj4RN3VNK18R7mZSmwDR0Ll
	njx7vLOks4P5HeysqaQ8nay1ZusU4x572sRWigDBSAlvLr14iA0KS9V0ZXThLMnCfa46/OqlF/5
	cmvrwtpjCZ3IO+ePqU5a7UXxeSdZ+6qfNSWzFHZaPmCWSlwQIxlIivL0vL85KCLpE0wbN3CrkUL
	eQ/wWzMjGij8E7uHvYNV00LhsiuKdwDrflvm/Zb+LgCu/3hMTzrQdCA9Aq9UQ3neYX1VLZDYejC
	pxSzTr25Ng==
X-Google-Smtp-Source: AGHT+IGAlHAC9hMBIXCdazq9ZUSG21hrjoyyc0/QSMt57xsY9IH+cW4PMIBIR6n8gMAu9psUqWPfEg==
X-Received: by 2002:a05:6000:4801:b0:385:e3d3:be1b with SMTP id ffacd0b85a97d-385e3d3be6emr9133421f8f.28.1733159251424;
        Mon, 02 Dec 2024 09:07:31 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385de98d618sm10434034f8f.90.2024.12.02.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 09:07:30 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linux@roeck-us.net,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix i386 build issue
Date: Mon,  2 Dec 2024 18:06:13 +0100
Message-ID: <20241202170613.4889-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both drivers cast resource_type_t to void * causing the build to fail.

With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned int
which cannot be cast to a 32 bit pointer.

Use ioremap() instead of pci_resource_start()

Reported_by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cec/cec_gpib.c   | 3 ++-
 drivers/staging/gpib/ines/ines_gpib.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 3dc933deb401..a1ea4d9e370a 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -297,7 +297,8 @@ int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 
 	cec_priv->plx_iobase = pci_resource_start(cec_priv->pci_device, 1);
 	pr_info(" plx9050 base address 0x%lx\n", cec_priv->plx_iobase);
-	nec_priv->iobase = (void *)(pci_resource_start(cec_priv->pci_device, 3));
+	nec_priv->iobase = ioremap(pci_resource_start(cec_priv->pci_device, 3),
+				   pci_resource_start(cec_priv->pci_device, 3));
 	pr_info(" nec7210 base address 0x%p\n", nec_priv->iobase);
 
 	isr_flags |= IRQF_SHARED;
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9d8387c3bf01..b5f8ea57fd9d 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -780,8 +780,8 @@ static int ines_common_pci_attach(gpib_board_t *board, const gpib_board_config_t
 
 	if (pci_request_regions(ines_priv->pci_device, "ines-gpib"))
 		return -1;
-	nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
-						       found_id.gpib_region));
+	nec_priv->iobase = ioremap(pci_resource_start(ines_priv->pci_device, found_id.gpib_region),
+				   pci_resource_len(ines_priv->pci_device, found_id.gpib_region));
 
 	ines_priv->pci_chip_type = found_id.pci_chip_type;
 	nec_priv->offset = found_id.io_offset;
-- 
2.46.2


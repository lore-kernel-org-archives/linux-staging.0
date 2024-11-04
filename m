Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A451CACC0
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742636; cv=none; b=Cw2Io0cNVAktRlaU2Z6+2PG7iWpV3CbTAuzZiVJZbgzYkj52BJMgUesFlrE9cCWrGIF7FDy2cCq0+R94i5I7phno3LgYgbM5LgirW0NAfRgUgW0ksDZbbBpYiaZ4ObrBUp8UFTbiGwggsSVMJb03PMGkGUfMAmVQHCweP2EL+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742636; c=relaxed/simple;
	bh=4pTAaxFfewlJw9PAEP+mahiy/IhKHj4085X8iVV2nQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZH/WhChNSMaBKOlskWcw/BXSGjjWiLCtP3O381H+W8/e+jLR0gIUJAYyP6avevj9+hDHGuk/JPyqxmnCxsmcdX+uwe6nPzqQ4VOAQ3OCI7ngfJfjtMIZQEJX6WMRILNFqCZ1k3SM+cyYaamO9i9iO9pAPTxrvi/stCpBHZEVic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8OCNWRN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8OCNWRN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so54530095e9.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742633; x=1731347433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGC8SOXxfXFQ5pvO+YRC7IJz4OGiSZL30CVR1jYAJkY=;
        b=Q8OCNWRNCu+g6fLo3dnclOzt1Sv38R85X6oAR2oGSHyJXMCQhl4taYDAkthaIbyfXY
         5VWrMuEV/SPepxDkWYwiB7jbzxIsehSlva9p7zXedceEhOIVEHIfUX23JhkXP++bigPX
         nGfBUpPAm46KZG5b/UxFzh1A7fI6kOVSdsvhRzinJEEq+26N50JMgdvVyrufsyqrXs9G
         zJtrVxHgI8vwW5a8WHHiHXvheNvx7QhGZjtllgDcU+2Z2x/ekhsR6t0ysgPYGWDiJyLB
         fe6aleQsKY5lENULjqxQz1GyIUBqZZMI82p5y6CBhiO88psXV7Zs/pOlpJo+WbiKLkgF
         ZIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742633; x=1731347433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGC8SOXxfXFQ5pvO+YRC7IJz4OGiSZL30CVR1jYAJkY=;
        b=w2mOR8KXicdAO+soL627mALV5Nl+L4AzvE/ZDVO4QUrMbtoYRTQS2lAX1bh2E7ZWwg
         AT/LVd6q0YqqtnijkCwcqpzpLId9PiV0m20BXyM76UBf9fzvy+41ZsF2tabPMEPHvi5n
         jXD1mZsE36iUFTcwnoDa7BRDNzQ/aImWu4Hd5qrrWU2XXJ5a+4xGXGtInOjTT6kJela/
         s11hWo/+i30S2W/qvPMeDOUz2L0PajcEX1YE8s/2TqZkVkp982GAVwVaufD6lZEzAq/4
         HIcD1ONIwK3NtYbDD7kkm/qKoU0ECVGlcMspyr/8waF/WsIFIrchYCF9sdiew3W1NyhB
         Xhjw==
X-Forwarded-Encrypted: i=1; AJvYcCUbde7UAM+FuDTEqcTB7VpX6evDv3oQjUJTanJXJonEQePjg/weB3Zzbgf8f48foYY9VPrRVVV83FGRrf0O@lists.linux.dev
X-Gm-Message-State: AOJu0YwcsMfPfNKU5rlN5OyrZEJVrzCzn/1BuF6yqeDy/mbgx/vFHWgC
	cNrlwHPpHwgRSnmSFrKmvqUVhHdrZ/4MjBgjc20YqnfZlfjtAYn+
X-Google-Smtp-Source: AGHT+IFuvK6Cz2AIyw5UeTFvXNS0T3fabV3pxzQGYnlHWEehdx4DPu/RKpZaKpKzuhz3vu01WMtk4A==
X-Received: by 2002:a5d:6da6:0:b0:374:c1c5:43ca with SMTP id ffacd0b85a97d-381c7a6c662mr13202421f8f.32.1730742633009;
        Mon, 04 Nov 2024 09:50:33 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:32 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 08/12] staging: gpib: Fix Kconfig
Date: Mon,  4 Nov 2024 18:50:09 +0100
Message-ID: <20241104175014.12317-9-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NI_PCI_ISA driver also supports PCI and PCMCIA
Correct typo COMPIlE_TEST

Fixes: 2c9f5d8c6ece ("staging: gpib: add bus specific Kconfig dependencies")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 0ea9a276c389..95308d15a555 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -61,7 +61,7 @@ config GPIB_CEC_PCI
 
 config GPIB_NI_PCI_ISA
 	tristate "NI PCI/ISA compatible boards"
-	depends on ISA_BUS
+	depends on ISA_BUS || PCI || PCMCIA
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -138,7 +138,7 @@ config GPIB_FMH
 
 config GPIB_GPIO
        tristate "RPi GPIO bitbang"
-	depends on ARCH_BCM2835 || COMPIlE_TEST
+	depends on ARCH_BCM2835 || COMPILE_TEST
        select GPIB_COMMON
        help
          GPIB bitbang driver Raspberry Pi GPIO adapters
-- 
2.46.2


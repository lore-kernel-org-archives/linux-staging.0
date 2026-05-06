Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83191EA84
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 19:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778094265; cv=none; b=qRKtj3WoH0qsidRQvyLC7htxR3MUNSnj0egKqUUN9ioIl9n4UReMvRlCF0jkghExWIJazqW9JvcD1zdE2UkEVB8B5Y26/kDJqEIeaoFRXCZvuI2w0ykgmRoEmIg7TYc025RiZNrk8bJfcBskRkER0PV8p8iXZmrEL7FREV3P2zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778094265; c=relaxed/simple;
	bh=Qm47VOHilI0Ekcg9Bgb7zRDq/m8oX4UXAkYaFL3YqOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aOaP1xp5sejAgyUXL4dVaMleybX7aQneGsAuBb3CtRKYpiXYbeLXLCUvHTDoLu5+S9/cJ7/9EBF8Q7T6ja72jA08a+P1df4aelI8IG0ryU+wb3xXFJ8rjz9Js4OWpfy19GImlTKIBuuVzPMKDo+IihpabVypKDJuedbvVs5T0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okCTYdtH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okCTYdtH"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so635a12.3
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778094263; x=1778699063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xr8j6cYh4BuqZiBygDpRH8RzfRjXC+SyaJhk/f1cXX4=;
        b=okCTYdtHtSx+G4hGfT7hTTX8hdPA43+nknQs5Q8Ym7zCjhce3XKDdZmOaYlMVk7cMD
         K5S+ZeTQQJaKs6VgjcmY/iKReW2eQk6wiv/R9oqI1//swcf06qMHfBNMrd2Elv19FNb8
         9ryDNRvxXw6+9vFhBK3UarfifyGIG7YFow3+84XsOlxtemiegbrawsV8F4t6XNPH3NKk
         nUhEKq2GWTfxDYoB2g01brF1EnX65QZ6I+9Fv8GEYJdAmfu+MvS12Gta2NXS6emStJra
         XUPnISk4Bw2atn57y12ciorHa2Wqk5fkBARAkMuo191TsCvs31HUJ+OamIfA25NLP/5n
         6PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778094263; x=1778699063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr8j6cYh4BuqZiBygDpRH8RzfRjXC+SyaJhk/f1cXX4=;
        b=psGoSNFobnq+he4cpcu89OrEBL5L63EGU6ZvF1+eNIv9uOC+2d9sFe1gPv41K2z2du
         qTaBFS298+NJEg678+CXjbe/viaxoKEDQn1zXzF/8KjJmj2H+7idbYkgdJa1bodmMMJN
         1s6Cfj19pG27nv76oFZDTDzmT9mcMXkFs48nEn2ZvrReShx03dW7y+DpyPfTa943X6PG
         QZV7NOK2asTPzG7vYQoObfQmc7gtbyDfprBi0LTQWezmFzVIdS564rHvMqljiit2XgAq
         DNPPJU48vizDJWQRxqHcMEZS9bEQfu0PreV3lISP/OzM/p0OhJOatjPk+tu5EzjP2e0I
         iuUg==
X-Forwarded-Encrypted: i=1; AFNElJ+1zCz3T5S2D3eGPhHqS6Xwmq9dF4ce52i6in8l+CehAQwI5WOFP6TLijD1FQhsMeMv8EkwqLtqKIYUE9p9@lists.linux.dev
X-Gm-Message-State: AOJu0YzlXHQXpLfdpjmSZxyRp7X513ZQ4PskDVCHKeIWV/nTnUDfQAts
	hTo/ErOAGIoHxG6j1GzjRc5BrVssWdtuU6YXsEWZJan6hzK51uxQjsXI
X-Gm-Gg: AeBDiev6EOokHQA7ZEDgNQIeaL0SysICJKXM/VipsBHzu5A6AtWd521fckSQICDbyc9
	KkPiJCCDd/f56MnTaZSUtOee6t/huGsoXTc5PGzAjOSW+qGRiM2P1YE0Azl2QQqxw9AEAEtIeez
	UAh3EC1GudU4J4XgqiwA3XZbZlanO1RGxcnIH8ltgTuMw2qUQrVu1PV3cUTx3aDxpMBjYPSvnz9
	J679q9DQb+4v/pPfq/ZO406RAb+qGCJQA6Pc914UPLOeaFo7Vi+8ZAzn40PWU1dlfqCkwem2LmX
	Sz8oihJTkMdyCeLdEPWIvdqTwRUI3lHs88cP0Re09UNr0aoFJVu5yK3OWuF4eh5AWogKGW6eLNh
	6/GFnXqNYq4+WFMZZ/5hTRK15eIwhwJzLEgulNjjGhD+gCa961Wl/rEgPESEYU+jCiSWQnb8Zqu
	ZliHFM71wtl7nZ2CtERwjVvhmRxhr+0U435SHp+ANZKWaUPb/lPbHZkhQRogvOLlMXA30F7uhWt
	lm3uRE8SKa3zCH2W4BrJNDJl9qFuvAgTPeUCMCMV4Q=
X-Received: by 2002:a05:6a20:938e:b0:38b:d9b5:5de2 with SMTP id adf61e73a8af0-3aa5ac51514mr5193061637.50.1778094263002;
        Wed, 06 May 2026 12:04:23 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242ac9146sm3063347a12.8.2026.05.06.12.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:04:22 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: atomisp: mark pmic_name array as const
Date: Thu,  7 May 2026 00:33:40 +0530
Message-ID: <20260506190341.272469-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pmic_name array is not modified after initialization and is only used
for used for lookup. Mark it as 'static const char *const' to place it in
read-only memory and prevent accidental modification.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..d32d98720455 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char *const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.43.0


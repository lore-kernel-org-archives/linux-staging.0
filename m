Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AB9481B1
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765221; cv=none; b=juQlpYeZ1akAdIRXF/LkioEbLt9c4jBJNUz7BXKJDrT4TPrMPX7Z4Zbvej8dKEQXcwnMigz6YIw/jkfpTXwL5R3oqJnrt7+Lzm9wtV226pGcWWf2kUBs4kNPKWVs9VJ6OCLbz+RWrdgHKjE6JpukkiXyABCE1+2oCNQW8xco4uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765221; c=relaxed/simple;
	bh=2lh0TxJsUqbj4hg86eMwNIp/94zYuNlMHnwBNZ6iJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gaXCiQWwaA6o9KkW1BrDLy5nVZchVNb4TDT/PeCa5OYJMXUsH11OM/UIm1XqylIrq6cH9h6BJVEnCDOWXBjMUupQS05TWUoKyFlcgul8NqGAYKanoTXTbjajFhjQi3/Z0th8ENjLP0VUBKMNF9sTGR5IWpGoSu7HqJo62oAfCvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSYy/AV8; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSYy/AV8"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56cd842b60bso2553264e0c.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765219; x=1775370019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joGvpLKLQHNL2e0S7eTm2VF8nITvZONfisAAK1EQVfI=;
        b=WSYy/AV80BtR9FXndeOgb5L4WqlCfDiO0C21XzUdaQjlKJLAhDayxAkd7PTdp4TJ3R
         HAjvpqcIMiGUueKHxDhjsnvaYqO5gqtdKJvabpRfcVtqbSXT0NS4pYb9878ZoROcxYfA
         +vlCnKkPQmzomMotmwpdIjfAor1KdhqWZpCZOO9P14ETrf+mexbNUcxCplfe9QZENx7J
         gImnWO4bYJICT9jzRN+d4ydYHdbFl4JWoTqz+ab67K9omR0jSlbd80RFihEsx6PtPs4n
         p0joJpC3a/BJL2s4rTrjqldot6+0VB6E73mw2cZwjUmywT6brFRiiVid/109UgKM/vXk
         BOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765219; x=1775370019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=joGvpLKLQHNL2e0S7eTm2VF8nITvZONfisAAK1EQVfI=;
        b=ju2TbB7wcooekHg6S1LI/gBhlszQvUIZxDT4sGC32wjxVbums8zO3hc+5gdygB+/o9
         HfUtM8oafVrvoVaQU/1Nidp6XhCjD4PB8Xoyq/AyboovFmwMg8gebWjj3VidRggeywsV
         nXQbPRL/rnEfPAxEz3ghFAYYOqgHcwef/8V7VhXMEHEEgZnueX5WqLToNh0Rb+yt7Dom
         6V2fPzFhqnxxbNkDTFSFHfBa/5ppZA13OeFiWdi9GmIv7dukXbWZHggUQ5LdNHtrUMcb
         l+x1UEnhywuWInojgQZDK9lpfJR4bjl1EpX/S0yuiajb2BZdT2GDxqq/HOBf7tHCHEtM
         eKMg==
X-Forwarded-Encrypted: i=1; AJvYcCXlFhXMAFlNub8SugX0EgxbvFWZWUdazf3sPTGKjvLfySKZ08TtWL3hVlHNbWpo+1QUhsNWzaqlytHzE2tk@lists.linux.dev
X-Gm-Message-State: AOJu0YyKNmJyU47QobnbnRljYAEFLv3GHPmmE9ahW3mBIh3DSENJz8IE
	uwEJHfWpbIGZBFwprINW15lUfP7wVan9QIE6b8IYRGGexyerA9qDBSXT
X-Gm-Gg: ATEYQzxagT/GOMf41w4CbmDOPp+n28XDZwTxaa1jm3114LhmzVir37rPh55LAiI94rv
	U4WYulBv7kRUvNsP3N7WLsSopWDNu5JxqEPOZca34GDHHfaesQfMS14vDcyfXatbdK95pSr22eo
	XKZ2OuMHTx3BqIPG5p1v5AMFZapgUFiSLurhC3HZZp/hKBiQ7r/ey7We4lyqF0t4GRWhueYWTDl
	Hh0icKbaBHCWTkcuPF7u2PcStQBCLK8xn/KoU+0/d5EG/FMYtBBafaG+OQZc/nuPLPPIAg5I0jL
	/19hbvuxiE1n0IeNAD/16RZHLqyXlqpuii7aYUTsn33ldTpaao8IYLD6IQcUy4VPJRLsiENG7b0
	zpm7d7Mh/b5zRuqPBsHzRfIBheb1SuU5m7ot16s0e0KeWLS5w8pKRsBTA+9LfyOsNBR/TNm/UWk
	PMC9M5nDlqw3ZJfbskRcgvzz7H
X-Received: by 2002:a05:6122:1d54:b0:56b:5893:d042 with SMTP id 71dfb90a1353d-56d4a5fd9fdmr3557683e0c.12.1774765219500;
        Sat, 28 Mar 2026 23:20:19 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:6d76:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893d21sm4429929e0c.2.2026.03.28.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:20:18 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer overflow in vc_sm_cma_clean_invalid2()
Date: Sun, 29 Mar 2026 00:18:45 -0600
Message-ID: <20260329062004.492812-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062004.492812-1-sebasjosue84@gmail.com>
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

vc_sm_cma_clean_invalid2() uses 'ioparam.op_count * sizeof(*block)' to
compute the allocation size passed to kmalloc(). Since ioparam.op_count
is a __u32 supplied directly by userspace via ioctl, an attacker can
choose a value that causes the multiplication to overflow on 32-bit
platforms, resulting in a small allocation followed by a large
copy_from_user() and out-of-bounds heap reads in the subsequent loop.

Replace kmalloc() with kmalloc_array(), which returns NULL on overflow.
Also add an early return for op_count == 0 to avoid a zero-size
allocation, and return -ENOMEM (not -EFAULT) on allocation failure to
correctly indicate out of memory.

The /dev/vc-sm-cma device is world-accessible (mode 0666), so this is
reachable by any unprivileged local user.

Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driver")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
index 34155d62a..d597d41b4 100644
--- a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
+++ b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
@@ -1292,9 +1292,13 @@ static int vc_sm_cma_clean_invalid2(unsigned int cmdnr, unsigned long arg)
 		       __func__, cmdnr);
 		return -EFAULT;
 	}
-	block = kmalloc(ioparam.op_count * sizeof(*block), GFP_KERNEL);
+
+	if (!ioparam.op_count)
+		return 0;
+
+	block = kmalloc_array(ioparam.op_count, sizeof(*block), GFP_KERNEL);
 	if (!block)
-		return -EFAULT;
+		return -ENOMEM;
 
 	if (copy_from_user(block, (void *)(arg + sizeof(ioparam)),
 			   ioparam.op_count * sizeof(*block)) != 0) {
-- 
2.43.0


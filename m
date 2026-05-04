Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420CB3E63BF
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 17:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916666; cv=none; b=BjxNqnPokiMp718Elcu3NesEU8XOXm1GNXA8cdtmxxq65JoE4xQcefFQRUjXCwt9Txv3N2RaD4pj6KoSRx2N3fdC/dXAkuxUVNV3XF3pR9Cr91RWVJwgTgpG7KngfkZAsakWayKNfRMJW/7CFWXKPzld0eHFqXOFSMt8LmTcRp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916666; c=relaxed/simple;
	bh=YYvpgqkGcESzblP9Rg0okEYFQUZWUrc2vIkh5JgCDog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceS/rS4AICRIRuYo+0mEJOR1HNXWW6V5thMxM2E3dyEvuwzkCgwpvN+yHmpbKQqKX9zxc2R3bSbQyV9bIp05b7vpvURVd+a/xG1wZNopFW5l9VwOIIoxtwB59JAOW0sy9+dcO4wYkUd52K/m8GUp6hP1hO3KI3POWMj4ly7saFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjpzuIg9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjpzuIg9"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-823be54d49cso296016b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916665; x=1778521465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9NrbK7+XvJgPClZ1GqtV5IQNzES6CwjBK/rud9MZ0Q=;
        b=PjpzuIg9ASRz9wZ/Vjpb8EkvHaC6s7I3GyhRCXlhUYagd0oNvbm2ZiETt4YeI5QQUs
         MhN4MSfDURuGnynNP/Cw4pIMd0hHFJgvB6Rn5+6URJm7NiiIathgNFqTAylWSLUzHKcp
         KrbuDUVcGjEZcUqXRg+1UidJeFRFQUo8aGHuaKbzX1l3MrxRRa8HS4Kqaa1nxTYHA+06
         CChqdmT42EdkE0s2nJ2xFW8g5FOszCw9vWBx8gxzrrnZenY4Zg8/ZNLhDnQzcmK5sHRs
         HDbxZSKWW9Y1UgBW8vlaT+j3mtNvGakq6M7w6O0YzRkFEGy1MvnuwfU/v6//1IpfQ7ri
         C++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916665; x=1778521465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S9NrbK7+XvJgPClZ1GqtV5IQNzES6CwjBK/rud9MZ0Q=;
        b=Ns4E+gxLAaXvnNeu9gTf2+QvKO8H/hKEbD/9xP41g/cKisRv0OvTEDNXtj+d/WzA+7
         3suvuxe+17sdpbI1xi1UC9AR1IlJ59bO5E3peBd1N9DmwzSDUyChgmRTzjsbNjHKPEzM
         EJ7fEU90uTPwukSdRM+9bx4H4F8NPp5NTHdAi1AVHpD/2KgkfPhxCejmw8QgkPhK6+IL
         kQ9WUEJceUtN5R/P65KwJ8/4wu3LbtNvV/2MoYfCn+yYM8H55yKBVGMS//KKpRZY45Of
         qmaCg303bsy3cn3uhNATFOxrl+g/fhGaGC4PZ/7x1d+cgBMbT+c3ndG8MndpcRfdtTV4
         Qapw==
X-Gm-Message-State: AOJu0YyTl+zpzLO1hIJuvH1QZY5/rDYD7ucZCMnd5imF+ar7a4l+NaW5
	xHQ5XaOrPL3qorkbyjZoMAEvKBiHNsimpS1tGmQ3/Jsoj4orNKKtIWWV
X-Gm-Gg: AeBDiethtx4W97gYwLpBOkspCL12U9Q8Hgx0COTwnyz5v2sNCRSVM0tg1wd4Nq6zZZb
	upwKn8l2sjRDCjthKdI7PfruWbLpjAvFljpLfkDMDxFqYYVET84gokN0RPu7Jtni3Rgmm1TNeRE
	veUhDmcnmQrw3vQCNnaJ2yShqb4at9gL1koBQB6ZEzDnx80F9SLwJg1wgaMNubCUpPMJbPtd3hd
	2Gt//UovaEsaLrCIlTKyS6yBEV0BbpdGzaESOa2zHjeku9wSeZoVSgnX69QUjUNHhJpr8tVMfuX
	Y5zBUYI8jk7SODwLDpzFMrgMNE0qvTN52nyGrpHdfHkcdRgqzW6wop8oWBIvY4XLF8JyxLexnqW
	j8ZVji2ZF2TOgeGSYPUInxrC/ey4tObWWnhm5rF6YziOoSLZdVcfuJtYwdZLV6j3Gdw/74I89Dw
	TkI+QvxpD3BxNUTktTZQBdks4+Wlg/pwqvR9+jKWvcPsGE7K91dITOlUbK2lk+xaJmEiihu3xH7
	me3iOiDAhfwE90Mgcco4Urc9og=
X-Received: by 2002:a05:6a21:a510:b0:3a3:2819:5d41 with SMTP id adf61e73a8af0-3a7f1c8590amr6200524637.5.1777916664548;
        Mon, 04 May 2026 10:44:24 -0700 (PDT)
Received: from fedora ([2401:4900:a3fd:82cb:c080:4c49:655c:41ba])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83707fab756sm5923388b3a.44.2026.05.04.10.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:44:24 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v6 2/3] staging: octeon: ethernet: replace pr_err and pr_info with dev_err and netdev_err
Date: Mon,  4 May 2026 23:11:45 +0530
Message-ID: <20260504174146.117026-3-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504174146.117026-1-ayushmukkanwar@gmail.com>
References: <20260504174146.117026-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() and pr_info() calls in cvm_oct_probe() with
dev_err(), netdev_err(), and netdev_info() to include device
information in log messages. Use dev_err() where no net_device
is available (allocation failures), and netdev_err()/netdev_info()
where a net_device exists.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index badf5ceaf5b4..27c282ef64dd 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -685,7 +685,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	pip = pdev->dev.of_node;
 	if (!pip) {
-		pr_err("Error: No 'pip' in /aliases\n");
+		dev_err(&pdev->dev, "No 'pip' in /aliases\n");
 		return -EINVAL;
 	}
 
@@ -783,16 +783,16 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			dev->max_mtu = OCTEON_MAX_MTU - mtu_overhead;
 
 			if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for POW\n");
+				netdev_err(dev, "Failed to register ethernet device for POW\n");
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[CVMX_PIP_NUM_INPUT_PORTS] = dev;
-				pr_info("%s: POW send group %d, receive group %d\n",
-					dev->name, pow_send_group,
-					pow_receive_group);
+				netdev_info(dev, "POW send group %d, receive group %d\n",
+					    pow_send_group,
+					    pow_receive_group);
 			}
 		} else {
-			pr_err("Failed to allocate ethernet device for POW\n");
+			dev_err(&pdev->dev, "Failed to allocate ethernet device for POW\n");
 		}
 	}
 
@@ -812,8 +812,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			struct net_device *dev =
 			    alloc_etherdev(sizeof(struct octeon_ethernet));
 			if (!dev) {
-				pr_err("Failed to allocate ethernet device for port %d\n",
-				       port);
+				dev_err(&pdev->dev, "Failed to allocate ethernet device for port %d\n",
+					port);
 				continue;
 			}
 
@@ -897,8 +897,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			if (!dev->netdev_ops) {
 				free_netdev(dev);
 			} else if (register_netdev(dev) < 0) {
-				pr_err("Failed to register ethernet device for interface %d, port %d\n",
-				       interface, priv->port);
+				netdev_err(dev, "Failed to register ethernet device for interface %d, port %d\n",
+					   interface, priv->port);
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[priv->port] = dev;
-- 
2.53.0


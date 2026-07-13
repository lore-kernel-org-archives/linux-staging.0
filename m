Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61562372EE2
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929572; cv=none; b=eAbCoN3se+fbcT+KqTtyXxgGQFwk3GjS/lUAUzmmrcBT4/sv43H51ZnOt1CouOW3+dRf+t6gz1Mmc2+yFqiZSdEhjxanIQ0QBjdNXnAuSunqiWW1gOEQut22DHGOcfwAF5HlmqjHgtdFN4BLwU5We4fHO3kq08+Yc/r1vVMyYN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929572; c=relaxed/simple;
	bh=yUf7QAzaG22UhyMnb7xv53L+2ulCfAoeWbULNwxBGo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jh+jqmFSNpAjTIDjMHjjxqMqVtcdlJ+J52kOSbXEzjrZqEVpCcKfqrbnLe4GQElbqGOZyRDMYRIsmq4b960wvlC7G4/5hYphXE9zZR1RS1tzO6ob9rmmXILCRbkbPLSWyQ2QfTFJ/1QPluZhjnVJxrQJSqwcc7F65qYz0Sv4Ruw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd4RHXf0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd4RHXf0"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so2243862e87.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 00:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783929569; x=1784534369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UjgnQl+lofgz8kg+hRSlRuyz+bKImvtA3BtVguffiQQ=;
        b=Qd4RHXf0O9XismsEZ4Tr6RxFVkTxMjKOQ7PEbMGZ+214IDJv5bV7FDC2jjRptgmozm
         YFtvHozYhORCLaohtxxAwnC+dctkBzmmX2KC+fyZ+G1EMJ3WcJttGW5/JQISJHCwg7Bh
         oZYw3KyOZRDEKjGLzO92UIciVNVIDiulxZBK+DxQ61oOaNf6WaZ+DTOncf+zA1M7yAb+
         Wf8/KI13bUNeDS+ciKHf6rJpq9kV4hkip2yF+XwPea9BudHR0P3BFwIGDVWU9wdx7RJX
         QnTr2qNlAXxhCeQealYHliicJdRb//8X1bgqdWlFZ+F1Tb/W2lVmcAGAhmMpn7wsTQI1
         0l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929569; x=1784534369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjgnQl+lofgz8kg+hRSlRuyz+bKImvtA3BtVguffiQQ=;
        b=SfoH43cANBuHsLERJ15iodtjTemYjiA3EOs0LF6Z5ZHxMuTQ5XGchH6myQTD7iEszM
         0cNReQc6OAiD1/auONiVNIaO3PS2wqdI2S/ILzmsve4nkMuY9kj0enkSiCdj1t3jUt4q
         etu/517acvWjTLS5ILyWmYSqXNOFlzjzUT27Sh+AsPoPCcRvvSWQoJbPP1JXbAGExnq/
         LsR4ULULkmz3M6je+OzbmdawxhJSEJqzShXmX7U4eh48UelPmGVeMgUaMhNOLB4qubX8
         rx2HIGa/faaEmF51Ljmuj+meyLOIAFZpYd/3CB7ztkpk5KMB3EoTYrps9MX5t9hxojSX
         rymw==
X-Gm-Message-State: AOJu0YykYd75h7PyEHcJxHTGJ2pRotkxPoxs0ThQdLmS2G94+/O8cCNK
	0sHAIdp99OcmJcAmVMoQSVOzi3Umfa/8tsl7o3sPQOYPBfTEcujbFdEg
X-Gm-Gg: AfdE7cnVlQ1QhftcCExutaxZA+ntIwu4Yxc10efG5S2h6W+hvBJmvOJBIRyhnxfjnPO
	i54fhhekMsQJl2DBQHF3Ts1284Af16KOYJLdqW94um0+/FY6eR6j40wWDgwuKdXx8yjtbA/07Y3
	DpCDRqX2LpZ4OZMBHi5wnU9h/N/0H48m36WkjlzGt4GGpaMy7sivAtguH0rUCegkW1Kc4B4fMId
	6jHulBWa9ZRWkcjEiKY5IuID6yYZL1W5mXYtxKtVFGJ/Ta0eH337y7QBq9jY1WAsnzToBr+9ggp
	SVVSMXfqmGw7yFK+FDFSn9euXq9w/tIMube7kPry2J8su02mtl1iMfMRZORLdP4Ms+rjSZuvkBI
	AEva87NSYPlc9jBVcNymRL873XQZx2yUlktkHAdbqmhVWogu8KZQXb4ZzcV0o70Sy5IV2d4ICW0
	tGsdxsZM1eJxU0mid/A32JzX/baJnthQsTgtZtU0VefWUteVAXELmvRwZ0oQtYt+o/3M4y2QxOe
	gJeK+jbl+TX3+GzuPKjJ+zL
X-Received: by 2002:ac2:5284:0:b0:5ae:c636:5c with SMTP id 2adb3069b0e04-5b0236de96dmr1250953e87.47.1783929569205;
        Mon, 13 Jul 2026 00:59:29 -0700 (PDT)
Received: from archlinux ([94.180.100.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa6350sm2677148e87.59.2026.07.13.00.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:59:27 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH] staging: rtl8723bs: use module_sdio_driver macro
Date: Mon, 13 Jul 2026 14:59:23 +0700
Message-ID: <20260713075923.160099-1-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the module_sdio_driver() macro to eliminate boilerplate code
around SDIO driver registration and unregistration. This removes
the redundant rtw_drv_entry() and rtw_drv_halt() functions.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c43a0391a..d2419c776 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -448,16 +448,6 @@ static int rtw_sdio_resume(struct device *dev)
 	return ret;
 }
 
-static int __init rtw_drv_entry(void)
-{
-	return sdio_register_driver(&rtl8723bs_sdio_driver);
-}
-module_init(rtw_drv_entry);
-
-static void __exit rtw_drv_halt(void)
-{
-	sdio_unregister_driver(&rtl8723bs_sdio_driver);
-}
-module_exit(rtw_drv_halt);
+module_sdio_driver(rtl8723bs_sdio_driver);
 
 MODULE_DESCRIPTION("Realtek RTL8723BS SDIO WiFi driver");
-- 
2.55.0


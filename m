Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B033A382F
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741369; cv=none; b=F2lo3aCAEBQpYY1cPP97jfAvJwRGqI/kClkqB5DiFclDyhcsVmn0j5Q4jM9VwmfymDQJ8q6nzz7Nxn2mBkpDyuE8E6yKLQoFGGoBXWec6gS4VWApiuYygqGc1PNP7DtExXTCY+lSyEyTbFijXOQsGQfdzGSR+FCvgopeGjZSCOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741369; c=relaxed/simple;
	bh=/ST7iab6E23uI7Lx8dMR9h2HpOY57brDg7GqA4fZdog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ooq1YoygLFsxFAwV0qqy4Db1pLR2qffhC9kHQ0tROlwHDMzjxJKrLuWCAt5rtnsMkOBlNhmVKnKZjXiPVq0rBIYUqjaMpmZz7ViylN7sQ6Ev2W/oLYkkpYUyvCwRhVSQLeLrq3YR0Wh678tnYc9h9tMYn7PyAX1Y9mxePSIwJeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+g92Oqb; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+g92Oqb"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d7439f8837so302022a34.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773741366; x=1774346166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0gOoCtZM3Mua5e35+/r47JrDf15o9LNXiirT6+sgbg=;
        b=Z+g92OqbUrQuUKSwJYie6V6hxHj4IpJl68N/sdzqP7VEmppT0Ud+1LvxNlbzqd3ZLo
         0wm7m/ndOSKE+pHE81aD2hyKhc7WUL0lQVLrWloEUqTQoBQpZDb4mENyoJ3KcAabCP0y
         +I2cDUUKJiSGXeuEwyaO7NMaF4inwzpm7G1nEMCU9mt5KO7XPl+t9EdGTNgK9A+Smynt
         hXPPnmC1Ics960frNVfmeFWe3WcKzkiFBiXrAFKRBpH5J8h60/rRJrWC5cO4N3nchmDr
         hit9wA8tdml8FVNuwpeQQ2+gMbZqlvsmGuFnslBJ96Hcr9Q5xs8U9wnxwf0XpGzz25NU
         A2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773741366; x=1774346166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0gOoCtZM3Mua5e35+/r47JrDf15o9LNXiirT6+sgbg=;
        b=P9xfrlMHxSqFn2Hnffj+ct1NwdpmLvXnuFTyj5adeMpbG+1zWnKbjFKaLDXoy+89r1
         c0K2Vva0PMwTlPu4soDKKN7u4LtWepsH3MGyTbfzIRK1mKw29zdN4wAYN5EAqNc3g7Gw
         udqblD/p1cFkYiB5aJs1akBMjuWtQpm7wmD27eHVlPaWf21PFuSTISuM0FCKNGQPTaoh
         IT2SS4vaz7HPZk2FgexZGd4fNK+lwKAPsShCUgUQcjzCU0sVGmo/Yf55/DJdRsvSKwaf
         2FGRH1qibxeL+wkalBbPOYqEi3ZCGtq7rWU2qKfv0Qq46g2y5Og+ltnleY1py3L18h0k
         C7kQ==
X-Gm-Message-State: AOJu0Yw5uGgYwpUHN5E3qizmymOZZ2QiiLeglijOyyIHOF140qa7ipcb
	b0tg0BV02TXmKILUxnqGTEGga0yAlyR1zvy4+toBuRnd0+CA8mzyDH4e
X-Gm-Gg: ATEYQzxRtzJ9zqfyKz03KQkFK+tP+u9kVmoLnR64Z9ulVcBDJIs/gsNTO/lHAugOaaT
	CfTXUTMCPRPUikBRb3CQMmdbcpFPKocdnPIwVqK9nDs1BLBVuIY64mRsFe77cWismMGaGc/Fbea
	Fi5O5zLhcQAO5vqFiuvoWf44aNxFMGx014CXziYWo1uw8VNSAPxO2v2nCP/0T6m2UbDx2iNWK9h
	Hv62QcLR3OB598hDIOE6KJBv5Zmpbuc94+ENgO4xl1SPvAloFI4PI37jFs2onJ3iV68RZcSamee
	ocTIoiofsn7EOjPQIl4DRBvqW/Hot+cD0jaIvgYB+IUUrL3lOLhbEvYdODUAxP2TG12YCLyuJ7S
	S/mZk1B20J2LNGN6k89GFQBuOarenrywEMnw99bCFqUOKtXN1IoqayY9TCFT/OLuMsVDOekH8gj
	ivHYi6KsmXbJlPle3Vkmwwr7s=
X-Received: by 2002:a05:6820:2019:b0:67b:aee3:dfab with SMTP id 006d021491bc7-67c0499bf8emr1530613eaf.27.1773741365790;
        Tue, 17 Mar 2026 02:56:05 -0700 (PDT)
Received: from arch ([177.249.163.104])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bc9332686sm11558018eaf.13.2026.03.17.02.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 02:56:04 -0700 (PDT)
From: Marco Antonio Solis Segura <mshdevv@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marco Antonio Solis Segura <mshdevv@gmail.com>
Subject: [PATCH] staging: vme_user: fix missing blank line after declarations
Date: Tue, 17 Mar 2026 03:54:53 -0600
Message-ID: <20260317095453.54843-1-mshdevv@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing blank line after declarations in struct fake_driver
to satisfy checkpatch.pl warning.

Signed-off-by: Marco Antonio Solis Segura <mshdevv@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index be4ad47ed..eb918a857 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -67,6 +67,7 @@ struct fake_driver {
 	unsigned long long lm_base;
 	u32 lm_aspace;
 	u32 lm_cycle;
+
 	void (*lm_callback[4])(void *);
 	void *lm_data[4];
 	struct tasklet_struct int_tasklet;
-- 
2.53.0


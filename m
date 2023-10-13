Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D822C876;
	Fri, 13 Oct 2023 23:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYcwKDyk"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6b497c8575aso840754b3a.1;
        Fri, 13 Oct 2023 16:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697240854; x=1697845654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJrm38iAyueby6JBNctMCXPsnK32BGQQ6vdEWVAMrOI=;
        b=aYcwKDykOaESivroKlRioy1zqURIHAg0B+1Tbryzq3BwLk9mS9OlQ4ntlUHi3j97Xe
         hZ8XlUe48m3rykFPKJ2ty5hZlo/HK5RPeJ9adw5U2FaRkRngO7vDZw0Vb8HYHOmgiR/T
         6DXRN0NXJFHStwnWEtjB7T8Y04WZF5MP+gkSKzRDQOn7PCUdSaLq/ZoYuDy/v0Gi11mC
         p/A0l6HyttBKT14WYlnKlWRoi+uKGR891z87h3z1ENhBMfJ7V6mgE+2WQxoiuHWUcgip
         r1/Yi2aJ+I9VMl+zeD3yZFnFazb6kJfkOKVF805j20qtii0UGQbdoG7iZXqiEiHFaCrJ
         LnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697240854; x=1697845654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJrm38iAyueby6JBNctMCXPsnK32BGQQ6vdEWVAMrOI=;
        b=DcboROeW5Dov0RpyL551A1tx8kRZb+kTmpPZ27SMKE5RdHncA37CmP5CVm6QzGf0AV
         UTJGbfCMO6kOfEL0hWwLM+3Uoj3uGL1tyJgqdduiKA0NrpWkV2Xk1pM0jMiKXNkdeaa0
         0MLmitMH2xtcM5ONPnxmIEfYRoOo/GzSSiNgWDApyCpKm3oNxbQWSyGNRz1D02NFs2LM
         PfySFJ1v1p1Zjm3SHdgMA07xM9kkRTzAPFhCjzdFomXkkdzbkekAgQxjJA8bNYFk9aal
         reX4QlwsjjkUXURZXy14Vq6DcRNBCt1LY32/f5++2qO3sPw1lgED5B0i92R1TF3ytv8O
         jieg==
X-Gm-Message-State: AOJu0YzHnkk2eeRjmJlJmAcJGxXlQpKku9h0lHMSI4iJiA9xRIbovDq1
	n8mHmXkencWeqZIox3PQH3I=
X-Google-Smtp-Source: AGHT+IF1mGIbXjDKLdhU2OfABBCjTb53/aZjpWeSJXdEb++F85/NkhjrKRUi1T1G0bdAZx9se0SIhA==
X-Received: by 2002:a05:6a00:814:b0:690:3a0f:4165 with SMTP id m20-20020a056a00081400b006903a0f4165mr33074285pfk.32.1697240853802;
        Fri, 13 Oct 2023 16:47:33 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id 1-20020a631241000000b005a9b20408a7sm1980883pgs.23.2023.10.13.16.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 16:47:33 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 2/4] staging: vme_user: Fix unbalanced {} in if-else blocks
Date: Fri, 13 Oct 2023 16:47:14 -0700
Message-ID: <b0fad6de7405a105235b3b595e0bb2c51be7dcf0.1697240381.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697240381.git.soumya.negi97@gmail.com>
References: <cover.1697240381.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces so that {} are balanced in all arms of if-else
statements as per Linux coding style. Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/vme_user/vme.c        | 3 ++-
 drivers/staging/vme_user/vme_tsi148.c | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 80083ea0fb53..6519a7c994a0 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1849,8 +1849,9 @@ static int __vme_register_driver_bus(struct vme_driver *drv,
 		if (vdev->dev.platform_data) {
 			list_add_tail(&vdev->drv_list, &drv->devices);
 			list_add_tail(&vdev->bridge_list, &bridge->devices);
-		} else
+		} else {
 			device_unregister(&vdev->dev);
+		}
 	}
 	return 0;
 
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 2f5eafd50934..d549c22da534 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2118,8 +2118,9 @@ static int tsi148_slot_get(struct vme_bridge *tsi148_bridge)
 	if (!geoid) {
 		slot = ioread32be(bridge->base + TSI148_LCSR_VSTAT);
 		slot = slot & TSI148_LCSR_VSTAT_GA_M;
-	} else
+	} else {
 		slot = geoid;
+	}
 
 	return (int)slot;
 }
@@ -2196,9 +2197,9 @@ static int tsi148_crcsr_init(struct vme_bridge *tsi148_bridge,
 	dev_info(tsi148_bridge->parent, "CR/CSR Offset: %d\n", cbar);
 
 	crat = ioread32be(bridge->base + TSI148_LCSR_CRAT);
-	if (crat & TSI148_LCSR_CRAT_EN)
+	if (crat & TSI148_LCSR_CRAT_EN) {
 		dev_info(tsi148_bridge->parent, "CR/CSR already enabled\n");
-	else {
+	} else {
 		dev_info(tsi148_bridge->parent, "Enabling CR/CSR space\n");
 		iowrite32be(crat | TSI148_LCSR_CRAT_EN,
 			bridge->base + TSI148_LCSR_CRAT);
-- 
2.42.0


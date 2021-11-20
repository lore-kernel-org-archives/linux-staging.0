Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297242C83
	for <linux-staging@lists.linux.dev>; Sat, 20 Nov 2021 16:01:38 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 206so6229298pgb.4
        for <linux-staging@lists.linux.dev>; Sat, 20 Nov 2021 08:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Ky8vda2f/TaIwcftvJ93YOE0VOIb/9YtM8HnHTjeqPA=;
        b=mWTDAtl8mtYZ9uMQ+uPrBAovWt4xPcHXS6VYfK+rYZs2Lbudn6r3nG/lRcY4c5IAlg
         KzgWoSADHcdrdpE7zzDIImlY9TkTCEnHmj9zyHPHy5eQqG40YuuG8qj7NQdbCkmkqjZg
         ExQSB1pdvWF07/AW4fUHQ5H9kNFcrDYx7X9G2DIJTVWk+93LvjpU7lAWoYJApiANUdWm
         FyhqgV3MZ7z1gMK7+KbSTXmPV4StoK9ch901aH349mofyCURiRp4wTXm9MEZbOYwvhmc
         dytyHTB2fI1GUS+ZEKr5H+M9z4NuVJUdBllKpgdnVVRvdtZkZfELJZowkhZAgAa28OAu
         RoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Ky8vda2f/TaIwcftvJ93YOE0VOIb/9YtM8HnHTjeqPA=;
        b=in1H7TFPaO4bd36ETN6iiXfN/fFm3ZIeRG+jmqnUfQXpPW4C5rH1CIgXFbDSlCsezz
         fZGn41erC7klpo6dfvtM7PoIvzG9qnhqVtjTCUONW0cicZLIKRa2Fr+jLUBUIB/rVQdu
         xxlKVQXPaah21LUoD0Ibj4HU8jhi1hAIt5SddGml2bLkyliLMwRcXjd6L3hTYaXM7Nv+
         Y1GclpveJUuGelNd2BMdlD0qn2OdeBrPu72p45Wg+aVC1Eu1dwYOVHO/ut5O6mJJWSCG
         XWHZqnXLLZ6vaZ22javQBQKhvCxUGI8DEJXKn4lFSEIzcsQMj6ALoYMm8Yu/B6eoAoIH
         e30w==
X-Gm-Message-State: AOAM532OvH5N32UIxZ4nOfaZ7j0YAThjlOH8evAxSnP4yOCP+phtFxuL
	z8AfuI2ouY/OPvAw8Q1m7qM=
X-Google-Smtp-Source: ABdhPJy9OatEEdW3TF/tPuDyJN4Uj59SAgteyn4pw7iqWByZXoqHLEdPo1jBElkxa33k1b7W/P8vmg==
X-Received: by 2002:a05:6a00:234a:b0:49f:c0f7:f474 with SMTP id j10-20020a056a00234a00b0049fc0f7f474mr31424693pfj.64.1637424097498;
        Sat, 20 Nov 2021 08:01:37 -0800 (PST)
Received: from debian (ZU155130.ppp.dion.ne.jp. [59.133.155.130])
        by smtp.gmail.com with ESMTPSA id g11sm2386730pgn.41.2021.11.20.08.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 08:01:37 -0800 (PST)
Date: Sat, 20 Nov 2021 11:01:34 -0500
From: Satoshi Ikeke <satoshi.ikeke@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: replace printk(KERN_CRIT...) by
 netdev_crit()
Message-ID: <YZkb3t83RFxVMWH4@debian>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace printk(KERN_CRIT...) by netdev_crit() for more uniform error reporting. Issue found by checkpatch.

Signed-off-by: Satoshi Ikeke <satoshi.ikeke@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 490431484524..8c90cb3a68ed 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -73,7 +73,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 	err = sdio_claim_irq(func, &sd_sync_int_hdl);
 	if (err) {
 		dvobj->drv_dbg.dbg_sdio_alloc_irq_error_cnt++;
-		printk(KERN_CRIT "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
+		netdev_crit(dvobj->if1->pnetdev, "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
 	} else {
 		dvobj->drv_dbg.dbg_sdio_alloc_irq_cnt++;
 		dvobj->irq_alloc = 1;
-- 
2.30.2


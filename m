Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F742F3A
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 02:53:14 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j21so3469302qta.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 19:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northvilleschools.net; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hOTvV/BSKqVkGgoGdzHd4gweYpV9pcJ3dB6vvIoE2gU=;
        b=BVTlqSXDh/6F0/7cr+KPmDGtn27xHshwmogWqP00WdmxLteEOSwZlNSaJOBLvd+qb8
         qDa/rgK6dn+meP1EArL1V2duBZi3GoiYWlb3tRa7rbmwb3AVfAY0EjJiPH4g58yZwV+j
         hXQ6fFN9lyxmI35PDNl0E7mn2MH1ILNXdkVdC8FVSw+vvZPTwQlgpKZXPpOq7eQnaUp9
         A1YNDqvQ1teAgSYR/v6hGxb/FJTFaSYmMjuxnUReFY/sUGPw16VtSK7XCc1CCT5OPs5r
         +5IrEj060hA7qwHGOCxcOm+3D2dSqsAPi98UwulgRarYityfafdUH25Swou844UKQNCa
         bUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hOTvV/BSKqVkGgoGdzHd4gweYpV9pcJ3dB6vvIoE2gU=;
        b=MMz6TshD+NpTDazds9wLYyx+9BKiiJl88RA2AJK9mU64v21RbpVuy7pGeedGRhuZTB
         quMIiI+egIGxYg/hGVycEUA77iuZ2Ss156xSXXzPHxu0z3ChS8ys5eEADhv7F6QN/N9F
         QUe75m678yiqi5Oh3dycuu3dFLuWRO0+ZP6mVlx62FT+6QEFEFo5QozskrmCXOkWeBBP
         uYhgTt+a78wYkKa3sOou6RH4MVjeCIR0bnA+vOwAw/evCl7HrKzbKC0Ck1wJgtDi/M+y
         6RIW2/A9ItROZfBvohhA2yOmmhU155cZGR0JY3wabMByBdw+4TNrqPnjAAioRufQjM+C
         if1g==
X-Gm-Message-State: AOAM532JUoS4bA20lZ781QjxWUd2B8Apz8TSec1aHabhhvYw1wngWfD0
	3tvks73M8/JuY5Szismj08Tckg==
X-Google-Smtp-Source: ABdhPJxcSCr7rDUc/YBUZSvGfZQOTDxzd+GR7tv+xBZ0n9tA0G7tmJVSHCMEVmU70JPw4w7J13sEYA==
X-Received: by 2002:ac8:4b61:0:b0:2d1:cfc7:2989 with SMTP id g1-20020ac84b61000000b002d1cfc72989mr2184228qts.416.1647485593603;
        Wed, 16 Mar 2022 19:53:13 -0700 (PDT)
Received: from sckzor-linux (d4-50-247-168.col.wideopenwest.com. [50.4.168.247])
        by smtp.gmail.com with ESMTPSA id j4-20020a37c244000000b0067d79a3fd0esm1817540qkm.106.2022.03.16.19.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 19:53:13 -0700 (PDT)
Date: Wed, 16 Mar 2022 22:53:12 -0400
From: Charlie Sands <sandsch@northvilleschools.net>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH V2] staging: rts5208: Resolve checkpatch.pl issues.
Message-ID: <YjKimAdiRfRVfGl8@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch removes unwanted use of dev_info for ftrace-like functionality
as suggested by checkpatch.pl.

Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
---
V2: fixed bad commit message and compiler warning

 drivers/staging/rts5208/rtsx.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 5a58dac76c88..2284a96abcff 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -159,8 +159,6 @@ static int command_abort(struct scsi_cmnd *srb)
 	struct rtsx_dev *dev = host_to_rtsx(host);
 	struct rtsx_chip *chip = dev->chip;
 
-	dev_info(&dev->pci->dev, "%s called\n", __func__);
-
 	scsi_lock(host);
 
 	/* Is this command still active? */
@@ -186,10 +184,6 @@ static int command_abort(struct scsi_cmnd *srb)
  */
 static int device_reset(struct scsi_cmnd *srb)
 {
-	struct rtsx_dev *dev = host_to_rtsx(srb->device->host);
-
-	dev_info(&dev->pci->dev, "%s called\n", __func__);
-
 	return SUCCESS;
 }
 
@@ -968,8 +962,6 @@ static void rtsx_remove(struct pci_dev *pci)
 {
 	struct rtsx_dev *dev = pci_get_drvdata(pci);
 
-	dev_info(&pci->dev, "%s called\n", __func__);
-
 	quiesce_and_remove_host(dev);
 	release_everything(dev);
 	pci_release_regions(pci);
-- 
2.35.1


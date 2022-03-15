Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4CB10F3
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 02:27:43 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id h196so14454635qke.12
        for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 19:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northvilleschools.net; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=PuIMjui1Ge4EhyWDZpr9OGS4dz+9ZtjP0SsU+pEdP2g=;
        b=VjJPcNPhiccH4ZpCpc7PtlucjeS4mTJpt18MJMmQnKeA/OPiovxPM5aoxlvJ8UJzxl
         h9RFhSBjBTzcQu7XnVER0sFiF75DIgyTh5/Xdq2O4HnY0jVa8c1H6db6z25KDCNIj/h5
         9ZDJunhwi/vD/So39vqrsE359J8jUsMjFrUrBW5CrdHPB2ObQ0tcn2G5gdgm8ZonC9g4
         WCxpxzLJDs03WD5MPITF9a06YG2HZIIfa9Au1yPlL27l49TLCnzmBEU4ix6lBuSzG8U+
         tsyGDR+1zt6C2WM6yeMonqSDCWSZeduM7FBLvyZedB/693oHamr3ho89Hw4B18gNYm+w
         +DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=PuIMjui1Ge4EhyWDZpr9OGS4dz+9ZtjP0SsU+pEdP2g=;
        b=D8e2CBfoelwFgcBe1wJ9SDMLJEsGvZGz49gWObiNzE0R0aYqOTWuRg+Rf9mVSvTdUP
         ou54ozpxcwHOyr8eOZ3ID8UrDr1GkdbVqmKSvQPfQueSXLSpFPbNfoB4YSJ4dODWaRkN
         fzIZUWVhNzlUepxEf1EfCs/tEQG4fVKvMqN1zKUukX7qOR6KR39ENdwr09IUfY/yVXBn
         XzPYnH3FIq2u8HD2Fd2df0k4YcjM1TFoIUOorFP3q2RhBLzH28v9UezeCF7dmCKGaeDp
         tasyrLy9nAm99XZIHBG7fCvhLtYbZINGZEjGrTA9DOM6XbEAeTKwNi5kCf7XN6ff6rXV
         FV7A==
X-Gm-Message-State: AOAM533Bb4+BXnxXAKHLHarS9WhA9ZKFOQDP/oLeYfMPBRUz7UTtG74O
	Yh5ZbExB7P4Q+4RahAZX2NNqpwXTvKAZqsiMzQI=
X-Google-Smtp-Source: ABdhPJxPy8lQkCERhKpA7+QhUzhl7HtMqbu8E8la6bO1tyWBGiKtvivXkMnA6YZXbpiT6S9/J5FKww==
X-Received: by 2002:a05:620a:f14:b0:67d:1b1c:cf34 with SMTP id v20-20020a05620a0f1400b0067d1b1ccf34mr16788449qkl.479.1647311262143;
        Mon, 14 Mar 2022 19:27:42 -0700 (PDT)
Received: from sckzor-linux (d4-50-247-168.col.wideopenwest.com. [50.4.168.247])
        by smtp.gmail.com with ESMTPSA id p13-20020a05622a048d00b002e1ce0c627csm4222518qtx.58.2022.03.14.19.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 19:27:41 -0700 (PDT)
Date: Mon, 14 Mar 2022 22:27:40 -0400
From: Charlie Sands <sandsch@northvilleschools.net>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: Resolve checkpath.pl issues.
Message-ID: <Yi/5nEXVmzZrbfbz@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch remedies the following checkpath.pl issues:

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+ dev_info(&dev->pci->dev, "%s called\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+ dev_info(&dev->pci->dev, "%s called\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+ dev_info(&pci->dev, "%s called\n", __func__);

Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
---
 drivers/staging/rts5208/rtsx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 5a58dac76c88..643d33b9a239 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -159,8 +159,6 @@ static int command_abort(struct scsi_cmnd *srb)
 	struct rtsx_dev *dev = host_to_rtsx(host);
 	struct rtsx_chip *chip = dev->chip;
 
-	dev_info(&dev->pci->dev, "%s called\n", __func__);
-
 	scsi_lock(host);
 
 	/* Is this command still active? */
@@ -188,8 +186,6 @@ static int device_reset(struct scsi_cmnd *srb)
 {
 	struct rtsx_dev *dev = host_to_rtsx(srb->device->host);
 
-	dev_info(&dev->pci->dev, "%s called\n", __func__);
-
 	return SUCCESS;
 }
 
@@ -968,8 +964,6 @@ static void rtsx_remove(struct pci_dev *pci)
 {
 	struct rtsx_dev *dev = pci_get_drvdata(pci);
 
-	dev_info(&pci->dev, "%s called\n", __func__);
-
 	quiesce_and_remove_host(dev);
 	release_everything(dev);
 	pci_release_regions(pci);
-- 
2.35.1


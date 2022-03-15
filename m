Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094F42912
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 21:15:09 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id kk16so490541qvb.5
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 14:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northvilleschools.net; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=zt1OL2xVjdGJFHy645jKL0xvPay0033GOEEzUn5jKUk=;
        b=JA2HFkl3fdUjf7ZUvsQjSrBfMjNMYm45ExJngSlwKbgHuGZ6gAuggePkU4GaS8G5Yr
         t8t2rv8yK6YrP9CocZTAS0BYabjqpfxeY5+jmITqSPQk+0b6fhvTh0JqkF7/C8qPwFyG
         UUB9U+111KZI9Cc2+4klhNj0Y8XBX2GGkYUcAW9RyRlq8+zpUDBXxyK9Tg9JGtzBstW1
         608BqV+ykIUOjhq3hp4PXJ8YlAZKNJE60W7acWsABP79xoipU3EedX7I/xw6w8WCuhOC
         9tx79V8FOskkWxFrwBlhootPqYh/siYqpVnB7BDm3DBWM71JqCSMR41Ftww2nQqVTCXm
         velw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zt1OL2xVjdGJFHy645jKL0xvPay0033GOEEzUn5jKUk=;
        b=GgXnKx+uJhEPctt92RTMHEtiEtN6xJfr4uc94waVrcV8ZeHj1Ug6eA3/fi6nJBVWWQ
         Hm/teFpKu0LY//V8lbtxsxeSiLgqVAE9UeBKUZYHoUH6SOEjvwbe3ZNuD/nC90oagKOk
         hkCxHAEOKN5aNddyBQafxsMh5eWz2RdC1r+G+bFvHaAfm4JkpRHn/vtnP7YdBa/TZ7og
         8Ii6kOoVcQmkk8lIJZrry/NtkXoP9os/olMV82Z3AfA579q95cTtq9UTOYxEJQC2zQ89
         C1BuZ7f/A2c16++ODK9hexjMkbgIZHmlt59DMZvwxYG5OEvJIzGKbLCi1IFTZVDwSe/Z
         S8eQ==
X-Gm-Message-State: AOAM532YJVriQCqkbQfv5JOuVMwdWK9lr1uYFPEzoIjMqviuhybRfGtq
	LDMkF/QS6+R65lqkIZl8P5eWyg==
X-Google-Smtp-Source: ABdhPJw92dYbx3bTvF1/mjzabEzXu4uY4Sg0EurCPJyw1tU73GVyCe9WguChpVIbDumk5rWpihQtqA==
X-Received: by 2002:a05:6214:2309:b0:435:374d:4bbb with SMTP id gc9-20020a056214230900b00435374d4bbbmr22022590qvb.105.1647378908702;
        Tue, 15 Mar 2022 14:15:08 -0700 (PDT)
Received: from sckzor-linux (d4-50-247-168.col.wideopenwest.com. [50.4.168.247])
        by smtp.gmail.com with ESMTPSA id k10-20020a05622a03ca00b002e0684cf81fsm58022qtx.73.2022.03.15.14.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 14:15:08 -0700 (PDT)
Date: Tue, 15 Mar 2022 17:15:07 -0400
From: Charlie Sands <sandsch@northvilleschools.net>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Resolve checkpath.pl issues.
Message-ID: <YjEB27xzf+krm3ew@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Always test-build your patches. Applying this change results in a build 
> failure :(
My apologies, I ran a build test on a copy of the repository with my changes
stashed in order to look at the original checkpatch warnings.

> Please fix up and resend.
It should now fix the below issues without build warnings.

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+ dev_info(&dev->pci->dev, "%s called\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+ dev_info(&dev->pci->dev, "%s called\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+ dev_info(&pci->dev, "%s called\n", __func__);

Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
---
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


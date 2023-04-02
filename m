Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC0442D
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 15:32:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so16662496wms.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680449566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROdznGkDW/Cnxv1c0rSMvRWt/kX2WgW6XJagkUDkrao=;
        b=NjQ+bX2U5JDkfRb+BW+lAjJ83wvPvSfQf9bG+I45s2iP5SZIb3QfZ1AxXHrGNMnvlR
         PRuCMbszFMCwxrucLB99qJc29r+ScRN5UhbNJuyb+DuLC5m6m9bntuXnW1PItZfyjdPE
         4I6aevZXVZV6uFQTOj1wuvHLeg6c143QXQck9iN0J4eufQ1ahRDoBQS7rr7sm0JqKqMG
         YSKGDPFqTnaOgRg8jY4wMX8eCp1JLFoc5P0mbyUSvkHZiC0YdIMxUQfCW/E9JyEPHgih
         LCYv2zpCxGEwm5hJ4j/3RhO9s4F6PWBtkTo0HYE65ESvWbE5eRyB7FRAP67RmRHL7FIF
         EdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680449566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROdznGkDW/Cnxv1c0rSMvRWt/kX2WgW6XJagkUDkrao=;
        b=mBHp1dEWXLOEKKgFJG2qOMmATEbWsyYE2qEr4gjE3nrZAW5N9MCvqrXkV6CfpXw2g5
         YDUADy4Wt8j3/LwfGgp+YZHpBJqrWOBxLginOPwnVMVDvBbM8V0IA4t/vxmAn2D7Z0Oh
         BQ5Q1kNmJxUHN0cB8zIQhajr9cVUA9L/SuDeoTMUGqEv37Qs0KsoYjK3gpx79AW6ud+g
         xI+mQQ9tJMYZiBB+OeR1RDGYRKTE1pgyXHUQpPKiwk0SgLBGh9ZeLs//6KAXIyEhj7yb
         W1H1Oc7FOcGbfLTwWKcFriQJ+SS8/MRvTRTn9achl0mOpNobAj9lNMjbtlvQOKRo7qGY
         Y8eg==
X-Gm-Message-State: AO0yUKUQwNp7W4zpsOSqr4PlTqc5jdQr3c2rHvpH/YA/jkW26qcKBZlm
	m8Xyh7qLS2iK2UqvWb3XXg==
X-Google-Smtp-Source: AK7set8v3PAD+xMYhMSx0hmgJk9LHrWsbe2xJjPqyspqOmodgzn2EpIAllkqSSRt8wHtc4VnnZWZug==
X-Received: by 2002:a7b:c4c6:0:b0:3ee:5754:f139 with SMTP id g6-20020a7bc4c6000000b003ee5754f139mr24350103wmk.13.1680449566619;
        Sun, 02 Apr 2023 08:32:46 -0700 (PDT)
Received: from koolguy (dslb-002-205-192-117.002.205.pools.vodafone-ip.de. [2.205.192.117])
        by smtp.gmail.com with ESMTPSA id v20-20020a7bcb54000000b003ed2c0a0f37sm9321258wmj.35.2023.04.02.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 08:32:46 -0700 (PDT)
Date: Sun, 2 Apr 2023 17:32:44 +0200
From: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: add comment to spinlock_t
Message-ID: <20230402153244.GA12609@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch.pl warning: spinlock_t definition without comment in
drivers/staging/wlan-ng/hfa384x.h

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
---
 drivers/staging/wlan-ng/hfa384x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
index e33dd1b9c40e..fc6d67cec5b1 100644
--- a/drivers/staging/wlan-ng/hfa384x.h
+++ b/drivers/staging/wlan-ng/hfa384x.h
@@ -1000,7 +1000,7 @@ struct hfa384x_usbctlx {
 };
 
 struct hfa384x_usbctlxq {
-	spinlock_t lock;
+	spinlock_t lock;	/* disable interrupts while working in hfa384 or hfa384x_usbctlx */
 	struct list_head pending;
 	struct list_head active;
 	struct list_head completing;
-- 
2.25.1


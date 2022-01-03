Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C62C80
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 23:26:22 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so38993674pjj.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 15:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=TImvYhTQWFr0YfBVbpdLjvTy76TIgj121A4b+zqdZXg=;
        b=Zkkzhoe4agRWHMotPs+Mof8gpE/7yF/Lo7HcEHVkqDLyS7yl7k7X4kovUADnYCRvct
         ThFimL4c/NLbv4sgzVjfE6dat0CFb6GogVwF55Sm6WgnIoHxNscF5T/L2Pftxr4XWdid
         RZd5ltdt6mDGuYu4bVbdFiSmPU/963gQYFkjEIiBBJBElWrnqcoEdSaJoej1fss+nbAM
         RzL3v2nI/rDhcLRcFDeWGl/8200l0663KfWGRk012DKJw8G8W4n3INrx7H692lmxccdo
         3pZlMSFlzmGuJEb18ZrkD7055cMrVPNhLNXd1OXcHMl+/sTH6CaloT6tXx0ND7QtMlMh
         JzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=TImvYhTQWFr0YfBVbpdLjvTy76TIgj121A4b+zqdZXg=;
        b=5qdqqJJC0Mq5u2WqxeyXMgNtOfxH1hWTS7MiVxTuVnxAPohdn8ogE+DdNn5G2tCuYL
         Gi2Oemo1mBNFcEZ6aw1z0tKRzHZC7fP42EurIbLeIdOaBKsTAWaPeiwyAHkqUxfCRP2e
         iRliabfNfeIhSXb0JmzFoAvS3q/Wj083l9wqPR17gkt+ln+W25PtvWKneG3CwhPyZpEc
         6YpKfQPylW2i2QXjycO5HAXDyfnvcbsNcI9e/nbxbFjAtiquk8l6vO6L7EPKWEGVNs1d
         S29Gm5jgvw/s+UtfrrDYQsNRRD0YCrWlMf8DFiidB/+rLBk8PYLMnK2fwzXRtGq2srd3
         pkHw==
X-Gm-Message-State: AOAM531wQxi/hNt1UzaRpBKnN0WV59c3ASO1IPH35GmI0/RfygBs/tNR
	FRfs5QgrSwNh1ZqMBLBPdo8=
X-Google-Smtp-Source: ABdhPJxFB/gL4NQWSORjKPYNmCqHT7u3Y87gUgAVvHj8FiNUnY88bZEjcOB8VCbtuf6lD9mXakaa1w==
X-Received: by 2002:a17:903:228b:b0:149:29da:e624 with SMTP id b11-20020a170903228b00b0014929dae624mr47136411plh.77.1641252382016;
        Mon, 03 Jan 2022 15:26:22 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id q19sm40531132pfk.153.2022.01.03.15.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 15:26:21 -0800 (PST)
Date: Tue, 4 Jan 2022 12:26:16 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, realwakka@gmail.com,
	paulo.miguel.almeida.rodenas@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: pi433: add comment to rx_lock mutex definition
Message-ID: <20220103232616.GA11161@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdL6QzDK26W5WnaD@kroah.com>

Checkpatch reports: CHECK: struct mutex definition without comment.
Fix this by documenting what rx_mutex struct is used for in pi433
driver.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
v4: wrap changelog comments at 72 columns where possible (Req:
 Greg k-h)
v3: wrote a more succinct desc so it doesn't become out-of-date (Req:
 Greg k-h)
v2: ellaborate on reasons why the mutex lock is used in driver (Req:
 Greg k-h)
v1: https://lore.kernel.org/lkml/20211222093626.GA13332@localhost.localdomain/
---
 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 29bd37669059..68c09fa016ed 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -92,7 +92,7 @@ struct pi433_device {
 	u32			rx_bytes_to_drop;
 	u32			rx_bytes_dropped;
 	unsigned int		rx_position;
-	struct mutex		rx_lock;
+	struct mutex		rx_lock; /* protects rx_* variable accesses */
 	wait_queue_head_t	rx_wait_queue;
 
 	/* fifo wait queue */
-- 
2.25.4


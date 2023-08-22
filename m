Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE36ED5
	for <linux-staging@lists.linux.dev>; Tue, 22 Aug 2023 04:34:43 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a7781225b4so2760924b6e.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Aug 2023 21:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692678882; x=1693283682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/B6vSrfqQkHZ9MGnWavpPlid0LaCXX9sTu7mRh3O40=;
        b=CSsvM8hp3zvOhZ7qiYO2s6YUw1K8nGMdYE2Uzxl0HaavaRsv77ln3r5n2G5ISifKpA
         hebPnxsOLxQ3SjeysWxYOAVDiLwb61VMKn61shKH94GEJkHUlYvsrYY6sKO4x15eHSMB
         uarrQmG2qmxHU14g6et8c2XSmyn3r6tJ8o6kmuItlQgRZqugoiBgtTKGoxJCpjvmllJW
         r6w7wbPTbuKF0hSk4EG6xf7nivvkWP2I2xXgZVv1AiGOqOwn/jqiH8T5ASns1FvV9E+b
         JzA8VGaLp/3zvmcAAqcCH7jTMeLxZmADd4AjFq3j6QYuLcLfKXLh1hznSWtnYEFDOxYb
         KHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692678882; x=1693283682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/B6vSrfqQkHZ9MGnWavpPlid0LaCXX9sTu7mRh3O40=;
        b=aCHeEcK+pF3wOGSQ2DNXHv8KIrRe/6Dz0GdGm9qo6WKLKXP6YboqbwiJlBjneh6Tfp
         MN1PFEn0Cm6upuMv3iQldVGN6MXLSe024DhZt8HYgye19jbJne4DRNE4b1/VUKTBNglc
         ggIL5/b9zNJ/xFEZxPBO1u0RBOxJs4rMLsk2KAUJERyuCxR68v//sYc4flTppGUDmSCc
         fLvpvy1zCZT+Nlb9c0+PM7424BU+NTu3Yfhz1ZSWzNkXqDfesb81o7teO1+nPeJ04JrH
         HxusioZZTzz5dO7LkOc5CKJZv8Sn4QL4Px3ypBZ2KejeDyDRf4eImijuu8Z6FTHqE8PG
         cy+A==
X-Gm-Message-State: AOJu0YzUfIQOgeuVG+NJo/a2Wk79ZHvFiUNEV9QM7ZSVsWvKE7Y5Qf6U
	uTfemwCMSQpe1EJ3GQ1Un5k=
X-Google-Smtp-Source: AGHT+IGfkVNEJkRALtoo5l+ZFeQlBOR5Jv8a61+OQq8fWc5wxHXxbi1m3M88hFXxMvz0I6Qipj9a1w==
X-Received: by 2002:a05:6808:408d:b0:3a7:470a:e702 with SMTP id db13-20020a056808408d00b003a7470ae702mr8893825oib.16.1692678882647;
        Mon, 21 Aug 2023 21:34:42 -0700 (PDT)
Received: from XHD-CHAVAN-L1.amd.com ([103.115.201.73])
        by smtp.gmail.com with ESMTPSA id a17-20020a17090abe1100b0026b76edd607sm6959365pjs.15.2023.08.21.21.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 21:34:42 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix alignment of open parenthesis
Date: Tue, 22 Aug 2023 10:04:26 +0530
Message-Id: <20230822043426.1966-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all CHECK: Alignment should match open parenthesis
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 727b956aa231..d0ca82a755e4 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -381,7 +381,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
 			read_timeout);

 		if (ret <= 0) {
@@ -522,7 +522,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
 				 >= words_to_write,
 			write_timeout);

--
2.30.2


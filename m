Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780AA7B;
	Sat, 11 Mar 2023 11:58:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j3so5046061wms.2;
        Sat, 11 Mar 2023 03:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678535883;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ptrqZeh9HIGFI7MOVZ5moQhtRx3GFjYgX8SReWprvoM=;
        b=o1Mj3GY4Cn8akOv3bHd+q5AVPYVXfb7R6wjvmJa6UvIiBcvNwFxxKoC1TkeBuxYBuB
         KNY4iurBv+NevaSDDRaelltwmR5EW4tDPJs+ZjE7V7z69YW7aln/QnVlQRMVJb/1njgM
         jYnOZhOQuyxKp8bRou0xOvqFxq0fXKmGFUQWT2BAtOn0itqzM+ZVCmEJt+7CTE4FLymu
         bXqEdsm2gxL8CTPEpgqk5JLwlEyJN30aAaZRV0E4frIuBh5fpc7GpKo5W6RYzG30kzVd
         WXpPrOVimqER6/DGyFdeww44lEnAKDhfGnPPEHzldKEYFN6o+ZfsApDKl1OxSRB6HK2H
         2Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678535883;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptrqZeh9HIGFI7MOVZ5moQhtRx3GFjYgX8SReWprvoM=;
        b=KpPiyPpWdPhXDih4fljKEqywiBo+hPfVWQAPHqIlWcBRgrOgXsAiXZ1UQD2NoVFFL7
         xNol7nMFU4gV3kbhPbBD/xWTf9eJ4gLdNfi176OSSE5QibVBhkMrbw+VyOVJYMvjOZPA
         RypOkrI8MlIVQckZS0huZgQB9tJ239bbbTl1h6uHFYI7L2VedDIRWabwPQ3nNlfNGEK6
         T3D4YCfPe1YF2Ko5Z/48Bbqi4iO0wNBpcn4wmyGCrR8wX/8FyYyHQzP+cMo8OPQ2EYB9
         ZpATS4nByIUM6u8uo/UOP9C/6zDKU9m+3qiix8jd0qlM5RvVCKuFmPnvDXuUukXseiqb
         VdpQ==
X-Gm-Message-State: AO0yUKUdnfzcvGJKlW6nxhQRJNAF40qT8Q99cMVZidyHgZ5BCmffD6eU
	TUGdizGqD/yTc5V8crVG0kkHVWUFH17HYUGH
X-Google-Smtp-Source: AK7set8DJMGgjuDt6KMKwOHFqDnTPy/G6R74HQnLW9Dhwnbc7BpnAH3dSjSK52muIZXjMP6gY95/hw==
X-Received: by 2002:a05:600c:1c0d:b0:3dc:4318:d00d with SMTP id j13-20020a05600c1c0d00b003dc4318d00dmr5525596wms.11.1678535883563;
        Sat, 11 Mar 2023 03:58:03 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id k17-20020a05600c0b5100b003e1f6e18c95sm2641027wmr.21.2023.03.11.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:58:03 -0800 (PST)
Date: Sat, 11 Mar 2023 16:58:01 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: axis-fifo: remove tabs to align arguments
Message-ID: <ZAxsyX8n7G92nlJh@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In file drivers/staging/axis-fifo/axis-fifo.c, in line 386 and 529, the
last argument is indented as if it were an argument of the second
argument. Remove tabs to align the arguments.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
Changes in v3:
 - Do not align the line 530 since it is not part of the last argument.

 drivers/staging/axis-fifo/axis-fifo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..b119cec25a60 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -384,9 +384,9 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
 			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-				 (read_timeout >= 0) ?
-				  msecs_to_jiffies(read_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+			(read_timeout >= 0) ?
+			msecs_to_jiffies(read_timeout) :
+			MAX_SCHEDULE_TIMEOUT);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -528,9 +528,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
 			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
 				 >= words_to_write,
-				 (write_timeout >= 0) ?
-				  msecs_to_jiffies(write_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+			(write_timeout >= 0) ?
+			msecs_to_jiffies(write_timeout) :
+			MAX_SCHEDULE_TIMEOUT);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.34.1


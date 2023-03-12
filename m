Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E4538A;
	Sun, 12 Mar 2023 17:33:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so9412181wms.2;
        Sun, 12 Mar 2023 10:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678642402;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYkkS+oZSSfD9zGRsvgAy1sxi0/N+dGDM4TdmGz9U18=;
        b=HW+MTca27uXJN+ak1iLSRAeq6brTVBups1xzLy7LB6cenwEBkLZPJATE81gKsCehmG
         nVHpyWtEHl7ob/WDwjY81BC1Oyl5TUg323NewaOmGEURAP0p8vdcvPosLdtxGPJMZX6z
         Yq8doMZKqbIOnXwadY/tlO+09l88MR/tNLmTyk1ptkpSN3El3xQ4O4Y/gbReIh4h9hIB
         xTlbS+zj6nUEjXgbA6eFpAjRG0oTgjlBF6JsoBGfWSoAY1Bf68Kb1gZHA4rs0Sw4+yCa
         /vi3VQvktpIVEgK5Oa9GT7fioq2D7NOnvrXnkPfxQc+yE5wMs+YITdxtYruUZLlVvYwb
         4Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678642402;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYkkS+oZSSfD9zGRsvgAy1sxi0/N+dGDM4TdmGz9U18=;
        b=1CwC2PcKGhw7fD81oTL0/i7LAY/9DU/l0Z/HyVKoeN/pr+BTmy/odAk00+Pg8/rbKo
         i8NiNJoRR7rd6hxMbX2MOTLhQXj5S/75VGRRtwV+XDqfaVNzaGU2ALH9tVcWMu3qM10O
         ZNb7eOAmKPBxTcGbaK1OHs/hSGFlkujru9H4VkcuMSqchk6oO4ezRUXTIsqkw75SEh5B
         8iNYa2TlDdq1AARs+c/hRak9mPVx4WdaxwC4l5EEBXGAoLHrOw9An1KByUU13eole8+0
         pHmG1bFNUL6+37cDa1oo6Va1KLH2OiY3XiS6ITSknO5WqVlZ7Kpq01sNWgJEDuT0sBiK
         mvcA==
X-Gm-Message-State: AO0yUKVwoDF1vEC2N4P+gv2HU4DkBzx2EIDVVbkNkOs7XBBcG9wK5ceU
	DnQqff0UZGPt+SlCPE7+9gJubO2qgg+xYWHl
X-Google-Smtp-Source: AK7set8soss/y1o1J91swWqCXh1d4gLr/l28MxM+9gqizZwNxPUiFxGus8uZNNCu04oXMRtdZ/vK0g==
X-Received: by 2002:a05:600c:4751:b0:3ea:f73e:9d8a with SMTP id w17-20020a05600c475100b003eaf73e9d8amr8551875wmo.30.1678642401806;
        Sun, 12 Mar 2023 10:33:21 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b003ed2002fa6dsm2937890wmi.17.2023.03.12.10.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 10:33:21 -0700 (PDT)
Date: Sun, 12 Mar 2023 22:33:19 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: axis-fifo: initialize read_timeout and
 write_timeout once in probe function
Message-ID: <ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Module parameter, read_timeout, can only be set at loading time. As it
can only be modified once, initialize read_timeout once in the probe
function.
As a result, only use read_timeout as the last argument in
wait_event_interruptible_timeout() call.

Same goes for write_timeout.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index b119cec25a60..7ec8722cef7d 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -384,9 +384,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
 			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-			(read_timeout >= 0) ?
-			msecs_to_jiffies(read_timeout) :
-			MAX_SCHEDULE_TIMEOUT);
+			read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -528,9 +526,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
 			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
 				 >= words_to_write,
-			(write_timeout >= 0) ?
-			msecs_to_jiffies(write_timeout) :
-			MAX_SCHEDULE_TIMEOUT);
+			write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -814,6 +810,16 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	struct axis_fifo *fifo = NULL;
 	char *device_name;
 	int rc = 0; /* error return value */
+	
+	if (read_timeout >= 0)
+		read_timeout = msecs_to_jiffies(read_timeout);
+	else
+		read_timeout = MAX_SCHEDULE_TIMEOUT;
+	
+	if (write_timeout >= 0)
+		write_timeout = msecs_to_jiffies(write_timeout);
+	else
+		write_timeout = MAX_SCHEDULE_TIMEOUT;
 
 	/* ----------------------------
 	 *     init wrapper device
-- 
2.34.1


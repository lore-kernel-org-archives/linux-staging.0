Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7D3C35;
	Mon, 13 Mar 2023 18:07:15 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id k10so52092734edk.13;
        Mon, 13 Mar 2023 11:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678730833;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGt5AxMHWQcOiTCB8nZSOBEYxGxgT5H6m9rVSzLuKI4=;
        b=JXTiJ57Ywbul0B08SiM+XnEt6Pa1sTLB/25UXpln6gBFs342vnPy6faBkgbZD9aZ6K
         zdJPvBkHdRPB/+R34jjvcpeimzkjkgQEcyingq9+beEJU1BJQvqjCXafJYlddy+jqZav
         3o23JYyggVRmh/wPN9taOWd+LZwgzdp+4EDYmt4VhG1UcjWcOReJHFqs17V8+Pfq8cwU
         1+DQJzd0FkxrRsJd+Ynd0Fc+lyVRez9wNljm62bCnjI9q7qdYZx39B645LI/BVktmXez
         tNq42cXhJ4O9+D2bTd5ncsQdiZiRoTIAH4fjcljdanXMtSsUXYAUvWegxFrmHZUn7OTy
         kfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678730833;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGt5AxMHWQcOiTCB8nZSOBEYxGxgT5H6m9rVSzLuKI4=;
        b=hoZb/qFeoQH+CQXm2URbKrgVVE28Nr18k/JW6CNnY7mvqCKgD7461GF4OHJQkEr2hV
         7P8pkfPMw/4NEpEdqWhmbtR0Pf09wbn4XERUEqHvs8BsULKmK4tBf7bYjDZoWA8aH+4C
         PYa3hJ2GaBvG4l4aTjPhV09t5Nr9D0ZlhnmZLyAI/G6CvYyrdPFfyxLBBgaqXChs02Nx
         tNIfZ1SgcTMchZStOBCk33qtje6bKWNx+HqDECKz7y+0Xwe/YrGfnoorSer8nxReh3XP
         fLW25g5uJinBBkgdft5y8IRVZDK0eUBpGP4y7MXlgp5wtULPZNrXLZ78M7rMtE3jRPm+
         OCDg==
X-Gm-Message-State: AO0yUKXAFEgOdVDTiQA+nMgiNu+tOTF5HPZq0f7TckhJjjCXhzXg7wHv
	Z1hIuaIUASQr4qzjSjMFGVo=
X-Google-Smtp-Source: AK7set+84wZUkWvYChMNBkCBuAos3Wl9EAsOrYDZZzeMF2RPD63heLxQOk3Sh0lAGFjq4GQLOkZc8w==
X-Received: by 2002:a17:907:dab:b0:8ae:11ca:81de with SMTP id go43-20020a1709070dab00b008ae11ca81demr43476604ejc.34.1678730833384;
        Mon, 13 Mar 2023 11:07:13 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id u26-20020a1709064ada00b008e125ee7be4sm81663ejt.176.2023.03.13.11.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 11:07:12 -0700 (PDT)
Date: Mon, 13 Mar 2023 23:07:10 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Module parameter, read_timeout, can only be set at the loading time. As
it can only be modified once, initialize read_timeout once in the probe
function.
As a result, only use read_timeout as the last argument in
wait_event_interruptible_timeout() call.

Same goes for write_timeout.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index dfd2b357f484..563caf155713 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -384,9 +384,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
 			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-				 (read_timeout >= 0) ?
-				  msecs_to_jiffies(read_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+			read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -528,9 +526,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
 			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
 				 >= words_to_write,
-				 (write_timeout >= 0) ?
-				  msecs_to_jiffies(write_timeout) :
-				  MAX_SCHEDULE_TIMEOUT);
+			write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -815,6 +811,16 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	char *device_name;
 	int rc = 0; /* error return value */
 
+	if (read_timeout >= 0)
+		read_timeout = msecs_to_jiffies(read_timeout);
+	else
+		read_timeout = MAX_SCHEDULE_TIMEOUT;
+
+	if (write_timeout >= 0)
+		write_timeout = msecs_to_jiffies(write_timeout);
+	else
+		write_timeout = MAX_SCHEDULE_TIMEOUT;
+
 	/* ----------------------------
 	 *     init wrapper device
 	 * ----------------------------
-- 
2.34.1


Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ABA1F03D2
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870875; cv=none; b=PJgheywJWkWnROL3sY5J/hZJZK3a+wLjilpve6yWFLDQgVdLTAQ2Pqzjs/m8l5/SAIOGBJV8kqROGpixLvApukUhzpILRBLADJ4T7bZW+2g9J6vpXm63B+m3ozWWg69e/fE4ESGfgz1icDzRHUG274hlAmc1OPqBCTFbw8lfTr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870875; c=relaxed/simple;
	bh=gc+d1E7OtodvQlLMVFaJ15yV3zxw2DGjsKS0VIL+iow=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nAZbKmkEXqYn2R63iXZZnii/2s/laJG1GXfxDy3rv6dkM5ttMuWQFkJL6OpIhbd/N5tuFFPaPWEWCvvpt6JiwyVc50BUyCFs+BmipxdbqBYoMwoZQJT8gMF1aaJVaHhmT+PmLPjxYWV+pKuae9Rs+XZ95XW+1Av0nobOBKuxHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K66YSnxH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K66YSnxH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so63715235e9.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870872; x=1767475672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VRK0DON7s2YDeexv75ESh3hvlF59C8byJ3BTFfhh6kc=;
        b=K66YSnxHnNiDDsmHgc/AfH7JJxjv+5Y7Kz3FiItInUiEBlqx8xuQsAsoVZj4urmDEf
         vfEbfyNjpBHslf2v8Uv3pdAE7vIqk717S55tHWpAncyo6HTJIOWKY+L6tBWY0otaA9Ah
         sSXnY+8Bq1TAg49TE469rrDxF0AYaNQ1lvPkM6DVu9KU2lJsUbfY0JyELCcdwxFhS2qi
         +kDpV16r75tKka0/Xy0Sc50BiT+I80DcWiQMvlavsJlMSumSxb2pdVFc6oqKmI77rdCT
         2yswlrC8UnhM7t9Qw8nM6Rw7RCpj7CueZDobFSlO/CLVGy7ZAxtrj47D9sqcuBm8cfaG
         onDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870872; x=1767475672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRK0DON7s2YDeexv75ESh3hvlF59C8byJ3BTFfhh6kc=;
        b=W1rXIj64R6eNJYQZJC7u1suZZ+1XdFoWiozAaOoESZWoXhyeyVAHrKBw3lWJYAf7D8
         xQpBus4Hy9XU16z46eWOXjvyRuzvU5hh8iAnRtYskJX2B5tzm36MG7UP+vMGVPRS4vcB
         cdIW8wbqmuf1Z7e83Bi37qgv05HsqWM+NPGf89OU456s48ckKyKjM+GqoSlcmkK2/Szu
         rTKR23ADbEnfEpvwZue+mDqbg9WCVmWlb0JFYXQ7Zw5XJJWZiayniCxT844kbngLcVlx
         cFS1fQ4JFEzwglAQjThRA6DcRM5c5WDTZNE2A3TH4Md1OtiP2B7H2gu4Vs5B4SVPUWIq
         8oGg==
X-Forwarded-Encrypted: i=1; AJvYcCWX1NlrGPH+moqEoKYI/gkLxFD4AEF87INb+qY5Z9txYoRwgYARPwlONAd49Vd48b2Td0Q+vngtRQQhruZi@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw/LhNyn2EXMpeDkQIAjieANjFWONjuw7twmU9vkqhFjQpjU2+
	nUU84gRPs4joQUf66EUFpP+NIZNd61VyDE44DYZQn3WX0uYh7Wwz/ks0+TmIVw==
X-Gm-Gg: AY/fxX6itbVCMAVwh7cZ7zUZYUeuryOANzKx2d1FFIgjLUwvqDuBP0A5nkGkH8DMfde
	eNs/zZfR+cRmGqD2ZuTxOSXP81LwBo52wqXECnRuV5uFvkGeycDtMiAt94s9E4h2F0jNGLCsfeb
	5xbbGVJYYOD4TYa57Q0yAr/Fgwy07mFr/Mgyw1sdr/JMd5LnPWclZukccjZm81hOl1r/qvZwRvE
	ktfCaXedLFmIUPt/2BhJuhe8H2bjNY9tAwUoUzhc5oqulcTlSqUtdZAhzKrG07xF/sGPRGGu3VK
	bI+geqsYhG8jNCpa+EKv6DbaiAa6c7kbG/EQK7sb7TfDIoF/+EG57OFowEQxV6CB0pGasju1iL1
	NNiFjZcMJjWBIme4TPkvjgLV6y/TDSEai3wzEVkw7Q+2d/DkMFF0nBVCHedLb/7blfcvtYhhhgF
	ii0XydJg2huarrD/DC2PtVmVOPXo650d8=
X-Google-Smtp-Source: AGHT+IEWcnqN75RigT29A+uLKvzcl6CMCzRnQqRXo2T6luj6wvug66iDWHIVUe/7DP18WCmGwveWfg==
X-Received: by 2002:a05:600c:4e0d:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-47d1959d2b4mr274287545e9.33.1766870871759;
        Sat, 27 Dec 2025 13:27:51 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:51 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/9] staging: axis-fifo: Remove read/write timeout module parameters
Date: Sat, 27 Dec 2025 23:26:32 +0200
Message-ID: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Module parameters for timeouts are a poor interface choice as they
affect all device instances globally rather than being configurable
per file descriptor.

The current implementation also returns -EAGAIN on timeout, requiring
userspace to implement retry loops around blocking operations.

Remove the read_timeout and write_timeout module parameters. The next
commit adds poll() support, allowing applications to implement timeout
handling using standard poll()/select() interfaces.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 62 +++------------------------
 1 file changed, 6 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..b2a9f5542fc1 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -25,9 +25,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/io.h>
-#include <linux/moduleparam.h>
 #include <linux/interrupt.h>
-#include <linux/param.h>
 #include <linux/fs.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -91,25 +89,8 @@
 
 #define XLLF_INT_CLEAR_ALL	GENMASK(31, 0)
 
-/* ----------------------------
- *           globals
- * ----------------------------
- */
-static long read_timeout = 1000; /* ms to wait before read() times out */
-static long write_timeout = 1000; /* ms to wait before write() times out */
-
 static DEFINE_IDA(axis_fifo_ida);
 
-/* ----------------------------
- * module command-line arguments
- * ----------------------------
- */
-
-module_param(read_timeout, long, 0444);
-MODULE_PARM_DESC(read_timeout, "ms to wait before blocking read() timing out; set to -1 for no timeout");
-module_param(write_timeout, long, 0444);
-MODULE_PARM_DESC(write_timeout, "ms to wait before blocking write() timing out; set to -1 for no timeout");
-
 /* ----------------------------
  *            types
  * ----------------------------
@@ -202,20 +183,11 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 * if nothing is currently available
 		 */
 		mutex_lock(&fifo->read_lock);
-		ret = wait_event_interruptible_timeout(fifo->read_queue,
-						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-						       read_timeout);
-
-		if (ret <= 0) {
-			if (ret == 0) {
-				ret = -EAGAIN;
-			} else if (ret != -ERESTARTSYS) {
-				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in read (ret=%i)\n",
-					ret);
-			}
 
+		ret = wait_event_interruptible(fifo->read_queue,
+				ioread32(fifo->base_addr + XLLF_RDFO_OFFSET));
+		if (ret)
 			goto end_unlock;
-		}
 	}
 
 	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
@@ -346,21 +318,11 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 * currently enough room in the fifo
 		 */
 		mutex_lock(&fifo->write_lock);
-		ret = wait_event_interruptible_timeout(fifo->write_queue,
-						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-								>= words_to_write,
-						       write_timeout);
-
-		if (ret <= 0) {
-			if (ret == 0) {
-				ret = -EAGAIN;
-			} else if (ret != -ERESTARTSYS) {
-				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in write (ret=%i)\n",
-					ret);
-			}
 
+		ret = wait_event_interruptible(fifo->write_queue,
+			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+		if (ret)
 			goto end_unlock;
-		}
 	}
 
 	txbuf = vmemdup_user(buf, len);
@@ -673,18 +635,6 @@ static struct platform_driver axis_fifo_driver = {
 
 static int __init axis_fifo_init(void)
 {
-	if (read_timeout >= 0)
-		read_timeout = msecs_to_jiffies(read_timeout);
-	else
-		read_timeout = MAX_SCHEDULE_TIMEOUT;
-
-	if (write_timeout >= 0)
-		write_timeout = msecs_to_jiffies(write_timeout);
-	else
-		write_timeout = MAX_SCHEDULE_TIMEOUT;
-
-	pr_info("axis-fifo driver loaded with parameters read_timeout = %li, write_timeout = %li\n",
-		read_timeout, write_timeout);
 	return platform_driver_register(&axis_fifo_driver);
 }
 
-- 
2.51.0


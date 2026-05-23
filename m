Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D210A269CE6
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779565228; cv=none; b=kOaPBcid4R322Wb5llen9T+3gsloz4Q+ueUdQXlIATa86txZbEI04fEBosWSNwlYIHsDSJggUjh8T0OBtvrEIovREbYvJNK2TmO23JM8VOLeV1zDOJs6yBtROGNYHIlI7U1CS12RueE4qODc0ghRZTVs4rUI7K+nzQ2Xbzzmtk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779565228; c=relaxed/simple;
	bh=OFz9MRAFVyo1qunEfMUsFxgX838/ZzvtmxxVaA436zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ek6wDbsKB712KKdgYPg6E/aYelsFLPlhruwu47GeijkE48bgdDi/t3NbZWw4WjeZebShRmuPU4sH9cjmG/9qfX4ZGfjrrwqoDbDSTisGTGbcWms4ibwzln8s3YQQjutId/bQqGxW3+Z/4HdJ62Tiw8HYzXCwCmoSQUYUMezK+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UC07pcHH; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UC07pcHH"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so3449827b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 12:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779565226; x=1780170026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZzmbhO1XUfYujg4JdeubQMEAzDIUtBPSSN88sAPcro=;
        b=UC07pcHHQ0L6uqCXrNxAl3/vr56iOUCQ0b+IIu17n1jTK2cXJPvMc/jeDZCoxdEcN/
         kFqoUkjCrYjpSlpE57TBRGv6en2c/VHIJkSX7CV89bGDu0OZwGsGXhNvzGXJCJlRQyTv
         Jw6EGPbz49aWS7ntm1bWYbbdO+q0J7oTGmjhXB2uNZ4wFU9pgfuJ7SEEA7Dv/338h9sX
         8ZR89enfbbUYWaQpU4xZ2iXMjbfzl5SX67dosMbRxZH8CLg0LxzZIUBVtmmXpUwwZF5P
         M/VFxIt3gOhNsClsdoL8/YU60VcYHMHoH7r96t4LqlvO8yMbXw4olwFpiX5nuFQWbkpi
         iMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779565226; x=1780170026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZzmbhO1XUfYujg4JdeubQMEAzDIUtBPSSN88sAPcro=;
        b=PkMps3HIfllJRSpbf7U6TOllhPuMiyzt3XX6QeuW9sAGHhrEwl5t7JemVfRpyQ9MId
         aqfmOvkyW4GtBcKKTtTy1/6kQnAyt1V7qkQBFFdYLOBG34cgNdzl0pW5MY2/JcnVQLcA
         +lQKVsa2KHguCmjFEtAkIpvzba2WXeJFkcrjPZYhQt4WbOy0omroTm6v/nJ0sGRwC3Wb
         XN1k9FpljUNQoTtAxTmBfDTX26V0sieg2OQhons9gyLYiinPrMn5mH5IiESdcOqmWcSj
         IzKh8pQ3/K1Drsn3ha1uUElHVm40prmwG6y9BE2K6/bIaJSQNn/cMxdhQEZiD3gnc+r8
         7Bpw==
X-Forwarded-Encrypted: i=1; AFNElJ9dtvGfm1kBG/TqqfnHI2XlFj+/uTgy8symcPnyyTyoDI0G5A/uZ8bmUl1j00cKPN3TmYppLHYkBUigK5Mt@lists.linux.dev
X-Gm-Message-State: AOJu0YwOhKt62Hs7A5JQYnizllqI4ouZcId8cfLtQF1IdO77JfdODlml
	TstCtH9EvSiZDMhTSmpBz9yxPCb7FJsdKleK1xYNyuTPfL1gwlvPLJOj
X-Gm-Gg: Acq92OHpMRNvrgu1z2VZiKfCx6tqXgLitjmSAlEurgiUeztQhpTQoV0pUqukzdxfFvy
	b991TOF20edarvVsAB3YK2gLJTl4GtmjdrxxWZrj2ayGltXKM3inYFtPuYiSKNOQubSxPg3lkck
	ZfQoPnCDjP8IOAkGVJc+0R2tc2zuU7hmRS5pgr6eNy3dRlAizkiwva5pL21onWPJN3yD1wmGVhR
	miA5P4FCByoSl+Mreszie6jaT7xCw9V1joa9jcW/Jg0cKoyrxQKsKLXh/Ocd4u7KXTLJ/HE8t8D
	8o79LbYQYq2F2LAxozXHshRbAiA8zhd/An0Wra+pHoE0Qeu23IjyCt1oybxWiuZ6BJxBUQ7ZnFr
	R6ylK9MuKCIjaDhE0VidYWp+QrDNPXg5NCj/4LlbXsbg2NFw2kPdOB3mGiMIvFwBKDp5yDFrJ37
	ktzCZSDSwLSL3PfhM8yC4RtvUEzdUeKEp+y+gadn7e
X-Received: by 2002:a05:6a00:1888:b0:838:20b7:40ed with SMTP id d2e1a72fcca58-8415f6141a7mr9106820b3a.42.1779565225935;
        Sat, 23 May 2026 12:40:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe3c9bsm5092868b3a.52.2026.05.23.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 12:40:25 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jacobsfeder@gmail.com,
	ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH] staging: axis-fifo: use stream accessors for FIFO data transfers
Date: Sat, 23 May 2026 15:40:09 -0400
Message-ID: <20260523194009.195538-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jacob Feder <jacobsfeder@gmail.com>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

The driver uses iowrite32()/ioread32() to transfer payload data to and
from the transmit (XLLF_TDFD_OFFSET) and receive (XLLF_RDFD_OFFSET)
data FIFOs. On big-endian architectures iowrite32() maps to writel()
and ioread32() maps to readl(), both of which perform CPU-to-device
byte-swapping. For AXI-Stream FIFOs, which carry opaque byte streams,
this byte-swapping silently corrupts the payload.

Replace the per-word iowrite32()/ioread32() loops with writesl()/readsl(),
which transfer data without byte-swapping, preserving memory byte order
as required by AXI-Stream FIFO semantics.

Also convert the err_flush_rx drain loop to use batched readsl() with
min_t(unsigned int, ...) to match the types of words_available and
READ_BUF_SIZE, reusing the existing local variable copy.

Fixes: 4a965c5f89de ("staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core")
Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 1c34de020cf8..38e4a691b6dc 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -125,7 +125,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	unsigned int words_available;
 	unsigned int copied;
 	unsigned int copy;
-	unsigned int i;
 	int ret;
 	u32 tmp_buf[READ_BUF_SIZE];
 
@@ -167,10 +166,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	while (words_available > 0) {
 		copy = min(words_available, READ_BUF_SIZE);
 
-		for (i = 0; i < copy; i++) {
-			tmp_buf[i] = ioread32(fifo->base_addr +
-					      XLLF_RDFD_OFFSET);
-		}
+		readsl(fifo->base_addr + XLLF_RDFD_OFFSET, tmp_buf, copy);
 		words_available -= copy;
 
 		if (copy_to_user(buf + copied * sizeof(u32), tmp_buf,
@@ -186,8 +182,11 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	return bytes_available;
 
 err_flush_rx:
-	while (words_available--)
-		ioread32(fifo->base_addr + XLLF_RDFD_OFFSET);
+	while (words_available > 0) {
+		copy = min_t(unsigned int, words_available, READ_BUF_SIZE);
+		readsl(fifo->base_addr + XLLF_RDFD_OFFSET, tmp_buf, copy);
+		words_available -= copy;
+	}
 
 end_unlock:
 	mutex_unlock(&fifo->read_lock);
@@ -258,8 +257,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		goto end_unlock;
 	}
 
-	for (int i = 0; i < words_to_write; ++i)
-		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
+	writesl(fifo->base_addr + XLLF_TDFD_OFFSET, txbuf, words_to_write);
 
 	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
 
-- 
2.52.0


Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F27A2E2F09
	for <linux-staging@lists.linux.dev>; Fri, 12 Sep 2025 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672057; cv=none; b=b+4CjxHaDMlu0kJYUhIdbF6OBW0BGyyhmuCZ9y+Y4F1xEX8WSDBBtYPIojJpdPk2CWl3Ji8a2CUpiL7RSBcb71nwtIZfWhNbO3124d9L9hN6JVaTZE/3TRoiJ2BrJivfVyqtHMjxFJjL5ijy8MBmvDz9Rx3s1LZ78cDXzIqYqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672057; c=relaxed/simple;
	bh=S0CYNS8Szt1T/6CxlU/rD4KtR5pqM3gNqPSUty5uqQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=octp8XMYpDrlCMaDto8Ekld7pBDj6U8Ajf1b6CwbnJ+wuheIJgfgygGwCDGi+I1N7kqf4XFfK5P/qmT8zXO8xTv1ZqH6dz2EODZyfrAi+Zt0DB8DuRPIIPSU2aPTzghzCmi2AzwmU6lrAXoG9k7XlDKJJTBLgDtO644UX4Sm/N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aS5BEKnm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aS5BEKnm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45cb659e858so12507775e9.2
        for <linux-staging@lists.linux.dev>; Fri, 12 Sep 2025 03:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672053; x=1758276853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ8f3Qn/TyGlr/n0NexKSayuju02h7Q6FXYl3EBTkXU=;
        b=aS5BEKnmt+Tfa5CX/1cgwDj7FzIOjHKfaICqvtXOgx0HCo6Or/vMg2Mm1kywA8yoA0
         Yu5wsb577sn0kqIn/duEcmweedmRHHmuqpCoynWDb0raSfUaqFX/JykQ7EGh2k6pxqOM
         ap5B94Cf9JG83Ax4ryW/PaImYGHW2MuXT5ARCMgMsRoU360QWNjkWBESBaYxHAJHTmrq
         jSzuITQFnWy6DdmtU+kjwmrtHVc4lcvtcqrfiJKvvwEze3dMjToaQRgzY+fbM4upPdDR
         u8UaZJqPnBy0F613Zw1CDSbPNodtd9xsNUn6J/s+19OQVVNARxRluCDnvfG73RlSjWpf
         EeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672053; x=1758276853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJ8f3Qn/TyGlr/n0NexKSayuju02h7Q6FXYl3EBTkXU=;
        b=DLFRz9bFudsof0pF5fn23QIF1veaMwzyBsJhnyJmlbeQkumzov16ELZjCqnFKzDTWf
         aJuWrv2dkJG/rCz0Iom+i0wEXtUTZ3Xe67hnwb8NvbTQx6xEJ5r3FilHuZuFjrnhAZsS
         9KhvyFMdPzMU/5BGpJUcbeyPnhqpJSwsmOPVILKwFVFD2lhOIJWxAVBwdD0SQ1Dzm2zd
         Q1qrFP6EkbfwE5hhdwC9qaxMcfdpq0f4onuP1lvQG9k/3iqd0PqJqhecszuZI47+KSnX
         XgiIK4T81oy8oQrSHI0uAsK4PXaNZNwq3clSKQ7herbSYOmxAwZarYHk3OwqY9EBcs/d
         vgTg==
X-Forwarded-Encrypted: i=1; AJvYcCVWNZ2xOutO4j4hxRZme1bb52p0nzflGrUlO+G0EQI+AmkvNCjeJIXQK6BWZKyqk5Iv/5MzRRK/2vtA4Rgw@lists.linux.dev
X-Gm-Message-State: AOJu0YwLT1swEC0TIExLoNUnZwwrv5kDuiOppP/wJoPT1JZMRMH9ueZ9
	9itbHyzE9xZ/GYPzGls7UkEr7BPV1yCRQaDMj+bKcIPRgUPC96M0oUia
X-Gm-Gg: ASbGnctMxdYyZN5SL0a8AgfUmA5Y35RfygryR+fSfM7pAF+BC7A65pxjmqbKFsGEeNI
	ZhmQqEy+Rq+x3ttTIZ+qkNn/7pbYUql6lNcc0bY6llknqxkYPCwmTbwHzVhm9h56u13x1lxSOgm
	fp127bxhOA3W+na7VfanMUeNhA4oMQzIvajTaaOSZWTF2x5S0msIq+XuDyBmvPt6OnR+m6D5xYA
	7FKYvmIP6eVLKm4A9ktxZP3QGk9C0eImM8+Nv0KktrNNZVGlqSmb92gZPprx+ttqKIBAUUwfE6l
	9CsPuAhop7nQblIYEIGXKxGEWerwwPh3LIxlP2+/ml4TGdfGhhkgmS/sxlgJqTyTtiq8s3EVLBb
	p8DsIDBhxb1UHH8H/3TtFCOo3a0DRgjpzTg==
X-Google-Smtp-Source: AGHT+IFYtoJgSByXetv839cGOJvOKyTq/Qw00RovSeH57gD7S6jTJAoFmT89063appVm2NhMPpwCJg==
X-Received: by 2002:a05:600c:45c4:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-45f211ca9a5mr25520265e9.6.1757672053190;
        Fri, 12 Sep 2025 03:14:13 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372b983sm56542395e9.9.2025.09.12.03.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:14:12 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: gshahrouzi@gmail.com,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] staging: axis-fifo: fix TX handling on copy_from_user() failure
Date: Fri, 12 Sep 2025 13:13:21 +0300
Message-ID: <20250912101322.1282507-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If copy_from_user() fails, write() currently returns -EFAULT, but any
partially written data leaves the TX FIFO in an inconsistent state.
Subsequent write() calls then fail with "transmit length mismatch"
errors.

Once partial data is written to the hardware FIFO, it cannot be removed
without a TX reset. Commit c6e8d85fafa7 ("staging: axis-fifo: Remove
hardware resets for user errors") removed a full FIFO reset for this case,
which fixed a potential RX data loss, but introduced this TX issue.

Fix this by introducing a bounce buffer: copy the full packet from
userspace first, and write to the hardware FIFO only if the copy
was successful.

Fixes: c6e8d85fafa7 ("staging: axis-fifo: Remove hardware resets for user errors")
Cc: stable@vger.kernel.org
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 36 ++++++++-------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index f54614ba1aa8..c47c6a022402 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -43,7 +43,6 @@
 #define DRIVER_NAME "axis_fifo"
 
 #define READ_BUF_SIZE 128U /* read buffer length in words */
-#define WRITE_BUF_SIZE 128U /* write buffer length in words */
 
 #define AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN	4
 
@@ -305,11 +304,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 {
 	struct axis_fifo *fifo = (struct axis_fifo *)f->private_data;
 	unsigned int words_to_write;
-	unsigned int copied;
-	unsigned int copy;
-	unsigned int i;
+	u32 *txbuf;
 	int ret;
-	u32 tmp_buf[WRITE_BUF_SIZE];
 
 	if (len % sizeof(u32)) {
 		dev_err(fifo->dt_device,
@@ -374,32 +370,20 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		}
 	}
 
-	/* write data from an intermediate buffer into the fifo IP, refilling
-	 * the buffer with userspace data as needed
-	 */
-	copied = 0;
-	while (words_to_write > 0) {
-		copy = min(words_to_write, WRITE_BUF_SIZE);
-
-		if (copy_from_user(tmp_buf, buf + copied * sizeof(u32),
-				   copy * sizeof(u32))) {
-			ret = -EFAULT;
-			goto end_unlock;
-		}
-
-		for (i = 0; i < copy; i++)
-			iowrite32(tmp_buf[i], fifo->base_addr +
-				  XLLF_TDFD_OFFSET);
-
-		copied += copy;
-		words_to_write -= copy;
+	txbuf = vmemdup_user(buf, len);
+	if (IS_ERR(txbuf)) {
+		ret = PTR_ERR(txbuf);
+		goto end_unlock;
 	}
 
-	ret = copied * sizeof(u32);
+	for (int i = 0; i < words_to_write; ++i)
+		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
 
 	/* write packet size to fifo */
-	iowrite32(ret, fifo->base_addr + XLLF_TLR_OFFSET);
+	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
 
+	ret = len;
+	kvfree(txbuf);
 end_unlock:
 	mutex_unlock(&fifo->write_lock);
 
-- 
2.50.0


Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969F3191A6
	for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758311776; cv=none; b=gs2qTunuXVyhysRjDwnhhEuny9KAqs8zkUs5Rcsf41XpJCwVkT3s0EbDNOXInC+A4PZhuPjtIflB1IoM18M0BkILNas8TERPo2JhSIY4lfZr4ZljA0/PCJ+Oh2SH5fkdoBCKicGNtDmSUOJo9m72ougOjAljatqLL8cTn9b8zlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758311776; c=relaxed/simple;
	bh=XIFSWOnikm++UnePJHJSK8rjFjeh/6wDwVLqw2o1BJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOi2LI6bdc8GSrzQRhwfjC4B4dP1y13CEYHHq9yO2Jdt+rq5Q0Y/ZrOLMNFcAgxG3qL2un7d19v2CA+GRQBb3ZWZ2BAKheCaYgWmeS2lgioPe2LkFm/FR5S2Hm6hrDfhrYcAss8ZiM9PnEY5DrncYn13u9pQIBVeFMoB8sH0sU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJslSPEI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJslSPEI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so16101235e9.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 12:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758311773; x=1758916573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvYL0C0uvrDUWWSUgqdp7j7WVAXOj8GbBxx6ogc4GMo=;
        b=lJslSPEIxzZ/iczgmJcS6DlKi1Qz+6dIADE1RmD7dqZjqGauCYbuImdwPMz5viKFuh
         44rRG/M07+rt5LUwIjsgoGokpjyRs2uMoVP9e4DFWPkLEmorBPTEZJoGHqhIIgoJUxyQ
         pp25UbMZYdneiTXUJRO9Fn1LKcZl6NMhVgNAUXn3X7HSd5TuaS4DG2wlGJN9khkfpI2V
         GE9NtnsKAV2isjtmMsI0by/nEQ1Wf7Ey21uwDdSHlyJCB2Ym8C1fdcEYpUks8gxUhdXN
         Yqdw7pMoKXSEYXEEw2u+aUVcTu620eSshSyIAh/bFSL+4F/AEfU+3/W/ZBxuYNXrPggO
         NIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758311773; x=1758916573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvYL0C0uvrDUWWSUgqdp7j7WVAXOj8GbBxx6ogc4GMo=;
        b=a3OF4jdYmFhKXy3thj3LRDiNtDNaPCg6k/hskw+1HKKLoIcKbyP+r/KYJDZpJEhy44
         Pu/X2MkNpzlFq0HqfdBz3P5izfOYwRMyQ1cI+bZjVr7wGxYia9eE407PmLVAJ+yw7iNY
         E+mg8EdbtkcPoBYHP2ofr/3sBauBLFVJHyjcIQjBEezwSLNmC2GqjaxMOIVrcAjPHrE6
         Ipj3mZ9mA1OG8e7q6tBiyRiJsld+G/9l7l/AVjXeivS6mH5B3ECFy404uNe0csZCyKQm
         3cQwXuLqNaB4H1AWAfpXfrRYxo770f36cZGkHulU2Sp83FFxwPvcwOtEq0A76rfGEDQB
         d6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlQHL4ZY0L4sUnYa7FJFx30hOG4U8+m3X6HyyPVvWA3O77HeN7nkKFSvrkUy89OCXQXO26ZMfM903r5iGl@lists.linux.dev
X-Gm-Message-State: AOJu0YzbpFlVlVazIxatI3L6sgrOfAImbpOtJYZ7aYEr3+PTsJtnEvsR
	xJK67FQxT3YVg76p2DCXqQZNdemQJrAUas0HPQjUQTYZILNSYdZTE9bq
X-Gm-Gg: ASbGncueAagaKd3esImCn/LmvhPQB3Eqb2L3suPFeQmAZ+SYAiQTqTpY6oGcetxeOLp
	LcceLuDr8z4z/yX96Pl0npdEy4zxuxd2VbJYDlmYeUgZmZtcYTzThsc/drV7+Enxqv8VdLq5EDt
	q6OjMJ6GbbV8haqV4N6hZ4xqtMlNnoCANXksjtr4Kh6LNohk53464OiL10Rect/zk+hcFkj196S
	0i3kvb4pbbaJIZ220yD71rZpbsQpI4Ob1OsaANFk3bZA2NL6YPrarcYfuV25iBpFwPx9vZowwT/
	Lf+iIvieRS2fEVAjLyXFMeDPVwVl3U9V+Y86AO0xui1QAI6VlThKPSo3A/vqKWmfPAGkskvgySt
	yRnbgOKCpM7RvmX2ABWVzZy/YL8gbThsoEw==
X-Google-Smtp-Source: AGHT+IFfy8KKTT05+miEzBxcobLWuJt6fWd263QV1GFJvMsOr+uiT5pE+o/nlGraya5H19++K9S26A==
X-Received: by 2002:a05:600c:528e:b0:45f:2d2a:e323 with SMTP id 5b1f17b1804b1-46825c1255fmr44598325e9.0.1758311772469;
        Fri, 19 Sep 2025 12:56:12 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f162726bsm97025485e9.7.2025.09.19.12.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 12:56:12 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 5/6] staging: axis-fifo: drop redundant read/write_flags from axis_fifo
Date: Fri, 19 Sep 2025 22:53:59 +0300
Message-ID: <20250919195400.3180039-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
References: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver stores file flags (read_flags/write_flags) in the axis_fifo
struct, duplicating information already available in struct file.

Switch to using f->f_flags directly in read/write paths and open(),
removing the unnecessary fields.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 30 +++++++--------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 21fcc9150d7e..881abd61cefd 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -129,8 +129,6 @@ struct axis_fifo {
 	struct mutex read_lock; /* lock for reading */
 	wait_queue_head_t write_queue; /* wait queue for asynchronos write */
 	struct mutex write_lock; /* lock for writing */
-	unsigned int write_flags; /* write file flags */
-	unsigned int read_flags; /* read file flags */
 
 	struct device *dt_device; /* device created from the device tree */
 	struct miscdevice miscdev;
@@ -187,7 +185,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	int ret;
 	u32 tmp_buf[READ_BUF_SIZE];
 
-	if (fifo->read_flags & O_NONBLOCK) {
+	if (f->f_flags & O_NONBLOCK) {
 		/*
 		 * Device opened in non-blocking mode. Try to lock it and then
 		 * check if any packet is available.
@@ -322,7 +320,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		return -EINVAL;
 	}
 
-	if (fifo->write_flags & O_NONBLOCK) {
+	if (f->f_flags & O_NONBLOCK) {
 		/*
 		 * Device opened in non-blocking mode. Try to lock it and then
 		 * check if there is any room to write the given buffer.
@@ -431,27 +429,15 @@ static int axis_fifo_open(struct inode *inod, struct file *f)
 {
 	struct axis_fifo *fifo = container_of(f->private_data,
 					      struct axis_fifo, miscdev);
+	unsigned int flags = f->f_flags & O_ACCMODE;
+
 	f->private_data = fifo;
 
-	if (((f->f_flags & O_ACCMODE) == O_WRONLY) ||
-	    ((f->f_flags & O_ACCMODE) == O_RDWR)) {
-		if (fifo->has_tx_fifo) {
-			fifo->write_flags = f->f_flags;
-		} else {
-			dev_err(fifo->dt_device, "tried to open device for write but the transmit fifo is disabled\n");
-			return -EPERM;
-		}
-	}
+	if ((flags == O_WRONLY || flags == O_RDWR) && !fifo->has_tx_fifo)
+		return -EPERM;
 
-	if (((f->f_flags & O_ACCMODE) == O_RDONLY) ||
-	    ((f->f_flags & O_ACCMODE) == O_RDWR)) {
-		if (fifo->has_rx_fifo) {
-			fifo->read_flags = f->f_flags;
-		} else {
-			dev_err(fifo->dt_device, "tried to open device for read but the receive fifo is disabled\n");
-			return -EPERM;
-		}
-	}
+	if ((flags == O_RDONLY || flags == O_RDWR) && !fifo->has_rx_fifo)
+		return -EPERM;
 
 	return 0;
 }
-- 
2.50.0


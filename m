Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429CB1F4262
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870876; cv=none; b=QaFzDSdJzHxzy2ZgArvbhgTpceVZn9DuOELQOInRa9TL726+PTdkV241ldcqamDvCNdZXAQvkOvuhMniA6HhKB7v4ELhU7CFdY0Fneh/RYAVHpalQxfj1lFGr1lfL5HfyWISVJbHBkyyqsM9NLlsVi0hAyWBeJiSOnUYdEmqf+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870876; c=relaxed/simple;
	bh=a2KHJNZ/IIKFFDJc0BuF7pdaPjfqHmZq3IkSLYCmtYw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IC9K/gxoUW7TF6VC33duvooFg+U4sRHl/FyG7Znl7optNAl4v5sCIXLf6F3FdcLOYmHYgDeIsI++410ESBfAnI/6n2sFL+ygxNP0V2UZIrXWACWFWbyvMhqlIwT35AerAnLMbxRo+fc0di9Z1d3b1XlZXJA+R0Qy91d2VQtV+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgP94Sak; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgP94Sak"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso65752845e9.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870872; x=1767475672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIzryQQAx4iHG1IqZnJ66eEpohhF2mshzzBDmoevmOU=;
        b=YgP94SakxvredYGjvNkZOGNTdJE7C2zWwae4sVMyNBRbvsHrxGuXXRHPL2nB1agMsQ
         EUF+pml+gNMkKXcC58Kbty20bMPg0wroXatPEK2Z4zYMu7zzXZw+maTXrl1UzqxI3Lh8
         nmFm3rOIjMg1JxqzR31BJdKiVA/Y0v2eLL5DUaM01/NBO5bbumj40hS/fOrmoD5Sl4G8
         2KaUa+XYT/5K1P4395ivU+00ZxwWqivB3bjkuLICdPXpifLvRK+JrW1fgsTOl33CG5oS
         p722uPx1EMM7n+K00O/DzK0Ukn5+sHE+d9UlQL+Rno9/of5n5zFHfiSzKxKv0rImiAg1
         fJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870872; x=1767475672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bIzryQQAx4iHG1IqZnJ66eEpohhF2mshzzBDmoevmOU=;
        b=Pr3VIqBimxQkYbBVJzXCxrbQ7GTQD0btbifCQz/4xeSl3kvXPLY8EsMTSDHKvCHuKY
         8toYqUc+L+l9WomP7QJAWD7n+lDDYBHqWOdYs7dcImdwaPts/Jkf6cChIV9KN2pxaUYf
         FNUJMlac2TCrprGIctm4itSzpPQyZX8A4FkHifeutuaQ1OYM/nx7kZjXjx84e6KMFmVQ
         lW23horplE6KufsFHR39crAcwGfhCfS1hT986Df/hv4Zo6xzAmXa2XI3EN1PuQCQt4i/
         80o7OmdNSbwMRsiW6lc8sNqxUatXTG6BPNleLjYG171UyesfiARbpKczWefs/AML3H5w
         NhJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCb/kBZAK0rRtz4vppyI+r4J87c/m9uLi+DCXSSTfhPxud7QL/1pXZY7Q9rYSvpLdiOpikKY/aKRI/rkpZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyKyRehnzOTUeGP06FT8R9A99/m0ifpQE/DOxPl5tKYGmZG8S1M
	kA+xIAWXN+lFn/3p6Irqe6qUAggG0uGF2rg4FJPU41EZ2Xt4KTG5yK6M
X-Gm-Gg: AY/fxX5+4SBiHETqvP0yEBatKkqKsbxgClRn2Lda0BgZYvK3mTfWhdelNawB9ItX5O+
	B7A1KouzNGyDBcDHQIUc48y8f7sldGkZ/8ldcNz2nEMGu721RQpIhOdAKHuhNfVxdgK17deAGIU
	21Zb2WbrfMuNYso6p8ndihBz53RfjS1rW1Pv43C0x3DbwzMQ6LqqHB5qHmorxSSjOwdjMNBqHAC
	Y1It+h/10LKxyh9ftA92ATOiE1AZ7nr6kgwSymxSaT66DqdwIdjlndI3GXSPDvQ6FN3bajaRf7l
	Nn+1yi74r6tflrk5AlaYuAfD8imFUyr7GlJYvmzRipl2bB64cWQjP/GEXtbkRolP5IOTuy1ixkZ
	FP9S1frZjjTEFNaPKnRm6yfm6PJt4SWjRBRSn2ya3AosnAcWvR1GHBsmEtSeL2RaaV/maatIUh5
	gi4ZLW6omoIBiyDQ1jXMf0
X-Google-Smtp-Source: AGHT+IGL0WZJ1CAdxcmUx7MKWp4RGqAb/TPRCorN3nAuyC0F2oH/zg723Me8DnSJyXMI493GGIc1WA==
X-Received: by 2002:a05:600c:3b92:b0:477:6d96:b3ca with SMTP id 5b1f17b1804b1-47d1955b7e9mr316334385e9.5.1766870872517;
        Sat, 27 Dec 2025 13:27:52 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:52 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/9] staging: axis-fifo: Add poll() support
Date: Sat, 27 Dec 2025 23:26:33 +0200
Message-ID: <20251227212640.3321310-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
References: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement poll() file operation to allow userspace applications to
wait for FIFO readiness using select()/poll()/epoll().

This replaces the module parameter-based timeouts removed in the
previous commit.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index b2a9f5542fc1..b9b2700410b8 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -32,6 +32,7 @@
 #include <linux/jiffies.h>
 #include <linux/miscdevice.h>
 #include <linux/debugfs.h>
+#include <linux/poll.h>
 
 /* ----------------------------
  *       driver parameters
@@ -345,6 +346,28 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 	return ret;
 }
 
+static __poll_t axis_fifo_poll(struct file *f, poll_table *wait)
+{
+	struct axis_fifo *fifo = f->private_data;
+	__poll_t mask = 0;
+
+	if (fifo->has_rx_fifo) {
+		poll_wait(f, &fifo->read_queue, wait);
+
+		if (ioread32(fifo->base_addr + XLLF_RDFO_OFFSET))
+			mask |= EPOLLIN | EPOLLRDNORM;
+	}
+
+	if (fifo->has_tx_fifo) {
+		poll_wait(f, &fifo->write_queue, wait);
+
+		if (ioread32(fifo->base_addr + XLLF_TDFV_OFFSET))
+			mask |= EPOLLOUT | EPOLLWRNORM;
+	}
+
+	return mask;
+}
+
 static irqreturn_t axis_fifo_irq(int irq, void *dw)
 {
 	struct axis_fifo *fifo = dw;
@@ -410,7 +433,8 @@ static const struct file_operations fops = {
 	.open = axis_fifo_open,
 	.release = axis_fifo_close,
 	.read = axis_fifo_read,
-	.write = axis_fifo_write
+	.write = axis_fifo_write,
+	.poll = axis_fifo_poll,
 };
 
 static int axis_fifo_debugfs_regs_show(struct seq_file *m, void *p)
-- 
2.51.0


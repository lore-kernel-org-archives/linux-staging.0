Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7243413AC1;
	Sat, 19 Apr 2025 00:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745023394; cv=none; b=BJ2Kh/5Fu8zpUSn64aUOj5M28pv1KGbUJ0UtPk4HKPYWA1setPEBWt5ZdMmRWqJiMcrcMNAcW1GFoaaIuSIG9xSnRCO2xCVRQM9oAp1PsRDQJv4fG1pWiq6UQzR887ctioiHT3XZum4dQCyz/GC9hR+Nw4fHm+ABrl2Ed3V0vZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745023394; c=relaxed/simple;
	bh=6lP0By7w/Dlk8nj5HMF+C4qxFyOplJyRe2gXUWgOqR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ebY82AUlL+wh6fRKSS6JBtzOr98QTm3eVMZbgLo1aZ80QQTiPJXun9iZqUod1PTURv5nEvATDjR3+denFRu0hjlF8EpVUPrIMTgStVf/4UCHDoCi8NGNa7i5UhlCmcCxg+EypnFCx5aH9XKXzl79by09we2Rou1Pejm6a2T/15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE10YH+U; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE10YH+U"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c55500cf80so179168885a.1;
        Fri, 18 Apr 2025 17:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745023391; x=1745628191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1r3+y8b+nuSF4vGtYpP5A0uMCQW+2A3VFWO1Lw+t7M=;
        b=jE10YH+UBF0vOC3yxsIsCY5SRf4PhoCnb/DngrSjTBl6ZVRLtedqSv+tr9o1FdHNVB
         QV3OdG9kLDEmDveDio/ZZ5W/o016n20v5GTwX9y26fhIfRureucSPXMm8P2OF0nHa+Cg
         kAcoRz4bOrTJvcn2m4Ph0kTI924XdL7vO9fSHqgRIxqEPyjKxjGOjFrH75qcol7RxaHU
         LYAMWtXOjInW372YqN6UE9NkyqIDj8fnjxWEEYT8kwHLZ8HVYUcerxdGcma6VRdV2lqG
         BnOaqEKPxPhmDEN0k7MORKvngqc2kVlms15bWOYpRvftqE8DrmwD3TSdh+IiOM6PawRE
         PNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745023391; x=1745628191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1r3+y8b+nuSF4vGtYpP5A0uMCQW+2A3VFWO1Lw+t7M=;
        b=b3xWekReH4RLmk0btI8Io44pYHa8WZMiN3mg2SPY1NN9YPq9HzSA5lyuaMb9Rdkj0G
         nn/4GP6SmxYzU125nPMNGCjaihs/Aj2xvSgGyrb+06in7lbCMa1PIYssDSWIjkx8jg1t
         tNQMmq80MvGV9bMZxb2zwaM0hNRPupgh0Dl4yl9lN28mHojFjVhvQAH53CGxFPdwyAtS
         qckNu8xUu8y8cUrp1FJvBvFDV/QtnmON7f04sHXp8WHQ2iQNXxHoRdcOi+Nu4Vv7/sWb
         h23dvhpEM/DgCWKfszOMQfCXWiC+71W95J3yHE+IU09xQT8OMJDtnJEcEW6+POTEHJQh
         nk7w==
X-Forwarded-Encrypted: i=1; AJvYcCVZmA24ocucJ7lXhQOTs32gjUrj5WEI6HqPYNBb8s2IjA6ovPSTreVM54N7WlH7HHCxZ2sBKX8YEjyTLpQkYA==@lists.linux.dev, AJvYcCVbw10nWQXqiNhCELBkCfVt37HYPn5LFalkMjT9lsx69KYduHP4VxvtdpL16rwU9cHS/VU+6ZEOmJlaHveN3RbSrOFhmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAp8oyE7EblfwDEBg7HzLmpr8yoNcfO4UhDBpmzo5cxBAJ5/oA
	ZrD1QGGcH/rYjiWYzDrrR/pNIhD9KCzrLtj45LGOF1h+D4pWJoIR
X-Gm-Gg: ASbGncu9YngvdFDQj0V9SRc/xtujG6Lgp5IItnfiThSJ7wDppA7rG+U4bvz0O/nJN9M
	OQ3twjRqmVZDjHyuP++SgoTtBgMBchcscmr3eBWj7t+71DoJ6g9GaNuQSDJzcUPOm3HrLJgYvfK
	sDrJa7Lto8T+fqWJ+iGDHhHPkCJCZG0XBxcH4K1D0qqMN8qOVzFwT8UA0L5QI71vD0Hky7idB+4
	0pHklPqSMJCjf60vph7Rtx7R5udoEGCywOMKZZz62pVV8jluKEpfxwXgmoCbsTsCmLEe/FZoFqH
	4LTsLu6eGheEjWa8rqfdSVVBj5ok3P1jz+gWYESY/t7aJt7luX6DFPf1RJrYB0iiZoQLEZCFsUt
	VOr49C5WCZFEzSXel+tc=
X-Google-Smtp-Source: AGHT+IGlBaemLK0d9uZwZRCVUJpbqZBnnm+N+gmJMRn4W1fr/ExrH60LjkWVgPqgTD+FVqHKyXvqyw==
X-Received: by 2002:a05:620a:240c:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c927f59459mr683764685a.6.1745023391213;
        Fri, 18 Apr 2025 17:43:11 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b69d0asm160284085a.99.2025.04.18.17.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 17:43:10 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	gshahrouzi@gmail.com,
	jacobsfeder@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	sergio.paracuellos@gmail.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] axis-fifo:  Remove hardware resets for user errors
Date: Fri, 18 Apr 2025 20:43:06 -0400
Message-ID: <20250419004306.669605-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The axis-fifo driver performs a full hardware reset (via
reset_ip_core()) in several error paths within the read and write
functions. This reset flushes both TX and RX FIFOs and resets the
AXI-Stream links.

Allow the user to handle the error without causing hardware disruption
or data loss in other FIFO paths.

Fixes: 4a965c5f89de ("staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7540c20090c78..76db29e4d2828 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -393,16 +393,14 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 
 	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
 	if (!bytes_available) {
-		dev_err(fifo->dt_device, "received a packet of length 0 - fifo core will be reset\n");
-		reset_ip_core(fifo);
+		dev_err(fifo->dt_device, "received a packet of length 0\n");
 		ret = -EIO;
 		goto end_unlock;
 	}
 
 	if (bytes_available > len) {
-		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu) - fifo core will be reset\n",
+		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu)\n",
 			bytes_available, len);
-		reset_ip_core(fifo);
 		ret = -EINVAL;
 		goto end_unlock;
 	}
@@ -411,8 +409,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		/* this probably can't happen unless IP
 		 * registers were previously mishandled
 		 */
-		dev_err(fifo->dt_device, "received a packet that isn't word-aligned - fifo core will be reset\n");
-		reset_ip_core(fifo);
+		dev_err(fifo->dt_device, "received a packet that isn't word-aligned\n");
 		ret = -EIO;
 		goto end_unlock;
 	}
@@ -433,7 +430,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 
 		if (copy_to_user(buf + copied * sizeof(u32), tmp_buf,
 				 copy * sizeof(u32))) {
-			reset_ip_core(fifo);
 			ret = -EFAULT;
 			goto end_unlock;
 		}
@@ -542,7 +538,6 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 
 		if (copy_from_user(tmp_buf, buf + copied * sizeof(u32),
 				   copy * sizeof(u32))) {
-			reset_ip_core(fifo);
 			ret = -EFAULT;
 			goto end_unlock;
 		}
-- 
2.43.0


Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753B31280D
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870879; cv=none; b=BYHJ/DU4HGhjn66w8/nw7/4cLxv0HQRym0ILL2R0jeGaUo1FjnUUikoc3l4LgGfZPp6XdxsPLoM5YBoM89DbpBqW0/eLO8m+OzCb92+olaezRqxY3bGHgIpoYoJrZaYB9gPDTkLH+8NWH2mzg8orrGZYAUC7h46kQ0u4ZYoDA9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870879; c=relaxed/simple;
	bh=mXqeOcCgJU3XROJ0rt5KhWahexCImMG/r3mbA3vw0C4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dY5WDhPpjjGCU7RidLeYzg1CIwMn3Cxipo2M89O3Ga2p4+f4aShrcdG0SkghdsY7cU9I2In5moH8RPfh3CvrQJan/r/sb2ajKNwJTjRNz1FctOA/IaBFP9BT2UXVCDCLXlPMzY93LdqCucZADC9s9p90Lr54Vaw3H8lPHaScyxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6jrfsJC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6jrfsJC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso77774445e9.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870876; x=1767475676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzSxm/019l1HHR5hyYJXq5f/R31ZY+ROx3WtUYUp700=;
        b=Z6jrfsJCM7Ex4LGqM5KBEHMGVXRwLIwdN3m5YUjju60fpJZ32TRH/kM2Q502++cuW/
         33h6/ydjv/9m1WD5n2hrFqpMugllW+uvPwJpuzhSSGLThOjj2pzJIKtl8WgJwV0REKV0
         4Xn7NO+klUDQbpNx/2PHLFX4295Bpmzxg94wO42jxKw9gomNCQfT4lXmuDETyq5R7xw4
         9JcoyeRe8uqDdQdq2iEC6CcrGgLuvSxUcO6tOBO614CpmXcEavwiVR6EJqNMUAJkQfkT
         UcL1xXnnWrdZMWbZwWAy0y7Nl/bM2voONwanR0wWYX4F5F8Qi4VsuSmvmBUX8ozj+kKO
         jchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870876; x=1767475676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VzSxm/019l1HHR5hyYJXq5f/R31ZY+ROx3WtUYUp700=;
        b=OeSQFYGFy/rMgjzjZnnLfALL5oEBjDzSZeRPUzTWFWOG+8KdM8zrQZL57W5M0fuvkZ
         Xu4DllPkP0O5XEGEe5ht/bURmI/yegHFlS2c/l/lAMzFgjRDEESvV15oCAzJgko8emVt
         0UClxY02AOnaRHQgM9Dx08JlefTxGEdGWqD1cXgP1ybzdkQQLPgSIDWagxNwkKYPLuNy
         KdP7iYu9ZPQrYqsxVL0DyqAA1tbzhcXGRJKmqA+CY0du83sJ9H3Kl9ghmQkCP0yD5SiG
         OXoeCZRKE8+K6R3vXTRfwonw4ZxoJj2G6D44Jg+lYrx3OdQOFLPptvSKVXQjtnJhbNdb
         CWDw==
X-Forwarded-Encrypted: i=1; AJvYcCXfvhfhd6cQFYDQItZG2zhaETAOKKZuI3QC4LFjvgE6GBOm+ePSAKN/AYU5s6GBOeBQNOxXnIF2aGsd3E1h@lists.linux.dev
X-Gm-Message-State: AOJu0YwoIuirfUh+Zvo2Cay+WnYvc5DXamh7CvOiY1mfhsFAeCOOI6yu
	Qxzk09nlm3tqx9lnCpaVYAsqKEuTPA8mWjC/kv+oNPpuzILfb9yqvvZD
X-Gm-Gg: AY/fxX6YyTt126oWKCNE4wrMlcVfr12vA172likIOEpVNpjEJPrz/Kbm5v6E41L2Kfn
	c4Wr90rFf4CumsddeC/SnEudTBtxW2NnypoSPv241WYycGNxVZTa0RWtCppIQq757EBBggJYsHu
	X3I+xdMGhtPZPLEQAhlsgyLhupOCHvasKVSaojZNO/2t95a7cGKZnkNWUTn2SiYwJUqhhqrJBnv
	lAQjWw3tmN8/F0d/6yfMm/GjKFHc4FSGgU4/PE2b4R1Oz+4GBjRWSjZcIqgp+enH8Y+Jfjx4cUA
	0bvmtKd8trtDcvNPOPViEzg72EuAtRblbKzClaJv21y/IbbppbgWOaIQkoP6Xm+JVSFdnzafSpM
	ZIzhms748El+xDpY/KDgtXr/5MHm8Ctj0giyBWqIKyRdtFdWbso/XV2j1mWv16mcxWpplTg30DS
	8HXpbJRVT0Hf9L1WkIx6qHPgL+MmHmRlU=
X-Google-Smtp-Source: AGHT+IFQozIg+ybmDT3rphyWgEaP9rVwYL3POlCOoO3kvVstM7Wastdo88dw6L/Mu3vNmUWxOZ9OqQ==
X-Received: by 2002:a05:600c:450e:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47d195bdffdmr335301495e9.31.1766870875612;
        Sat, 27 Dec 2025 13:27:55 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:55 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 6/9] staging: axis-fifo: Remove unnecessary zero-length packet check
Date: Sat, 27 Dec 2025 23:26:37 +0200
Message-ID: <20251227212640.3321310-6-ovidiu.panait.oss@gmail.com>
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

Remove the check for zero-length packets as this condition cannot
occur during normal operation. According to the Xilinx AXI4-Stream
FIFO Product Guide (PG080), in the Receive Length Register (RLR)
description: "The smallest packet that can be received is 1 byte."

A zero-length packet would indicate a bug in the IP core itself.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index bf610e71253e..6d9ff6384168 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -193,11 +193,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 
 	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
 	words_available = bytes_available / sizeof(u32);
-	if (!bytes_available) {
-		dev_err(fifo->dt_device, "received a packet of length 0\n");
-		ret = -EIO;
-		goto end_unlock;
-	}
 
 	if (bytes_available > len) {
 		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu)\n",
-- 
2.51.0


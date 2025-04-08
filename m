Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED03E2505AF
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152996; cv=none; b=ZZUsK5b4o+VRKhiwlQ5dqcApq8aa4WHPSoB7fChoiX4q13fMnJW4iFqS8cUUGxigSO6f3l4W49pI9TiVgrzJVdqX74o0IYKFJwCeK9Q5mBTjQjqXu6TzLAg6MnIYbgSkKFgc4UuZsTPj7w1ybsmKFENxFcnVXj62b1KPgjn/8xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152996; c=relaxed/simple;
	bh=64A1fL3icCqLfyIFzefIzkWUMnxUtIKnTUU/t0fgAxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clAhoE/Lulhl242aMx304FLaYEfjGDfqS580XDSlgZLihZ6ewgE+VYNkAybwxoMbcYZWhAm3tqIZ3uQBHoTqpWeUMDCUb0/fOBuBJgRGAhRyD8A+JNWREjc81A8t+TQT7QTqQpKoj0ff1bSH6K7rzm1TLiq/zefgCSXNg51sgdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=SrysshBE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="SrysshBE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af519c159a8so5538002a12.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744152994; x=1744757794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm5AXhXZ7EO6Xz/bF1BEFBHOOg08llbrt+bodgHagxI=;
        b=SrysshBEjE7N78o1KgtS7IVatKWlOKwB71D++hMVpWtg6Qvc5JX08VwDr0sVdwbU0z
         t3MQxJFwWKhdP78sCK3J9COYJSB+vsoTTDS00e0HdRU1RuW2PhZ4PkCJHWmk8aDOoSlB
         KmTOP52QqPrgsoWCRyuXOch6/ey55+39BUxeIUsPLFRlnyuZ0IRpPjH6ZUqnoflLZGbt
         GwawiMq+6iZvbGDPFv06BnAsVP2uqjSpV3/glP2ZFewrKrizpOOJ8x7WaHITYwKLjmHc
         L8W3CfmMVFobu/q0gNHSqMGiFKY3cmiZhpoptaVdgzD1GIVB01utGcjWt7LlHfjEz0Rq
         N/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744152994; x=1744757794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm5AXhXZ7EO6Xz/bF1BEFBHOOg08llbrt+bodgHagxI=;
        b=ZmW0NAVIvNRGaZMHqssETPFIQ27bNniIboCSE0xj8S+53/3TEG2lmLaXxpkJP3XMA4
         X6XY4+jq1Xs/uMQk99rCDalHMZvMAJc5e8Wk32TTGEV48OCyjE1KjV/CxQzY2LHpZbPU
         3pNMwo1YqdTtV+3ZbjBUZzWPwJ1xIMz0bZQ5d5vSg6MWPRLPfX1AH4CWgdEXtdFAWBYB
         coFaIb+Vn4ERmDRx3pbIssylKJ7+6vLBT5LHp+Vek3lreraZjm4n2op9A3a1aV/AVkym
         l/7RnO2FL+vbj18JJ0E1M0Ekvgwoyz7d3LF19NpHub3f1ZzKdkz6OgKg9Rcrnb/zlD8D
         RjXw==
X-Gm-Message-State: AOJu0YwaTcdQDu0Y+Y7YSgJW+E//7F3gISEfsDq3V+5bHK+0CmuelliY
	PqQG+Y5JIdPr5ZVcBVC/4QnzLcEING2jWQ3t0W/wYrSt7T806bgRvgJVLVU6cPrUHErQ2+21uV0
	=
X-Gm-Gg: ASbGncub/JDiLaEY29Kb8QxYQSrSJVwcsivfqaKhHJeAEqPW8G6eWodFTntXsZuDM7j
	XeRcAWdddOfXnNiojnD0Uf9c1kqRSlboSZw9tpjcUqKC+ZqA3Gv05OMAYooHA8domHH4pdEke9E
	Gebfh5gPKo1vOSpwvpGuUok5dR6Y40/raxYKd2IViIFV/aEsUoBckYR0EJuLTa4sIjSn6OxClkJ
	xCn7bKw6XZo09Z17shvYOyt12lA6xOj58LHz2OcvZsGrvx6CjbCnbJd2GLIBAclr2c0DFjsYziL
	ctExNLgCLRof+2x10uHeMSqpAg/qeJPModt0sj6MXhsMUrOh9x8eFrKQPZeCdIK6OL1fTIcaZB5
	onTv56crguA==
X-Google-Smtp-Source: AGHT+IHMrbGlBdlcelE02MMVEgm0kvLnYsiD8ZRzKlv7S7zsxd3sFgnnnfkO0DUDWMP68U3E3qjqzg==
X-Received: by 2002:a05:6a21:a34b:b0:1f6:2d39:8713 with SMTP id adf61e73a8af0-201591c9103mr1018919637.19.1744152994244;
        Tue, 08 Apr 2025 15:56:34 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b4869sm11504349b3a.138.2025.04.08.15.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:56:33 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 1/1] staging: gpib: agilent_82357a uses completion
Date: Tue,  8 Apr 2025 22:56:28 +0000
Message-ID: <20250408225628.187316-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408225628.187316-1-matchstick@neverthere.org>
References: <20250408225628.187316-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

agilent_82357a_send_bulk_msg is a oneshot event where a semphore is meant for
synchronizing over counting events.

Recommendation is to use a completion instead.

Reported by checkpatch.

WARNING: consider using a completion

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 12 ++++++------
 drivers/staging/gpib/agilent_82357a/agilent_82357a.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index baa8f149024c..97e7caefe35b 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -34,7 +34,7 @@ static void agilent_82357a_bulk_complete(struct urb *urb)
 {
 	struct agilent_82357a_urb_ctx *context = urb->context;
 
-	up(&context->complete);
+	complete(&context->complete);
 }
 
 static void agilent_82357a_timeout_handler(struct timer_list *t)
@@ -43,7 +43,7 @@ static void agilent_82357a_timeout_handler(struct timer_list *t)
 	struct agilent_82357a_urb_ctx *context = &a_priv->context;
 
 	context->timed_out = 1;
-	up(&context->complete);
+	complete(&context->complete);
 }
 
 static int agilent_82357a_send_bulk_msg(struct agilent_82357a_priv *a_priv, void *data,
@@ -74,7 +74,7 @@ static int agilent_82357a_send_bulk_msg(struct agilent_82357a_priv *a_priv, void
 	}
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	out_pipe = usb_sndbulkpipe(usb_dev, a_priv->bulk_out_endpoint);
-	sema_init(&context->complete, 0);
+	init_completion(&context->complete);
 	context->timed_out = 0;
 	usb_fill_bulk_urb(a_priv->bulk_urb, usb_dev, out_pipe, data, data_length,
 			  &agilent_82357a_bulk_complete, context);
@@ -89,7 +89,7 @@ static int agilent_82357a_send_bulk_msg(struct agilent_82357a_priv *a_priv, void
 		goto cleanup;
 	}
 	mutex_unlock(&a_priv->bulk_alloc_lock);
-	if (down_interruptible(&context->complete)) {
+	if (wait_for_completion_interruptible(&context->complete)) {
 		retval = -ERESTARTSYS;
 		goto cleanup;
 	}
@@ -142,7 +142,7 @@ static int agilent_82357a_receive_bulk_msg(struct agilent_82357a_priv *a_priv, v
 	}
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	in_pipe = usb_rcvbulkpipe(usb_dev, AGILENT_82357_BULK_IN_ENDPOINT);
-	sema_init(&context->complete, 0);
+	init_completion(&context->complete);
 	context->timed_out = 0;
 	usb_fill_bulk_urb(a_priv->bulk_urb, usb_dev, in_pipe, data, data_length,
 			  &agilent_82357a_bulk_complete, context);
@@ -157,7 +157,7 @@ static int agilent_82357a_receive_bulk_msg(struct agilent_82357a_priv *a_priv, v
 		goto cleanup;
 	}
 	mutex_unlock(&a_priv->bulk_alloc_lock);
-	if (down_interruptible(&context->complete)) {
+	if (wait_for_completion_interruptible(&context->complete)) {
 		retval = -ERESTARTSYS;
 		goto cleanup;
 	}
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.h b/drivers/staging/gpib/agilent_82357a/agilent_82357a.h
index cdbc3ec5d8bd..23aa4799eb86 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.h
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.h
@@ -6,7 +6,7 @@
 
 #include <linux/kernel.h>
 #include <linux/mutex.h>
-#include <linux/semaphore.h>
+#include <linux/completion.h>
 #include <linux/usb.h>
 #include <linux/timer.h>
 #include <linux/compiler_attributes.h>
@@ -115,7 +115,7 @@ enum xfer_abort_type {
 #define INTERRUPT_BUF_LEN 8
 
 struct agilent_82357a_urb_ctx {
-	struct semaphore complete;
+	struct completion complete;
 	unsigned timed_out : 1;
 };
 
-- 
2.43.0


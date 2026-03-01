Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575982E92D4
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401706; cv=none; b=Ngo7HyQOyMMDftJsuKKmeQvaitvDF+64jr0ZMW7st2cyHRi4dh+nEylzXdJFllUEKHE5RHn63YWyojyA5zYcF/Z1MReuFRZdJPdJ2daVIZAiNC+n9Bn2spgjFkioNlGk7Tu/AF9DYg94L6l2n0/MgYvEPvkd3iUZte0/zMTsHLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401706; c=relaxed/simple;
	bh=EEExisL9ZxFMSVway9coz0e07ZbRvOOtunDKAUDdE+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGQnTSNc/EDCWDgFtD0Md+18vKpS5SwyXuyB1n2iLC3qHmid7l9kSM+u4brA7qQfAjAJU9eDwiFCavxT1gcQ8zk+TRFrJLxjPwSwepFsCiMv+o+RDjhSwib0RwphVd3svgJz8d3mdCgrKMEuD47gnglI2sAlMwuKyVjQ6JRCEJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd5qotQn; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd5qotQn"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-896f4627dffso55157366d6.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401704; x=1773006504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75IgDQs0oEmkLuL7YnbfeaPuMP52JNoBZmKkzLew9AY=;
        b=Vd5qotQnczARxe6M0ZmOqjKmxVTvO/YYurlYUGwEWgykYgcscJDBsFx9v33pd9UcWV
         jcmWOtSFKRtH075Hi/9NPqbmdWxVyF3KxquClh2kZmHDACDPIwl/Ra6WY3d/nTvAmoCY
         sIR+VdNLEqUNnNFeIP1MW1S5zZtZHFxVrpfy3n1sKSkUuIIDmHtQRDxX4QnAoP3aMtgp
         bTiX5p+j7IALulOQtcqHpofieiSiAemvg+7iRFSr5Ye7ScOY1mcnnT8AlmKrPh6a7VrV
         KD1Ib3Lp4Kjymd07c/nt6qpX665j8pTYCjJwKutBPAJ96Lkhrprrl2OLVPLPXYmq8U5I
         kh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401704; x=1773006504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75IgDQs0oEmkLuL7YnbfeaPuMP52JNoBZmKkzLew9AY=;
        b=ASQ58D2Qf5pcrgB4pKv/nYGq8eHgppEGDDh1vYQ0iJza8y/mOVa67CxFVRQXzJN4qK
         QegS51hv6QELYxxgB3lHMZp9Ktl+fETP5KhKHQCBaksAGKETCkYFOqM0yzrx5BWEOti4
         47OQHzSZOkdaDS8LrX6GWLFeG4JkfLN307n4qNCiWzVFlZajpR2AY96LcDi+d91oD14B
         xkANKkZ7gzC5zaPpFMmWfFPEN6VfhLe6PtNTv+idl+Yo44buZwSYjO906v/CstTe9hZX
         3Rgs5mmWe/pGBqAspob7eDAfkwjhnJbR30tIp6vGU1MKsB1WWoGXXX/ATgqh4/ah0tKF
         U2hg==
X-Forwarded-Encrypted: i=1; AJvYcCV5O8uu6k7RERBpLLIzmvwKShJ682a20Ei5tAUkjNYFF63buXhat2PQRGvUZKQHTgGJK7YUhO8SelYfzZQ1@lists.linux.dev
X-Gm-Message-State: AOJu0YyHpWV+/s/51N79lVL9RwKUamajDfatQl+HBy6WmR9U++fAa9KX
	/Umojp1yi12LQuzcBMug9/eVKamuIwjdbo5Tg4moOwmtP5eF4z9DkdgB
X-Gm-Gg: ATEYQzyb/voGjPDeaQ5hzrXoNCAZolk3CdkSg01OGZxlSHLnSweRSAHc+3XO+BEU2sT
	LEem/VJ3qQguEGt9LFTRJxnbE29ebaSrfsS7OlVQq7OkxoxAvhlEwQGT9+NgQOO8ah5tR76PrwG
	+pmnH212cVpJdJvRSxcGP12qN5MpYL+GJGeeo466lPKxQlV6xa/MzwuSOxtS1HaUl+PwR/31xFM
	LO8IwJzm5hSlpmHRt8aZsf0TDueOppamLZCZAW1JGQIQlJ8PhaB914LhB5ix2n94pxVPxkMdTxw
	1YJoIrkrieXEkJ1jIFkDpG3csyZtBODCElohCUqEcqugh4E66/MBlNR+rrI8yuMuQOmKOB1sIkb
	X4pj1HZfNLLQBveQWKkjzjnOWZbMMzyRzFgq8gp4CSbj61ICRjzZJz9nIDtxRcn9bo9dkHv5SkK
	yhfP5wcD4OGSJDYuPd3NXs+ot3mm6IJX/bYIlS5G3t8b0G6I8EeGRCLaYdcUpjra+8VbllxpNGv
	zbt
X-Received: by 2002:a05:6214:2482:b0:899:f9f5:9798 with SMTP id 6a1803df08f44-899f9f5b2f7mr26197376d6.43.1772401704350;
        Sun, 01 Mar 2026 13:48:24 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:23 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 04/10] staging: axis-fifo: use dev_err_probe() for IRQ error handling
Date: Sun,  1 Mar 2026 21:48:09 +0000
Message-ID: <20260301214815.2628942-4-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

Simplify the error handling in the probe function by using
dev_err_probe() instead of dev_err() when devm_request_irq() fails.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index fc8e35696b31..28268881cda2 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -484,11 +484,9 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	rc = devm_request_irq(fifo->dt_device, irq, &axis_fifo_irq, 0,
 			      DRIVER_NAME, fifo);
-	if (rc) {
-		dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
-			irq);
-		return rc;
-	}
+	if (rc)
+		return dev_err_probe(fifo->dt_device, rc,
+				     "couldn't allocate interrupt %i\n", irq);
 
 	fifo->id = ida_alloc(&axis_fifo_ida, GFP_KERNEL);
 	if (fifo->id < 0)
-- 
2.43.0


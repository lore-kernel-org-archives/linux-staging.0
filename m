Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6E288C96
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401709; cv=none; b=PP1m+AOOV5KU+N+kYhjghcXFJkbUpFQdvKxXuYMqp1KRV2QRfyBK3YtBOE3tACCiYMRXj9NrNw75qEEuXrTI74Uah4Cp1PhXaediQAXuePvtQGOBF83KPqVhqCeSU4QrXQRlQlH3Qp8JJY8pxLsnYjHXqvl0nCjgZSNpIAIX6hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401709; c=relaxed/simple;
	bh=uV6SXSw0MfWVMfNUuFGGsqwMAghKj394Vh1glXZgdYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1iJI4SjaxKFWB+tHYUccY2vLZpw5VPmGSCQU3LepEv3AaTu78EPP/LOAzuJ+GZbCKEsbiuT7v0gO2oeHE/dWcUIFEZ5XOfMyFl0UG0ehytzU3FLa8El1QkD8B4zRABP10gsljRzWthVV2c1xDAB1A3ClQyPlY32oxgWAVMbiUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTwxPKbc; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTwxPKbc"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb40149037so405867385a.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401707; x=1773006507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2a4CYTNrZFLepOLrTsLDlAjY/UqwcgUk97CHAjW/Q0=;
        b=cTwxPKbc7CEspMYyqv2kDBwEVTxFnyh8KdJNNa3jdf18MJYK9Xe/SZN6+qBwhbq31v
         SwAij4d1ev8zE77zpEToDKZenONm/qerl/hH1ahUqO9A7dnFZsaAxMXzDfxr6zjO6niE
         fWKYxwMyOVdz7bD+vbeFbE9TIlHKgU3/tabTjaTnqDErhhYNloivHdKSuuLJ3ZySfuMT
         IDyj9l3BsU/5DXr5T8HDOc9mAmKW8Ll5cRtMCV+Q9N2hycuSe8gKa4WRSa71+qWRoZbr
         f/dCADerJX22QMQxEHzOoWl7HUfiaOH2gX2uDTDE6B02bIPSnVcdqvsywmvm2p2tWSVU
         ocNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401707; x=1773006507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2a4CYTNrZFLepOLrTsLDlAjY/UqwcgUk97CHAjW/Q0=;
        b=Ha1aW2FJJGIpQGjS4QqUtlvbjXLBYeIRK4lmfWtsGcu9ffV/rnL03+fskmHU9Sqkp7
         HPACek6PZmb6eWdMIJLxLx++LU8fziaMWm2D2bPDGLrLOME5nSS2ZyOyHfBRiyNsH5Rk
         J1bSYjvTh/0k6dC0gc3sRZWL1Qe1zMNNGnqVh0RDxXj3H4fpXRNxldmusqDyGdZcmsV+
         RQ1SomM8CQUw/Ahttp9PNdB0fg/QGvKYfiGFs2laJdfB/vc6b1V4GAl9JhjaB0bqaGIv
         JV0ttxG+jECbXjZMGntpld3L60YSY0Sph2z0E4Z1V6ASrHRDpjt5k57UR19oGQk5atSm
         KrsA==
X-Forwarded-Encrypted: i=1; AJvYcCWr4fEjd0jnm5E5PoM+dywIem/OOx2CzuUv/AFMEmopHdKH6G0LCdw23LW5s3rFWMjw95JpZmljwcW9RT5X@lists.linux.dev
X-Gm-Message-State: AOJu0YyqaCwi0rHu37YOiobrOIGB2Gc7zq4mSMgPpqnjcQdlfhuXvtXk
	ur9mTpxQfBeUpX+2Bv2Sa92ZlUVuVqV0VGTPMFIxk0u3WnYnFw/wL2od11mWmDzc6Ag=
X-Gm-Gg: ATEYQzzHJxCdTnSKGCPnMLEDJFtFXCc+kYWvO3liaFUF6NCVb6WWk5qEbDBcUwp3GkA
	8I89EOSd/v206sW8Q1FuoiYzNXoelmIPouZE9Skg5CfDSCpOD0laxhESw00nX9JVQs4HNK5oGBU
	lRozswPEz5a7mwx5nRytdrBU1bK3zWLmM1cAt27u5hNY8D7IxrGRZxYZAehNvsRZkrguvUopo2y
	LtAy4PUh9/ePEsE4uKWvYjfeE3lMBcgu/B2etkbGBFJ/FMxIGnp57xZV3/94yF/+wOpjI27FKIE
	eoz3tVzWZocFHvQxU5S7vKfLYDf3GzjWrprtm5N4JPsTbmG4PX9YqGL7KpPeoKh6Pvmp+PxuVfb
	YMl+qWlz8lBGrawCRNKPE8Hol/9/JmBURQ9pB0AFSQIp4/f5Kq/UKwRy09aiS3VnmYwkvaN7c/3
	uj2O8kqfT+Ff82ykdJ5243gZUbyAt8bmOmiEIvtwq7z2MVXvlJI/adq6+qD9ZMjfi5PaEU8FXru
	W8J
X-Received: by 2002:a05:620a:4590:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8cbc8d7b815mr1331987985a.22.1772401706797;
        Sun, 01 Mar 2026 13:48:26 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:25 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Date: Sun,  1 Mar 2026 21:48:10 +0000
Message-ID: <20260301214815.2628942-5-objecting@objecting.org>
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

Return IRQ_NONE when no interrupts were triggered to avoid spurious
interrupt storms, and only clear the active interrupts instead of
blindly clearing all interrupts by writing 'intr' to the ISR instead of
XLLF_INT_CLEAR_ALL.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 28268881cda2..aad2206b481a 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -302,6 +302,9 @@ static irqreturn_t axis_fifo_irq(int irq, void *dw)
 	isr = ioread32(fifo->base_addr + XLLF_ISR_OFFSET);
 	intr = ier & isr;
 
+	if (!intr)
+		return IRQ_NONE;
+
 	if (intr & XLLF_INT_RC_MASK)
 		wake_up(&fifo->read_queue);
 
@@ -324,7 +327,7 @@ static irqreturn_t axis_fifo_irq(int irq, void *dw)
 		dev_err(fifo->dt_device,
 			"transmit length mismatch error interrupt\n");
 
-	iowrite32(XLLF_INT_CLEAR_ALL, fifo->base_addr + XLLF_ISR_OFFSET);
+	iowrite32(intr, fifo->base_addr + XLLF_ISR_OFFSET);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0


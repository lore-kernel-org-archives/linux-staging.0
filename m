Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DC01FC101
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 00:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326523; cv=none; b=iBgxTzOO4Isxg52iviRKtGCQCXZAhWHlEogms7nUkVhg1jzUZOgibrxzazKFTHVjLWat0AUMCVFl1Kxlr+vdvYkxmlDq9LegqUXPN7GCih0hcQmQxEeipPSSqHzslS9XfH+bmtCuhrinM2IE+ooox1KDjHH5uVzwWGenlMa+b+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326523; c=relaxed/simple;
	bh=bLyRPIhmVFkUqLi3y3bQPnpKuj3wK5zHZeruxl/aTkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pefLoVvA2+doA5fJNofwvZN5zUEgqrj/oL9YTBcSYXcOstzD30oK6dASXIfJre3/KtqLaWs0B3bbAOdgUIzhW+Frue5GG4INi0sG8UL7kjnTGLAGLgW4pGf359w5ZD17mqcK7XABNCPr4e5JwZOKVWDNdnjhePnwSTNnTa0mC3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVjkGIvx; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVjkGIvx"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cbc593a67aso276867885a.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 16:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772326522; x=1772931322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdhvuZH63NuTrmGD4re+jHGZxpdfReAQOfxr8ryWUCM=;
        b=IVjkGIvxUXn+IhpuZvgSzuKdzHRZfbmFLnxr8uIfx1ou79mCNoLH6TpYMTKp/Eds2z
         uFcXYTCZWPVMHUqSm8viCaJn6dDBrehtlOM5PumvPWNTbavTVbLUkdep5PlhHJkezDVM
         sFLz/5+XTvOgYMWIW/4L5DcvtU1ufIK4EKUdMKjYR+uC7atQN4RvHpRQwQbUmH4K9LZZ
         ERWWCNd0xTf4aoJV1Io+QUYEvLMaHXgWfOQkCZfoRz8+XdjlbNdyPEvKD5wJaZxOdzWM
         FvJtcilHqmwaOBMaN1oupRKnjC3eKK3yA+vJLMJVspFlNIq0x5ZgKaVArUA99yipco3d
         0FXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772326522; x=1772931322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EdhvuZH63NuTrmGD4re+jHGZxpdfReAQOfxr8ryWUCM=;
        b=WESxh0HmXxewpjlOOC7iFg7itZlzcBIU56JLjx+m9/xBr7AwYlLj8ya2qiFaLo/DMz
         sq3P17iGCFZQuU67C4Wb3HA7e17d+kkKJ3IraWzCnoE5jVxJCgU/eG9uK8c+wqNWCrFK
         RAdLkzPeBS2UDA5hV5XpJXyFWu7fnoRbf5GKqAzrxBI+nzUm82+VoD29Ndi528hIXcVA
         MV7TE7lDS+mD5E216Rt2kg0wYlxAyu6wRrfltnZOJlpCKzP7M2TLQIv8DPNyUuWK1A5e
         4As3G5pft4cMeSGwfVD1/h8GLZELhmhOi6YrBpsGwkD7q57lfn3yk/P+TlKZb5lMyupp
         8+Yw==
X-Gm-Message-State: AOJu0Yy0R+5gNggeeUl0mD/C0OlLfEnSFoDGZixUyH8WysRi1Gs9/JMI
	KWG5C7I3x1UMiCd6hEoHDVH7BCUp0P5+qOUDRQCVJSbcfLvMKufoPqCI
X-Gm-Gg: ATEYQzyVaAVwknWfK6ah66TkX2vcH/ARrxuEY7mLMWRpxA8FbSfOcSo0/4UvPh0WXTr
	vh0XiJzJj/FDMvG3OVYZU9KEAENE7qFOE3lD7xkBdLCH9Ut2js38FOpwgP5A9n4f4UfPeg4V1NI
	KWOlKts77SUJawGlvoLhSxBs4ZdmRUtBbEy5LPyKtUxsusUFI+2/DgxYkMnj/DQSrsp8dT8mGFr
	gqsmjw+s0zLnkDAxtIz1GOOKkqSNiQ4zDu44hGts459whyqIqENkSoJsqfGZJe/68iftsCOsFRw
	HHSuhmzO4bmxzQlGCVnBc1rz1tgivwzGz3NX8l70yi/ozZPvqFrEeAkNkuEkrC2AOLo3gWUAlRW
	4dUsv0Gl0MUom4d8F+NglGEaz5IEHBRSRx5JFu/MspqqgkE4vEIAnBZiEpUuFqjdYQ97zdwwC0J
	iWXDNLdbIDZVwTraHV3K6uLTq1SxJfkF5ntRrPjeo1La8xp8rYCI9yMTihy5uhfJgfIlc0OobVs
	lDr
X-Received: by 2002:a05:620a:400f:b0:85b:cd94:71fe with SMTP id af79cd13be357-8cbc8d9fe65mr995119785a.33.1772326521568;
        Sat, 28 Feb 2026 16:55:21 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66f325sm815840985a.16.2026.02.28.16.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:55:21 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 3/3] staging: axis-fifo: improve IRQ handler
Date: Sun,  1 Mar 2026 00:55:19 +0000
Message-ID: <20260301005519.2512706-3-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301005519.2512706-1-objecting@objecting.org>
References: <20260301005519.2512706-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return IRQ_NONE when no interrupts were triggered to avoid spurious interrupt storms, and only clear the active interrupts instead of blindly clearing all interrupts by writing 'intr' to the ISR instead of XLLF_INT_CLEAR_ALL.

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


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BCB2E4247
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894982; cv=none; b=k/+IeSXsrcQLdLielJw+TU7rMW3Q9Zsceh8aSGRm5P4dYEhTfP/iwyksrtm+BtTMTjIktlt1eJ6iqnDKKvrjsk+xspaisW8jpRolx+pc5FUAgp+hufcEUn6S/AvAKQBhZHnvEPeP/gaFkoYBsGt4cX/F4j/4WMhrGZ2zJTzV6iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894982; c=relaxed/simple;
	bh=nQfxStQgAZIT/7V2Dz+B5yYQNdnSX6jeRQJEbF127hc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YfBUPwOUUG14IsXL5PW5blvIKS61bN7ndnBOrzUyQ2y228ME+P4Zz9SxPScTDY+ivOXol3WdB6KlR9RAX6hGar3e4jKPbhIEKaaB/w0T6UAtd+z2KSOZ+vX8xqpRMZmGKcT6WYh1b6w7qblgRte7tXuyyJvXT8keFGIwt9ZeYl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AISXqZmm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AISXqZmm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fda2a389so39339545e9.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894979; x=1775499779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YYKbi9TAQDo4vIdQzi1VMjiLJLyck2kBAU63KbgZ0A=;
        b=AISXqZmmvGJ8CxgTPGJGW/xFrOVLJzwVnML96yuzGTTYDXVhKy6rEleb8QUizdlOnZ
         tnb2VNTOXnFTgajyJEaqbYULhYvdyWqLR3JpC193ehIUaQdhF6CdGaz70HH6HbbNnrhb
         3WwSYnEoXKM5kl43pwqnS4/97QE3SQcddeCyXZxeztESr//RTovuSoWJAUI/TF/Cjrv1
         Z3skoV0yyMHmdsMTUFEvNroGkxjib00IgJf91TdoFXKjcSTNm2/iG/vLlpuj1PhSxoNa
         6TslRLhByM1pMuEvsHlROGkmTfm90bO2zzB3ou0xBTxPvfJZF5kjMtXLNtyLmx++5D2+
         hCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894979; x=1775499779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YYKbi9TAQDo4vIdQzi1VMjiLJLyck2kBAU63KbgZ0A=;
        b=cvT87jmPGjFihcFkCFXlwgx3MwzaxLTYz9/D0G0GbDL914psKQbi2uCrsPeu8VQIiu
         YF/yx3+tG5KA820QjeF6xQCduZ7VUN/b96C9yees421Sil1o7uYaTm+qGTWAbavK3ebV
         mfNhW8aqq279+ZK3zER73ZfdbP8GwRaKCuDyyrnz5xzNOvnoDnyCbys1zwKwDrObmRoQ
         f0B8048tsil2I/ephPsJbXhlvdjFG+l2Ra965sLdTIYeaj2+jMPhVbjcXbTsJrUWLBsL
         2hpbMtRF81Mv9NAgHiGfYShl37br3QhHa28HXtKGJ6kUQebIGiHdfXDo58SieU45QZUc
         o8Gg==
X-Gm-Message-State: AOJu0YzNV8PmfcNNms9SNx/UAQrNTNCV0zJ9CqoVVdnnVpEATpieODbd
	/hSUqM0bcxYRjPdq8//gHgACY/BIltfT2i93oAct8l8+q53zUaoTybqSLs+7WMuZmolvvPIe
X-Gm-Gg: ATEYQzwET2537X0B2U5VGKEhpMi5Letg8+vYi7nfWH5Lmv1yRD9ar2KkyYQ/V8LW51N
	tM5Bg0OChxV2Xq7mwDI2SmEeaoxXeD4myrRjZhKT1yMnwz1B8JYtAPwxntGfyV6ChKIRHnYlzd0
	cQxF+bFsSldvGpjJkbxx7WTaVeSXWeoryoFym4S5U/c/V2aEDbxl210LjQjYQXiddRuErVqpXTs
	C5w0ut0mWWTp+bO13vg6sf3u5CFBr7SIJ9Iwn/C/sj/vuMW26JICVpehvh3RoulODfgohvoDEBu
	SI3uMp16Q6PYLsZibswtWkvwWiO6l9N0g2zrCK9C+aQwK341BIDhwjvFumrYhx1K0FyhyhmtEt2
	DOyblvViNhAVPzruqV0KCfh0470saItvEphT7OboORVHBeuNv/JHjhYg8iMB3JRf+oJuBZuuwVT
	SoTz6Fu3san3eGUgmg3VWWmuIOrVGvXKSrIQC2BoUJtfOG4Ev0Yo3r
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-48727d67a21mr218116275e9.1.1774894979039;
        Mon, 30 Mar 2026 11:22:59 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:3437:41ca:45cc:e6f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48733c095dbsm130198405e9.0.2026.03.30.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:22:58 -0700 (PDT)
From: grondon@gmail.com
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH v2 1/5] staging: most: dim2: replace BUG_ON() in try_start_dim_transfer()
Date: Mon, 30 Mar 2026 19:22:51 +0100
Message-Id: <20260330182255.75241-2-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260330182255.75241-1-grondon@gmail.com>
References: <20260330182255.75241-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Replace BUG_ON() calls with graceful error handling.

For the null/uninitialized channel checks, return -EINVAL instead of
crashing the kernel. For the zero bus_address check, release the
spinlock and return -EFAULT.

BUG_ON() is deprecated as it crashes the entire kernel on assertion
failure (see Documentation/process/deprecated.rst).

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 66617e89e..48315f8cd 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -165,8 +165,8 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 	unsigned long flags;
 	struct dim_ch_state st;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
+	if (!hdm_ch || !hdm_ch->is_initialized)
+		return -EINVAL;
 
 	spin_lock_irqsave(&dim_lock, flags);
 	if (list_empty(head)) {
@@ -187,7 +187,10 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 		return -EAGAIN;
 	}
 
-	BUG_ON(mbo->bus_address == 0);
+	if (mbo->bus_address == 0) {
+		spin_unlock_irqrestore(&dim_lock, flags);
+		return -EFAULT;
+	}
 	if (!dim_enqueue_buffer(&hdm_ch->ch, mbo->bus_address, buf_size)) {
 		list_del(head->next);
 		spin_unlock_irqrestore(&dim_lock, flags);
-- 
2.33.0


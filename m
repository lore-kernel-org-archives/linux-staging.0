Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32833375D
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956788; cv=none; b=CPLeZkuXYFTAgMzTRd/LiSXmgntNL2TiDlGSSZvGR7THJPLmSUOS6JsqZwpaXYkadSENl2FhzkAsuLYnMQjQ3KVpfKrYRTjIwk6Lqj9rQVOVoJUQlHZCIUH8EZ47FcqHBO7l63dIeLyXuKlAPYIa2WrDFmIobGAFQf94pJ6sw1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956788; c=relaxed/simple;
	bh=eZraGxaGB7rjGUoHxTKNhycBWO5L1f0N+6RwLjML5KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otufbm3d8abhqldXgTjT4JpCkXWs66jug2rYmr8XKV2pvJS8lAMqSm6wlnU9ms4l+KFOu3WiPkrgexRMNPhWLCZ5qrL5FQAMgmHhdGphrx9s9iuOpWIlHn1HvZUKb+0iqBU3C8dPUco3ycieEgSv8omn8LBG4DovadiP2KCNaAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAd9SOjz; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAd9SOjz"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a137692691so29918045ad.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Jan 2026 03:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767956784; x=1768561584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXayVpLq7/epO98Ha5XVM/DDxYlSMQ8bI/HLoVZTKfQ=;
        b=hAd9SOjzYyj0q6T5+PYr5YOxOj8RZ9uWpDWZRYQILrXoJG4MccANy03qqP/chd5KAW
         vYcbz0eCH7wwBe4PzAEt1PUiwWwIFs3sUypmXidm5ixHsrxCOFAEulceRqZocUoOk8Oy
         B+jsrlIRnqfUVRBMPa80CREPo0yfIot/R4SlnXxy5LbQjN5kPW4ig8eM2lcaXIJIPbj0
         Y1XJ3ETJtoTT2XY2lPPWt1yOBU2bzrDijebd+r01dkugtD7i2g/96EKKqhr2CTKULEtq
         NREF6KOHj4/6nIY4Stde6IkKWroZRHY29lUCDbpeFkMf0596ENsTK1F5Ja5mm29XbFrL
         vRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956784; x=1768561584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXayVpLq7/epO98Ha5XVM/DDxYlSMQ8bI/HLoVZTKfQ=;
        b=t4yZMKo8aDLdHuJTBXGfs59lroz7qDPDE7lFnnxViBBzekIJKoK5POY/vkAMBquI3n
         +wTDjzolFnItsX0tiS3R4LciaH8PPmnGnoqS+nw2UqqMQ+ImrOeMDqTiBmfVbRdNLbBL
         DPpJfQpSMQ5GeeRzxzM2JEXv2SRbHGYKfeI8LCbfG9sj3O3oXB5riWRg4Bi0LPfsPA8x
         z78Vnvi3T5GdCMXsOxPQJY0RhdBRxXMP8Q5drmJtiGPmVBVLBQoN7aCUaYw1gsHDVcMx
         s8fiwdr5/2Z9g4Zp5Z3UaQRu/zPgkTX+pX4TzjtStaxVnqUaRm6Vgp+rPeC2me2Y8NXw
         V8vw==
X-Gm-Message-State: AOJu0Yz1YCX6FoNHqbnfY85Lp4dGphHyRsuizN7fJMczIoCoLZhEiB33
	xdje6SqBI2YqyF48ljV1gMCJz9KuDGc6vnWEooEGqKHik+CgZ3Q3SIU1M1/cBfOA
X-Gm-Gg: AY/fxX7dm2wI5HymEdSKyK0md3bVtXmP07FDhiSEo/B/tFY+3r41OT863j3Nn3/cZI5
	K4QmJga/YNLd+xU85B+8Hp0rv6FQXsCfS2QC05BS2F6WvvW1uNT4dDd75uvcrl9wdsf67UdoFQ1
	gI0WoVf4U8QgNKg78oO3roCHdtlAO0ifmnoOyNANV+P6kiSGmdqzFOzlj0dhNndW8mUQ9IUtv4l
	LwwPJBgX861ulNya1aQ8vy6iBA5gfuC/RrQeJUR1u/TJHQ7B0SffvKnA15N89NacgYwASekDFsA
	99Nge3bPqNC9MA5nLZtdzRfCQoCAWXmAjxlyA/vc4db1ecH5nhTY0BjuVgJzmanIujJE1NshA+T
	ZjGvrt44X0LPnHZEFPJcxPc/LFbNRSmBDkTy5MfA0wD8eS7p/wlTwCFVJbCh3TSn8/YJp+EvRgC
	DTlQJTpEDKOfb4pVInE6iDIw9icK3v790=
X-Google-Smtp-Source: AGHT+IGi9NATaqs2HY8CRUMF04psFNJUOHa8sgueeKUhwzgW/KzxadytpdLsEiM8yrGQVwu8fI+CAw==
X-Received: by 2002:a17:903:2b03:b0:2a1:325b:2cba with SMTP id d9443c01a7336-2a3ee51215fmr91719375ad.53.1767956784131;
        Fri, 09 Jan 2026 03:06:24 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47303sm102491515ad.24.2026.01.09.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:06:23 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 4/4] staging: rtl8723bs: expand multiple assignment into separate statements
Date: Fri,  9 Jan 2026 11:05:57 +0000
Message-ID: <20260109110557.16381-3-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109110557.16381-1-nayana.mariyappa@gmail.com>
References: <20260109110557.16381-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split multiple assignments in a single line into separate statements in
osdep_service.c to follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index c490de437bf1..c082a0359064 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->write = 0;
+		cbuf->read = 0;
 		cbuf->size = size;
 	}
 
-- 
2.43.0


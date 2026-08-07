Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0EC377015
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127731; cv=none; b=cxMXswrlVEbLzcxYbkELMMmbmMgqadK44k6MQGYbMrLZC1wkq+Yy1Spud/IeBcakYTkccYd97UT7wGyL0hPxAj/d0xMYRIlzI+yS23Owb01W/1RDQGPa8pqI/q3Hs+j0WBgRp86zOskZxlXAQWnFahEgITb+brM9fq2EzMvj1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127731; c=relaxed/simple;
	bh=aolz0CiZatKyYk/CfTXhIN7vFfsQB1RuyO8bvJfZhHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAjljFgCjyyiNQF762UvJQCH9Ot+3K8YTW5QbTJxLEqIPNZR96T/AXqotxXPnxE00zfJSbUOj+zyI3A2+4z5FwRaDv9Pt/liWDkDo6EaR+vlby2hbDa1OVR7Kwuchdhg1HTl7lID9Jzc5KKBf1LJXw+kbqSYYFZURd0tPku1/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oT1MhEF4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oT1MhEF4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2347115a12.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 11:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127729; x=1786732529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71FmqS/PHvl7o8NluFQ2/b2PDwnrkoEGcwVSYjd4tqw=;
        b=oT1MhEF4LpJCPBZ37BpgCjPI8AgYQ9CwqO4Y8NdAWdkoCzsZCfr0sN50svz2tDGkzT
         q9QYGM98PCw6oGXxu1fTjnB53YZK1Ek2SBJuLmfaOMNWv5SVSnTVI4rZBKP0TWlX8IfB
         wd0exfVZ9Cle9Nutpu5Eb30SJ4y2KuSIq4L9qBknEHxvvpQHS8lt2AoxrVz549DTrQns
         HEBVgajtGbDhpjZSPAcD+C5d/lrkei9c72Aza8b5J0swZdiClC4zDOU1ZUgmdax59JxV
         txxcqkJFjfQgXJgw+InzBF9IRbHy3beAYEtF5+QLBuBkaidy3PRTHMjPJ6cAVeStGI6R
         sYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127729; x=1786732529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71FmqS/PHvl7o8NluFQ2/b2PDwnrkoEGcwVSYjd4tqw=;
        b=aVKYGAej9BWP4PrNOEv14dQQT4eP3Uf0kKmGk+Ya6umXTSnLyDq+Bh0rLBtjq6E90z
         p70L+7QKo3De4nmEOAsQrMMkfI/h1vqfjwxlRpaQAHftbPjYqCM7a+C+x7dOQB/wfjBj
         2OEiDEpxtWlcKNKPepBjLVu8hOefsyhPJWchTuXlHPMZGBvsb1I6le0ZcBoRltk+o/K2
         q6k3EuWrPp2P1rVCtT4NokJ0jUks7m5eXT8+IgI8oggI/pAssXTXov5epm0svec+05hv
         Z0KMUiMuYpBFEZTgQws21ypV3n7wDggCXfdRfWJ7x7DPm/jI48ZVIHZcnZzTlHjfqQNM
         v5GQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyrrKEagdNY5JL+LMqdubxDSuqBEcIdvm9CTGdlePz7x0UTkuthdMHOenxpFFkZu1y9XA0BLE0NB6WfpN+@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfrm5xoRoeGoyLDTNrVpU7oEM/c2s9Gzo9WYlKi1eYYuysUHdM
	Ndq2IWBrd6s8vBiLEtLtBWxRFYWMqW3Y7JChc1CwIigNp2sHIhtyMCH+
X-Gm-Gg: AR+sD13dEAc35NQWDhxBGLteEmpm1D/xB5LfxmktT3EVEW0n93Uk5XDscO67YtHBhGv
	QR/VSxZoROGbX+0Xu4p/HC3qVcw6oJ7IzKpkAzMQEktAr6F0kWZeg1pnA1+i7fBn/GPypbltQ85
	R0iRRKIbB2CGu65R49UuKfOz2cO/+Dln7U9U9p+KyS192yWfHD67by87bkBhfz9pWilw8p9cH1h
	iC6c8sONLNkpFcS4hKc5QrkWcBzk/pokcsfBdYNh2HUpbOZYuvrHcm7kCuINdP2ZR5rX8uVu4E6
	ysEIYRHDUTWvwSEXznMXijn+Cl0lZF5udR5vvlvvfsqZFZJ2bsLN1/YFntZNHlC1vOlQlFM4ZWP
	G0Xd5iJMoA3CMK2YH4FsHBRtBfs/Z/1sDdRGKfKnVP4erOmhFO6mnmtWggOUnYhn36sW5FxwJKK
	sYTP1YbCPrEgVwUBSpJaoB5VPcn1nDrYTFwC/DUfws6PfUjtgqxwbYn76J7+M0K2vAf1i8iMQxn
	rCa4GYdh9C7kP7YgBcAXFw3mO4v2Q==
X-Received: by 2002:a05:6a21:6089:b0:3c4:2fe1:fa36 with SMTP id adf61e73a8af0-3cbadd74818mr15000583637.36.1786127729266;
        Fri, 07 Aug 2026 11:35:29 -0700 (PDT)
Received: from localhost ([2401:4900:1c70:5a7c:d1d2:a457:c3e3:35a1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm11483405eec.25.2026.08.07.11.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:35:28 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: error27@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH v2 1/2] staging: media: av7110: fix corrupted BER reporting in sp8870
Date: Sat,  8 Aug 2026 00:04:42 +0530
Message-ID: <20260807183443.13912-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sp8870_read_ber(), the 14-bit Bit Error Rate (BER) is assembled by
reading two I2C registers: 0xC08 (lower 6 bits) and 0xC07 (upper 8 bits).

The current implementation masks the lower bits via `tmp = ret & 0x3F;`
but subsequently overwrites `tmp` entirely when processing the upper
bits using a direct assignment (`tmp = ret << 6;`). This logical error
causes the lower 6 bits of the BER hardware metric to be silently
discarded.

Fix this by using a bitwise OR (`tmp |= ret << 6;`) to correctly merge
the MSB and LSB payloads before returning the metric to the DVB core.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c..77bebf2c7 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -401,7 +401,7 @@ static int sp8870_read_ber(struct dvb_frontend *fe, u32 *ber)
 	if (ret < 0)
 		return -EIO;
 
-	tmp = ret << 6;
+	tmp |= ret << 6;
 	if (tmp >= 0x3FFF0)
 		tmp = ~0;
 
-- 
2.55.0


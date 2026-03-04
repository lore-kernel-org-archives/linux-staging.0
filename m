Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677203CB2EB
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645752; cv=none; b=MQRwjZHxDyzb3GJeWOiVrNbB2yUd+Yw9/5q3kX9Rf7HNKKm2IlwEj/ycd1ZpryWNcP6S3sRRAmg65OFQNrZxAMS7JBrLNZeKCEHoNjFkKEMNEtlXJQEhU9iZcavfxXRbSnNoeAT5EAW2LS8S0ruwvt40qCswFiH+F8cy8HGKJng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645752; c=relaxed/simple;
	bh=ZPfxzik31T03EgSdWiRyC5YG5TXWyYF8Ds6MnhvfdYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PDU0htoKQM5L83vcP2bNFbn8WqfITBpUBszpZGPVHOsX0tP5LUx1NAlZG4evYpiy4TmoD1DEYXeN2/73dWWSf+2uOD2LHwSXQ9g01FlQ3w4wYwfZGiL6cp98Op4fXeMLD2VgPC70/pLie/lH2wBSLY+eRN6zmjnfJhsjXYJBohI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNc5pgwJ; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNc5pgwJ"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8270edc7e2eso389543b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772645750; x=1773250550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FKWt4Ue46a5Jtl3J8WxKsJ5o7nZVt2UhiVFWoT7/Ts=;
        b=SNc5pgwJJ9vwCZkoYuyriSz4yL9IZ4K4X6UwWYNt2Zr/DrNO4ikwgwxcfD8aEHXvfz
         1QSCYZDlTe+eYIe46wFDS5b157yodmQZqxnXPnFKyvdtZwrgM5FR7KGvyoA2trTraK6y
         tyofbd0OLS0Jb3YXq5PjSkyWiK8Cj8SKRTrp36dmVuSeLyyCCWvNulHLgGuqsICbUae/
         eRz3SQSINzobWU0Jx1fE/6hjlDHUFclw9db/s9GaZkbCeVNIVn297lf18Qcr/QJvpoqZ
         mKMyjTYIg/jgx+f2hq4CZQeo+upaRuFwA3UagH/S6l/drgicF9+Amk9MMFFJwFrzXJRL
         SZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772645750; x=1773250550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FKWt4Ue46a5Jtl3J8WxKsJ5o7nZVt2UhiVFWoT7/Ts=;
        b=COrKv7CDKX4wU/ZD0qHnJ1dj3vWNMMcEBIbSqnTWwl93LhaL4LmdvY2M54ZtbGvPc0
         v5mXvdIWJcmkAqGU7IxuU2OSxnZiH57Ag7mdRrXH3wTtwHB9W+ivnPq4ivgw68IlMFQU
         0geZb+SHVY/MqV3holeaJP/yERk5DVlFU8dfZ7x3FWCp5H7fYRh1y0E5LnW9ZQB9i2tS
         K2EFiP6/iCuxIMnzB9xSxXMPZBDdYZC/hryf1WSck09mATCX+BplWPtIDDueyEXeg/L/
         vwxrDeiIWPOW/lhPuLVjheUzVp1rgPIl6jrnr7QusqV3CXxj8jp15RdrnPiLRiqpaa0F
         uw+w==
X-Forwarded-Encrypted: i=1; AJvYcCWuB4qe6l0pSbZcME4UJmLLaMUCoPhJHPgyJuoklHVqF1Oi9b3NPvQMDj5eT6Mg8UTBslDjj6vtEN/6V0gM@lists.linux.dev
X-Gm-Message-State: AOJu0Yy14U5dy12Cb5SvBVnBWCHO7V9h973GXI/tQGs/l7BdXranlbOX
	Htms9aVgAOnK4DY+6+K6S47NpuWVVUOIJ4LMsLQSps9VnIiQyhaXy7gWpAqkxX1FZrs=
X-Gm-Gg: ATEYQzxPxkapn6cai/+95fFHbvgQFZnx1UQEuWtazAn5EqlKYC1jjeQ3LuJWJTHogK4
	XU4/69yZdQwsE04UvyZTh1nuLR63hy+tL0ch5zaqS+wVDRkcfpJLwSZcpiMbGxBx8eXtE7e75hc
	NrXjuUV0gYbAVKYEhsGCyhkAAMdQEWT4Pa5g+z8D6Zz3r4aatda6ydkIsadDOy3UtD53mMu7guN
	Xe6jFvBtcQetu4GbL2zMVoB00I0wRxyZ8C5ZUvveYRBLJG43ySWi5ZeYE/IE7BIvdIUSw5IIgiT
	oAG1Tv5vAGwLOGK3eU+gP1Aokq/EsoVPn9l+QdO/GQl56JuOhI8r4L6jk8GA36QE6LgTtMZa4Y4
	gRhPiUf4GRQeFU2fsTdQSYGfVY6/n3z4RwKsVGLno9f0b59XU2JUuT8/2qrCugWMWVP2otFKKVU
	m28Z5Z4Pb7DPdWT7mgOEM1emGKqtT0TlEM+Os+rYuHmJ7wVvNWb0NSrNcHA4DrspBl6QwT7LygO
	Ms9iuDabMQNvrM=
X-Received: by 2002:a17:903:38c8:b0:2ae:4cfa:7e3 with SMTP id d9443c01a7336-2ae6a9ed66bmr22732905ad.1.1772645749686;
        Wed, 04 Mar 2026 09:35:49 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4bbdec99sm136901955ad.64.2026.03.04.09.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:35:49 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 4/6] staging: sm750fb: sm750_hw_imageblit: propagate de_wait() error
Date: Wed,  4 Mar 2026 23:05:27 +0530
Message-Id: <20260304173529.192067-4-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304173529.192067-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304173529.192067-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the error from accel->de_wait() instead of returning -1.
The caller ignores the return value.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index f2fde011e7ca..7d11810864ae 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -325,15 +325,16 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	unsigned int ulBytesRemain;
 	unsigned int de_ctrl = 0;
 	unsigned char ajRemain[4];
-	int i, j;
+	int i, j, ret;
 
 	startBit &= 7; /* Just make sure the start bit is within legal range */
 	ulBytesPerScan = (width + startBit + 7) / 8;
 	ul4BytesPerScan = ulBytesPerScan & ~3;
 	ulBytesRemain = ulBytesPerScan & 3;
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	/*
 	 * 2D Source Base.
-- 
2.34.1


Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0D3C6A2F
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645742; cv=none; b=Q3yQWkAHNDw7JlfB4ihWOPQZKnwYOaaozWBk5cQYzWwTPJwRNeNAJssZ1cTqPj21pC2iXg4OPd9mGkzKxyKSTrOjV9hXEeDXbztJat1ecrUuPQdDqhVv52O4GefLgTyouV3D0rFzm/EN1R9DzU0ELn2TCuqB0/+59NqebJhGyfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645742; c=relaxed/simple;
	bh=26HnA6jr8Gpj2ARL5WF/0FOSAJ8I03Q+Uhhb0MqsB6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kKaNu7V9oePtsvMBWHLrAkMQemCSlAeFKsqq+1cbomHFQwcWouL9M8GuRAX7QE6AUpZ+GPyi/j3GO7XfphdaYKXrwh8SVSBSqNmnPF1qjnax7/Ygs1aGrHAxTriEjCKHtiH9uHsfG9oXI0qjEUm9lcBTu96QcTOHBPR+uEigNtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH23tbTV; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH23tbTV"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c73874b3ae2so43473a12.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772645741; x=1773250541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q74EyZl/rBv7dMbdQMZD34TxKD7igp3TSZElWe8rZoE=;
        b=fH23tbTVpbB+38PiCC8PzH6emfl1hCXmgh9ospXG+AzvIMOHdgUvEfkXvcpC0TtzP5
         oDIaTDIoAarTZeBPHUQX5ZX8PYC2Pdy5s3VIidNy7IQiviSf4W1eUaRw42pRB1stumwN
         UMjAlmwxAceH7ZwtakpM05Dd9nefmsBNc0mtAo6r/2vNEVF4fmIlsxDKd3iCr19cz3W5
         KHEcKavEPduK9XBwckCuU9aCjYSNgrHZoPltLwyvmEwAVtIEBnaseaYPYkaJ4U/W8B0N
         OHPYdgtnnmf6qscIk8/wkh2GzKF+c1E/9vL/1NJlKVXqBdR7xEiiGb1868slQf/NM2Ik
         7h3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772645741; x=1773250541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q74EyZl/rBv7dMbdQMZD34TxKD7igp3TSZElWe8rZoE=;
        b=JdwT6JaGBmJL6mJtLKDnQeolDulLkfZF2QvhGZtLYvO4+r8xWlUNXbp4StJLB53P4h
         wFN5JDZAldqqSKntL7ivD7fqOM7usYpmUK0QGxFwJ7l/J4yT/NnBW9ibbPxlxQ08admA
         uKoGEtsxqbmA4wSZ64+Gfn46NNZ0w5j2soQ4GJcmyF33o97Rx1PfnG8EBHsa6MRag9QG
         JuQePCVJ64ZV9XHXTyt7arH57ktWFkDngHLl5hv4fH3oD9jW5uAT/cQotj5871ePUekb
         7MZ8GTAQhp0tu9YpVZDreqBR+o79qaj9CvKDceDVgUAoWK/70qELzP75J+cdeS/qRy+M
         dwgA==
X-Forwarded-Encrypted: i=1; AJvYcCUIUsW+Xf1fLbmr0k1WQgkUStAe7z7t7/AMNgHpCC1dKCdeFHMkqe+hZgOtXcd5pll3EOrFFtUfPX26E2V2@lists.linux.dev
X-Gm-Message-State: AOJu0YyprHuC3xJaMAN+nk0vtnn8WuvIIDrf4T0yydgyP1S0YgGSfviV
	EjYlDWl1bGHoBa2Mho7WznVupjkeWin/XwOmeTxMoLcLGO0cbG0sdDRn
X-Gm-Gg: ATEYQzz1yF4bbHmE149E/l3/8x1HA3fzyoFwwI4tioUwqUAqOAAzAMKgzaX/H5T81HD
	deDy8yLfOxhl5tjxA3kghd72X45kxDTNiPcXVo2M3PqBTQcmq+FMPkANF3E/ruw5G2qC7dg3KOh
	wrhiVYbRpWUETPNTgVdc2LtEDC1OVUA3E9rVEeOetBhY+SwMGbfuPvmI+YQ8D1d1El15Mq9lKSv
	Ll3J0B3xQQmIhGTfwfOr7u8ik5v9Wewdf4Fcwu8OzSEQW5h8KCoDS8fleUqNIE9nx5AYRdSPKOt
	RbxFitMSYdcPtt1aag1V0pbgNSxa9cfGVii/nxi27J1ByF+/f9IoVF/8pmXgxT6Q3GEK8xsGl+V
	1Mlmhox31H6fegImTqcQKtIhokHImYRd1XzgUWtvr6BNUcpvOmLtWU6+FPJEU0AUB5nPu22Jyml
	UDC36gC2lj4MW6yVntfeMCBBupmBbSQDSRyHxEweO1EYiBmfRHbVQfkYlxKiTxkaKtV/T3wx/9X
	4ilJS+a+kjk+6U=
X-Received: by 2002:a17:903:2443:b0:2ae:5127:3d55 with SMTP id d9443c01a7336-2ae6ab18e06mr18985915ad.5.1772645740630;
        Wed, 04 Mar 2026 09:35:40 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4bbdec99sm136901955ad.64.2026.03.04.09.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:35:40 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 2/6] staging: sm750fb: sm750_hw_fillrect: propagate de_wait() error
Date: Wed,  4 Mar 2026 23:05:25 +0530
Message-Id: <20260304173529.192067-2-officialsohamkute@gmail.com>
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
The caller treats all non-zero return values as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b24a..1bd0502db039 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -90,14 +90,12 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 color, u32 rop)
 {
 	u32 de_ctrl;
+	int ret;
 
-	if (accel->de_wait() != 0) {
-		/*
-		 * int time wait and always busy,seems hardware
-		 * got something error
-		 */
+	ret = accel->de_wait();
+	if (ret) {
 		pr_debug("De engine always busy\n");
-		return -1;
+		return ret;
 	}
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
-- 
2.34.1


Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343B3258CDC
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397816; cv=none; b=KHLUuikcvMtZoB2VuJr5U6HpVGVxoOG6QqAQLUzdY88UTNapAJFbz0aqHCICTahEKWZLNxrxHmN1ihm5srOomCQLDUmemUD9apgd54RxzTqmp4g5F5nch4Rk1oWjSBaoAUMw13S4aMQE+JEdzTpXfYxh0RSCg9ZYWMHK6tPRUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397816; c=relaxed/simple;
	bh=NYidWFhDgt/4rQVlgu/c+IOpo3PHLcdSChCn6MGsfy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzpX3UtAUxh8re9UYbmI+YfnBhOfgtK7t4lbtRWh3omtpxUaC6MGvCekqTiSZfbNAWCf2HlRocPRlrJMgcI3rK2GhoPn/mwNkItUikmCItcRho2SBvvwiKqz1jM3rco8tGqNILpIz2//YZwhI+OS+p8sRARLASl/St/6r/aAXHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFM7FmCO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFM7FmCO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-251ace3e7caso36092665ad.2
        for <linux-staging@lists.linux.dev>; Mon, 08 Sep 2025 23:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757397814; x=1758002614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybb16mUwQT+FBVaymvV+gG0Hd0qAFn+Ahs5rmcoHhyc=;
        b=hFM7FmCOt1LW06+jlgVbH4sEaSd/F8FJ/rIXqKH80P9jy4jdpC2e9gq4Cd9xjtt/J5
         KgL10Q/nHd8bunWpkMMNQ/PeHXL1xcI4eVUkIkrJEztsEnbOalEDvS06tYr/6Kiw2Hya
         X9/DIRDGaqTlN+rhCiOq0StGE1oSuFMHaaE0nEcqJWzWm1gQlYnc55XgU5VUZVvcbS1t
         XMN4xVGSvi6i+zRqLLxNWKXeLRP08tNhj4sxn/Vo3qTOeV/gFZOmlcB9qk9sbzEmv9vZ
         eXx344dck1LByRE1+pQvNXNKZBSKcj2XmcA70tO1pDmalR3YlAKvvKTpUy4LxCx6QwYA
         Vk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757397814; x=1758002614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybb16mUwQT+FBVaymvV+gG0Hd0qAFn+Ahs5rmcoHhyc=;
        b=s8OiJ45opD831lrucFSIjpgwW6pPhQLARVSCkXNv3lB6+OBm4Ucsa8Lv96OsYB2uNj
         vc84UCzxauwRm8K/urrbtREkDlzPO8giRdTceDQgDbovOFtMTtbmNHKiUQ1FKTrGzrYq
         7IHnEbfIQW++ZYqSUyaQa48dhQ0JNBr1fuGs+nifMD1B4cF2UdY4Nfm2SThk3+AA+FP1
         CWqTIcvdHebR2oa+d57vurQJyt8lP3I54b1EhsR56A7plO5f9YePj04C1ABLqBXRMi1z
         ORHFj6xUin2lYNTp5UIkY+StxoSGkf7Irhk7K7jkszLtINqBf7OHHRbQvDQvuDriAQ/2
         OkvA==
X-Forwarded-Encrypted: i=1; AJvYcCX7BK9PJrJVPuxXNYrtg6BDghKmFfDgztqbXF3Bzf+7X3NiH+DFtR7xrNwCwa/nzy5pJpVgN6G/P6PeJ4XM@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzq5JnvaaJt7SXCypjfeGyMSuhFqSqUgc1rzuUfr7lYw2tJI4o
	OUZr7abEnHb6jp34F9iRllZsPfDjAMvJByXgBk1ZlRaBuAUSN0Man/6R
X-Gm-Gg: ASbGncsb1ioVnOCQXRwQgrtcwr3LeP1gzl5lMMuVU3/aPM2hLL/Yy0VqFPyIVMZZd7p
	nFqwx3Zkcl8YlLgz/msI858jpzChsPqdUCzp6o89J13H1sqhaWtl1XP1lMdrJCqkhKFKrz54TUg
	yXcJXETLI/iADPxWW1mRWLA2/tpjHvyZ2WmEVuh6qP2jWn/md6sfsY9jRhmaTyDSojEJWDWNjbY
	6TxEXGYddHDV69n/PMx8jl8e9qeNT2SlSP6iHfyJvQnXUvUUI5HWzzBEZDzVgJrEvbhBW4gDyQB
	Hhpij3K51AqF0WAkw6JwkgNn0I9rCqjc1cqCl5bB6n8bf0bHM4d2qDK8EQ4SqgNHEiykJAYoa8A
	FlnrrAabTbyyuwgmHAR3qQm09SC2dEs6dK8HJnXhUF4VNRNcS74olHBAz75bjzkVQMvm3jxxgAg
	QsP9oHjXNVpdeLsRWuIiL+wI0=
X-Google-Smtp-Source: AGHT+IEWUWYh4uKLh52T8RIw5gvJl4jnAS8UqIpPPCvXwtb088lnW3/RvdIz0c1aBVLTnnqXeAra+A==
X-Received: by 2002:a17:903:1111:b0:251:3d1c:81f4 with SMTP id d9443c01a7336-25173bbbab1mr171289945ad.54.1757397814401;
        Mon, 08 Sep 2025 23:03:34 -0700 (PDT)
Received: from klmny09 (n058152109064.netvigator.com. [58.152.109.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903724b94sm298665455ad.35.2025.09.08.23.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 23:03:34 -0700 (PDT)
From: Yiming Qian <qianym1996@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	qianym1996@gmail.com,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Subject: [PATCH v2 1/2] staging: sm750fb: remove unnecessary volatile qualifiers
Date: Tue,  9 Sep 2025 14:01:29 +0800
Message-ID: <20250909060130.12919-2-qianym1996@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909060130.12919-1-qianym1996@gmail.com>
References: <aL5tjv_2YkvHPs5C@stanley.mountain>
 <20250909060130.12919-1-qianym1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of 'volatile' for memory-mapped I/O pointers is discouraged
in the Linux kernel as per
Documentation/process/volatile-considered-harmful.rst.

This patch removes the unnecessary 'volatile' qualifiers from the
lynx_accel struct members, improving code quality and maintainability.

Signed-off-by: Yiming Qian <qianym1996@gmail.com>
---
 drivers/staging/sm750fb/sm750.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d7f40efe3..41f1fb390 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -50,9 +50,9 @@ struct init_status {
 
 struct lynx_accel {
 	/* base virtual address of DPR registers */
-	volatile unsigned char __iomem *dprBase;
+	unsigned char __iomem *dprBase;
 	/* base virtual address of de data port */
-	volatile unsigned char __iomem *dpPortBase;
+	unsigned char __iomem *dpPortBase;
 
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
@@ -128,7 +128,7 @@ struct lynx_cursor {
 	char __iomem *vstart;
 	int offset;
 	/* mmio addr of hw cursor */
-	volatile char __iomem *mmio;
+	char __iomem *mmio;
 };
 
 struct lynxfb_crtc {
-- 
2.51.0


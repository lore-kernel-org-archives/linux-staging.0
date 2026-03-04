Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0023C6A36
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645746; cv=none; b=XHsSNWr0EB8W+JY5KfEVYBNkIkHjFYBUnXBeJHzHWM5O+i2kXn0cBkr6zEqwDGHI5TKxRYbHUCQC4InK0N41xchGuuvF75U46hAFpCAI376tCN+nGCkt8Eoh4jmUrzC2McwoVdw1hQXYsRCWfY4F9ul0i26fpsRIpSycvsk8lng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645746; c=relaxed/simple;
	bh=eaqazZEu6AIkOZfqaVPRfpOH5D/Sw2xabAJId3jlXWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cAXF9Bd0+VkBl5NgpiYvesichcOSbVChp6llbVt8P40seUIYvVomNCnsuCnRgahuczxX5Lk6K75i1ytnNgMyMQyOAjzSZRPgu1fX6On8E8iCCeowKRk+x4y5m5SIcAd+u0iqQBpbhazZ3L0UWwwIrXVfNwR2fM0LnQ9hE4RU7uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5bvjH5O; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5bvjH5O"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a3e79fe2b8so8705835ad.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772645745; x=1773250545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7JS5lz1a9Kx2ju5Yxda3ptoEB7aeLh91gAm/wQ+ud4=;
        b=c5bvjH5ORzjms8gsBFTMf6pBHcUeJhk4Ni4lZfZYF4p60HoQctx+ZopJiVB7sRHUXr
         dThwarK1s7XIODUMJ67H/ed5PXc4DFQkjUhqpaUrf+GSo9QwJ21U3SfVwElbVxLuH3wT
         wl51+GBTcNRvcFVP+GRCixJq49dxJJNW8PViOfXBu3ONsuLwp/QKs2WLfPY2Do2slUPs
         0btDIZf7LZFQQsU6LL4Ag6INMpEzQhTBWrxNP9k7CaH+a3j2lmbs8DkgMNHxsNqLokNh
         LcY3UgOu9tdK0xv6/vMyxFUFgkOt+UJGbmcSdcVl3hfzmQWCla/ADLFIuRQLc3vZKfCD
         iKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772645745; x=1773250545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7JS5lz1a9Kx2ju5Yxda3ptoEB7aeLh91gAm/wQ+ud4=;
        b=US67alxg6vaERghdCBaNo3BseGAq5XvhbvCfptBNOwNa1P/SPoifA3NT0zgyPUWffF
         rkcF5oOr+DfAFZEdJUuYIVmMN6HbpHGAbPl7RbBo4Yd+HdXgfFWmhU7EtgNb8gHgUM0G
         3/9B6ll9nNPItc88sImerqQ/6vXAiHQ7rFfxcHZeNEtef4RHad+igGI76MM22tEPbloH
         Gz9Q0SOxoHMhZQR9euxmCqTwHGchNNqTo7LLL6olYJi4k7SS1zcY24gJLJ0BU7eAjDkp
         AXWWHAAjGfrgqYZlodCxV6+q/cFlNJBJi8nxFez/HJhLI/I0Rv9fWBs4bHYriP4wqlgN
         XU/A==
X-Forwarded-Encrypted: i=1; AJvYcCWQi5atqz24J1O3Ty7fVV0k3X7vUU37glNesGcOSiGXzgPv7zKs4UEPK40ayEhzFYjCUTiStTKzJ0HlS10n@lists.linux.dev
X-Gm-Message-State: AOJu0YzHY6Xo+fnHMKryOzzXZdgbaUlULuKLEhGW/B0dDPlDak005Vt/
	q62K8dyNgUCA7TemOiXalZuXeRR8x5lMHgxKsJN3L2Zh/YLOYV1nUkfx
X-Gm-Gg: ATEYQzx8MA8Ev7GWZB+zcDAEq0xtXxYKjrG+Nq8DNXnDdLjRWWPoAv5tXb0lKTnMDa6
	a9Z1scgzV2M1MLOlaiBsMaBSUJ9YI+DYz1EywHrUfmiBsCz8lg5DpJUdDin95Eiz3FrnQQFZypb
	tP4G+Q54V6JUREH+6s7fsWmbTHVZDjGxtWYlz5b6nLI4kbC4JgqytKsnLrL02VN3DaDt4Gk7ilA
	gDxH9EkQWGm3yiEEFnpGnAoystjmMU8kaUx3KBfiqX8pCDvlu7PcDVAUUEINweu1HBskLytnRvP
	3+PTyVavSz/Up5Hb7NM9mQj3td8en0G8NsGOKQyPbkCcQQTZkBkj8FgaotszdhHDbCDiZHTfjFJ
	gtfg55f+3iMpAWuBn0wapgH5U4tEOqM0p6ARpKnx9s8/Wokt5MJ82h2RDpaMb7t+zWajGRwVYrF
	5AKBBBdwJK4TREu59B3B0vZw28afFIEWqBDvntbWLx0wlbM7tGZDEhPFTLABhRmkpSj1nmJrB/f
	zV7crvxMleTiK8=
X-Received: by 2002:a17:903:2c47:b0:2ae:3c43:b9ef with SMTP id d9443c01a7336-2ae6a9daa93mr17831215ad.2.1772645745110;
        Wed, 04 Mar 2026 09:35:45 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4bbdec99sm136901955ad.64.2026.03.04.09.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:35:44 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 3/6] staging: sm750fb: sm750_hw_copyarea: propagate de_wait() error
Date: Wed,  4 Mar 2026 23:05:26 +0530
Message-Id: <20260304173529.192067-3-officialsohamkute@gmail.com>
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
 drivers/staging/sm750fb/sm750_accel.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 1bd0502db039..f2fde011e7ca 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -152,6 +152,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int rop2)
 {
 	unsigned int nDirection, de_ctrl;
+	int ret;
 
 	nDirection = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
@@ -261,8 +262,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		   DE_WINDOW_WIDTH_DST_MASK) |
 		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	write_dpr(accel, DE_SOURCE,
 		  ((sx << DE_SOURCE_X_K1_SHIFT) & DE_SOURCE_X_K1_MASK) |
-- 
2.34.1


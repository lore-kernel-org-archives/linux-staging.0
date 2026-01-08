Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF13D4126
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865654; cv=none; b=W2cBhhqEL7YUsOEbKHyMy/66pceATHNhWr7G8keM0y/vNCwsFjN0gN1zAsmjdbwYy+VqyBBtRcBfX3zQsxT+UnDwxgWisYn1NmBYM83fO+ZwQgimldvSDgNHe1aTqf8O55X3U6PRKta2sAHsZjWWtdIBgmVUp3DvxwrXGkNN3ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865654; c=relaxed/simple;
	bh=dssYB9ZiBeg3VZkmmPibDzS/sUjaPn78Ja8YTcImm8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8Oo3au7NGSkKa0ArAZQl8KpAq7fg7zYCdZ0zNWJQWsCgPfxq8/mpP00InzrDm8sIaaLnRPldHUJZh132nIovctiFNnvMEJwATJ94j5FaHNuNf0O2q2frW//hfbfxTWV/dZsAB8SBsnK/37VNouTu/wy4K1wR9ejANV39FMUFRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y03Vk/yI; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y03Vk/yI"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ade456b6abso2028066b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 01:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767865642; x=1768470442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHueD//8AAJamdtTx3KncyHUFlVGKxTPD0kTSQsmSD0=;
        b=Y03Vk/yI0gqhGUNDePfnB8VCpaGyguN2EfH6hgZYX9k46L/YfGGFov2TPmxTDLeW+B
         txFHKnFI+93KxN/mrwXH/0k9EvQaWvQxQKBuSACUpRO193lPZpT2XTa1b+kiJ9Gpx0vc
         GuRqirSBOp4t15sLaqKhZbwN/KvOdtxhaeif68+hejXyZUMoPtJtXH3cqR3rUEJZAIZh
         CYYqji52t/KuHYUHjl99HahsBP8EEEnFR1iRo7aGkM/9BfFfr3IYG6G940aA/Fkmdsll
         g3SukTfAR42n39dpKy3Xq3Jfu/T0ziJ9ps/41lzMfC/ZwpjzAprPhnjeTaF2gRwrI4tr
         6YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865642; x=1768470442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHueD//8AAJamdtTx3KncyHUFlVGKxTPD0kTSQsmSD0=;
        b=p3oqxgBm6AAHZLOJpYVH+GK/P1FHrg7LqklYMU0yF2bQMvlIoIo/l6qJzkLWlk9dbh
         Y0tZfXEqXIIp1O/Zky3RB/YOgXIPlet34WcZUQJ+EKnQ7Pu9/3MT3jmpDhqLzhS9lFXl
         k28uq8GQVVPIkTXtlnnhDT2miNGZ9wZP4zMKfOJCRaJAeXJxIhKK66gFYOfzQW/R/zZD
         Qb3sbGhDrLbw+USPddJzkWWSmPPtFIC9bRaI5hwJaB+iJzKrAucRXJ+dZPYatmt2hvZF
         Yem3p454Qwbs05QRYqZBDTNTTV/krfReDdacPjVkaZhOXbZBJrqamqPGeHckhQaxfArI
         YFbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWABMocSGiyv1qhoAhJyjQ4yVPkW4G3oaehstr2gP31chKvrNREMpn31gg6kJhwRd8a7VXR8D8QcQEQc/59@lists.linux.dev
X-Gm-Message-State: AOJu0YwNAvYeerHuUnPb7b7BDG/PbrT2h3UguP67t5cbrzNsAlA4Grw7
	9o/5m3PjZyvPCvVePZt06c1myXe3l/TIPrnG8vzw54TcNlzz+1fTLJpL
X-Gm-Gg: AY/fxX77eO6WoK1aNFtH9Wpnb8dNe69EORK0VZjJGAUK/Co0D10WEaXV6NNz8itxQiO
	f371iWtKd0l5ZbEBjlOJ+NpWosPd37G5Of0Jne86FhD6L40o3V3MZ+4aJ9VNeA4Qjvhkakv1DUP
	0uqcXrTifVnXaC+5uFQW7A5fZrfXn0/YX6Vl34ek8enlKpNKyEmNt0s0l95q7bVA1EHKNwx5kLB
	uaQxoD8a2bIoD9KV5u/dA9N5DpRt4JACx18535ZDXKrhZq8i3Ahp0j1Nx1jyu+Xi2wJBtIXftWN
	iGCAmsZP1hiCjpaf8+3LGzcMHvqavuU6IpWGr2b0qWJA0Stno26GIfbJH9ecmI0qmnpNalE66m8
	79NeWrx2C7JJJka9PxIQlMxl4eUF0NvOQ9iq4MBAG9j+0jv3T/mV6jemLsJRQQGLM6BbMG0XGAQ
	VeD7ktElaGeoYAUIE4OP0qiIkr4hRJcrt/hBMBa7rMxv2n6LyWQsIbSuivn8b6kXQe7IO79w==
X-Google-Smtp-Source: AGHT+IEbE+jBmq+j0BRN5nADLvU8jxL1ZMAc9aObMxYhpM+qu+5ZyALvccqrtar+8Lm5985P6axv3Q==
X-Received: by 2002:a05:6a20:9184:b0:34f:2f38:cad9 with SMTP id adf61e73a8af0-3898f976c60mr5324357637.53.1767865641705;
        Thu, 08 Jan 2026 01:47:21 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88c2sm73602135ad.79.2026.01.08.01.47.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 01:47:20 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chaitanyamishra.ai@gmail.com
Subject: [PATCH] staging: fbtft: align tinylcd write_reg args
Date: Thu,  8 Jan 2026 15:17:09 +0530
Message-ID: <20260108094709.92561-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch reports a misaligned continuation line in the

fb_tinylcd init_display() write_reg() gamma table. Align the

continuation line with the open parenthesis to match kernel style.

No functional change.

Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..60cda57bcb33 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	udelay(250);
-- 
2.50.1 (Apple Git-155)


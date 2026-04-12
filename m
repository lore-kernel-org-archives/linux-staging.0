Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC2D351C1C
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776015212; cv=none; b=MJT3pc5QCPDNpl5ELDXOK6jIw9sw7nawPsbdZz4FSWyEXSBg8sv/bAiwMDvAj6zVfPAK9yy7fq3TBvFI9ZkbK9/yt1ZCgddFvsMbLp6lbMrw+3xj0f8yAGmnelG9SBIahLYmYI4W4ElYoJGcAv7REUtzDkk9e+BDYgCm88Dl84M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776015212; c=relaxed/simple;
	bh=EckK7HKSoogmAQ4Aqmi+PsMjy4ZRkQDzoh2xQMPmW5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYcxXzTZUw6JYMh3Ip+V0szRtizGPK1LWH/Lfjo1fDLtH0RWBa4hVYEwmAAaSNuSw6vD47pkQWuJLidlw4gzmx0KjE8hRMeNIdR2b47W7tGiK3yQz42NqVv1tM4ZwePuvohLXRa2UtKM3Zk2zFdlBLxi9F5c7grjvlSNNKs3kts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg4tydsh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg4tydsh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d70b3e159so234963f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776015209; x=1776620009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SbvXgjGPphhAE2I9ElLsnXiA+UjDwBVBpN1/DptNsY=;
        b=Sg4tydshqYKBl1/4GV+wl3haWzZ+ow1KwHOcY+xkdESvotSgLdeZTWTrWjMJnOSTCN
         x31qhoJEJBvXDRgJg5hVnhFTFPspShUiOAg1V329AojDiqcyJV2iGSXhqO5fGXdc57qI
         pOwufy18EdKI2zZ6XLYL/g0yT64aWamyWhhjk3JIU+/PdcxwYF1H/DyMtAJRBAbiBnoJ
         Bqd2ymoVTrfqKDWOjcsJ857TEkcbniUWJtpAa85znk9XogEcw5qlyNxDEJgZl/Jr15nB
         yNIQvTyYwkjwPDeT8xiunvvCk1pUFFMDTGHwVQ1a+IXZFtYC6v8JKt3NNPm/zOTwqvoa
         yK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776015209; x=1776620009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SbvXgjGPphhAE2I9ElLsnXiA+UjDwBVBpN1/DptNsY=;
        b=AzUub653Ngy9NFW7/W1mq1ud+FBPh12AoKg2D8mdMAGiP3S/M+AR1lGkMs3f9Sjb0l
         lNJoL/scsD6bPUUfTEoDeMPEPxt+d7F1z0XdP3IzEbnp4THc2IvVtXD3GnG1TkyTXzhY
         5VW5bS5rpU4a3zWRD/D0pLTdGWl/kAv3aBIpZ7EqP/4CHH40bXR1s7dEgmxXrjeB4xEz
         4I9lgqTBHU2QPCBQ3tXU7Ni7ILU2jJVTSiX7m9vh6n49V4/mAOe3M9Dh4wvBTjAI0Dmj
         tQJn5gmxqSjw65fYB0DEZvgF88E+FpKPe1BJE2qRtnDMjbnhJ+cLHlia3kGznF/TrlNS
         JwNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SCJO/vT9IGBVbkre0xv0KopVJHSGo9AWoP+zC/qLQ2pfdFQOz+eQg/E7yWDcc9SJeRKY8qg1CrYuR0DUB@lists.linux.dev
X-Gm-Message-State: AOJu0YwldwgYWNlHYIM13EZW06so0V9NSJX7mq+yfFpcNcggiFIu01zK
	F/TFmaC5s3GO6+NmxatMQmKj5jQwT63QbsSj2Bw08+n8aScEYEDvnxto
X-Gm-Gg: AeBDievIMcwRwG6KzDgDJ+3G7MWNA1yflJSsc12LhpWeaFDCpd+5aCv9DZQPUux7n7p
	it1vW0+D/COLUArlpOcwvLbppDhEVTTSiBlEStyqdrWaZU/XfAOhUle7nwqE1irInA5UACLUbvj
	ENNBT/+emWgv9ExoOndnQLUDTWhW8PqdJ8XShRw5ZG2vDN8yMkUJi8/CH4Cc5NH/P9VT1PnxCr/
	nyVI8ehMyPpYbV8NG+HJLJmVY/qorlRQChUuYz8TeVOWa0BNiq2gpy7PbeVt17nA4lKI9a48fzd
	NevbwXVgmoln2mq3JpxW5LxsCWAdwBRN57DG2YMYKhJzil7aAddwfiZS9AtThEAjB9hCuJPldzZ
	JWJSicMSw8hcbMF4Ok5YIjSV5dEyXIohMqFZOCG6jFEvWJjUpxbqHlDqUwKvdHb1BCoCOrm+3b5
	3TFMeFAWZb82VXEXaduLvN4oKIjcNPq18=
X-Received: by 2002:a05:6000:25c4:b0:43d:4a74:8ec7 with SMTP id ffacd0b85a97d-43d64286af4mr15611203f8f.20.1776015209362;
        Sun, 12 Apr 2026 10:33:29 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6c0:2682::3d6:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d76eeb2d1sm5499983f8f.22.2026.04.12.10.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:33:29 -0700 (PDT)
From: Baker <mzndmzn@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baker <mzndmzn@gmail.com>
Subject: [PATCH v3] staging: fbtft: replace empty macro args with identity converter
Date: Sun, 12 Apr 2026 12:33:17 -0500
Message-ID: <20260412173317.3329-2-mzndmzn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260412173317.3329-1-mzndmzn@gmail.com>
References: <20260412173317.3329-1-mzndmzn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The define_fbtft_write_reg macro calls 'modifier' as a function.
Passing an empty token as modifier is undefined behavior in C for
fixed-arity macros. Introduce fbtft_no_conv() as an identity
function to replace the empty args in the no-conversion cases.

Signed-off-by: Baker <mzndmzn@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..7f3fd30576ab 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -11,6 +11,8 @@
  *
  *****************************************************************************/
 
+#define fbtft_no_conv(x) (x)
+
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
 {                                                                             \
@@ -62,9 +64,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_no_conv)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_no_conv)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.47.3


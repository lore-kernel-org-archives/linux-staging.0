Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE34E1E3DEB
	for <linux-staging@lists.linux.dev>; Mon, 20 Jan 2025 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384778; cv=none; b=qM1Y7AgTaw9hMCTgWgELlRTvX2N2DCY8AqhcM+Gf+1kssfpA3J+HdWV6dUz8cd3QvHr1SqtOQb0QIivxKfOKCsi+H3eGyUsAFZeeuQWYJ66aXwdeLIqLIgpFtPgHSTknpFHJStH1Dq+q2yPDdhpFoU49d7j6PkO1ae+TLAxofvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384778; c=relaxed/simple;
	bh=QDc8x9r37GU/iPsqZdSzA4IMotb1DbSARr1kdyfx6wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WoYHRnijen9OSBvntyvoAKLBCd5/ZIt4astQcuqv9AU09IoBUFzOc3tOYha2EEtq7bYrWIQtRVlexlPV9anSzK3gufgPLfky4fUQrN9tNt1MSuZcgqeO5XIuOeSbHPTCAT6DsBPUhMnHv9TXKyzJdjibnQk+LyE4xPjPHXZxUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBpt3veY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBpt3veY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436281c8a38so32614005e9.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Jan 2025 06:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737384775; x=1737989575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=luZW0ROky4WuRwlQ5C5hlO70LT6nQT/pOM86+71SSCc=;
        b=MBpt3veYYKuiBtGr6jm8dQJa5f46vHuzTWXpARRArpGXb9XtwaPpxSxmUr345s3Nbm
         B+wgmYXDOy+DNqsp3lJGGKbgJ7tnSxP5eIr4zL6U4e4eNiDGfswB/5wuNfx4sBA9OM5M
         J2oYztRvzmYEw2bhwoa0pVKcYiIAKCqlQb3LjPmlJZSL9aS/qD3fPaziLHoWX27wxd1B
         h/XXVmYOidaS0fvcwAQKXg2Ntp6iUOaBPoePn4hAIr39G4ap2DVdBJ0njz6AzpxAF13P
         8SH748w/qzjG7sQQHzhQn9KMnW9+UcVwRModyrdROOuu9tf8rY0RWNYmU//s+Db49AsN
         LTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737384775; x=1737989575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luZW0ROky4WuRwlQ5C5hlO70LT6nQT/pOM86+71SSCc=;
        b=Bb7S3wXXbQ+7svwgWHmCQjFFQZFNz40e9/2nmqMiager2yNiHPzbEjxWVfpV+MaImz
         6kUGwPMU808EopenW7blXX6ozhT8veh50uqGEyDgwePSKGnHrwd+GVF/3sWWl+yvbag0
         04uaiawgFeZXllrkV0YyYJZhqUPxtMsvzyE5ZTpN8trEQJDzGIfGrqnPbWRgCVbR2K5u
         lk39DHtTH6Iy5txNqRKgeMRKhBsfcIzL4owbk70v41b9WPF2rr5pQlVKu4OxDswK0020
         dX7Z6G3lCv/TF9jkYPLwuFu9VzAKJUbUY5F8oLheHeTXzWEoK4TCfSRSlG2iC4q3g5KG
         SZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVog1KtDVGQiGajY/gRzDb5pUqOtf3YX6jz8IPwVw7K2rJWXDwnfOL5yO9zu7lnrzJwhw209AVgqKzwJpZ8@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5aBkpGufyUwaJ58s5vEdCFCf6FT1qwjvn8UL6jOLf6ZzzJXQc
	D8I6oYYJPRpdqb07v5/Szh6IRnPaTEBqPnjmOIwomvaGPpGm8aLE
X-Gm-Gg: ASbGncvGyjfA3vli/osxUJ5jED7Y+cONOavCvi4w1uCRonKx59JIKeueqbma8FnSxfP
	m88yTuB4OcHT1528OZyRwW/pbxrI+bHmJnqsgW/xgu8DmI5wqm/xmA6gprf1iNGfBV0vVuIVvQG
	gta2q2pxnV+rLkYcdNoRtEH7XJQoQWvkUWjX4tFvyYRl+LWzVi8+qLRzgQRgW3FzLqHrmPJ37bl
	hnzT59Gjpx20Dj7w+nERjza3LhRzK4BvwlPJiNgvkR/Fa2gtY66dG0U4yivymor2Ao0o9Ttepf5
	EQ+E0lgUMXf2/fUDGovrUSuPpIVIvNYZWE8ZnAWu
X-Google-Smtp-Source: AGHT+IFCNOU0S2uUlzM7p8bBbP2OVjzPxPn0kPkEMd4xPgltgn7EOZwMgGDQJm71NLT8Lg5hVF1fig==
X-Received: by 2002:a05:600c:4ece:b0:434:f609:1afa with SMTP id 5b1f17b1804b1-438913c6787mr123435635e9.4.1737384773263;
        Mon, 20 Jan 2025 06:52:53 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275562sm10925841f8f.66.2025.01.20.06.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:52:52 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] staging: gpib: Use min for calculating transfer length
Date: Mon, 20 Jan 2025 15:50:30 +0100
Message-ID: <20250120145030.29684-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the accel read and write functions the transfer length
was being calculated by an if statement setting it to
the lesser of the remaining bytes to read/write and the
fifo size.

Replace both instances with min() which is clearer and
more compact.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202501182153.qHfL4Fbc-lkp@intel.com/
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 3f4f95b7fe34..0ba592dc9849 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -66,10 +66,7 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 		int j;
 		int count;
 
-		if (num_fifo_bytes - i < agilent_82350b_fifo_size)
-			block_size = num_fifo_bytes - i;
-		else
-			block_size = agilent_82350b_fifo_size;
+		block_size = min(num_fifo_bytes - i, agilent_82350b_fifo_size);
 		set_transfer_counter(a_priv, block_size);
 		writeb(ENABLE_TI_TO_SRAM | DIRECTION_GPIB_TO_HOST,
 		       a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
@@ -200,10 +197,7 @@ int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size_t leng
 	for (i = 1; i < fifotransferlength;) {
 		clear_bit(WRITE_READY_BN, &tms_priv->state);
 
-		if (fifotransferlength - i < agilent_82350b_fifo_size)
-			block_size = fifotransferlength - i;
-		else
-			block_size = agilent_82350b_fifo_size;
+		block_size = min(fifotransferlength - i, agilent_82350b_fifo_size);
 		set_transfer_counter(a_priv, block_size);
 		for (j = 0; j < block_size; ++j, ++i) {
 			// load data into board's sram
-- 
2.47.1


Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BE3603DD
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 20:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780431279; cv=none; b=Ij6ra2JAMY70m9DugIkOkZgdA54aF0T/iYWKVajnkG6dnITR3X6UVJJYBXkLMOpEQz9Pbmov6eZm2eNf01SwiQTgH+tzBb1kJb9JmbI5JgFZwZPRYvw/WB4g4DNxC1wduhdWOcI/Ri1hn79HaNFlaOm9xlPsLJLuTJVzcQx5zaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780431279; c=relaxed/simple;
	bh=TKcUV19ReBkomlOIaTwg1EwLtfYv/SXP8hjqtC98/NE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BjKspzSt6mR/UhnP6Owec83MXNWSgSH3WNovKH+mpR6+99bQsTNKaixmImUOOBqP76BibzOWZQijCn6Om7Rn9+FYpPq5VQajmQ2lqvFhkguFnMNCWFR6gNWHhuM3z+FpfcQvMN/Kqmz0pD0gAtTiAQrmdbSlHH0UNFDU9QnQToA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hD7fHjZ3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hD7fHjZ3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so5277815e9.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780431276; x=1781036076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ULUwZVNwHMVsY07U5LlxchyI/5Ac8i6SfhG87PTbrus=;
        b=hD7fHjZ34oMjc5sV2HwQbsIr4F1gWcYDJrcl9VifaH8ePk0zvbbkNHAZaHqo5k86ij
         THFT51ygxZV5couwXytPpvy9f9s1EwrUbEwmw9K4XghkESNtFrZGS0HuX0CgfXLwAa0c
         7wp3VAzsIigtH/7DpdLERUpQuNcP5lnQ0PMIDkNQNFsVKaa8RxtGzkLfJ28bH1/vpuoR
         QrtEt0xmaQYlTkzz8TA+XgrN+04sXuxD49MrupvRMfWIYTa9wdSOZ50RVsBUHZSpeVD1
         Afd6fujsQ0nuWM3lhmc5TWxA9ziF6CE/iImVtLyOnEJC0H/GyXDHG+FiS5BVxtKP6HZx
         A2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780431276; x=1781036076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULUwZVNwHMVsY07U5LlxchyI/5Ac8i6SfhG87PTbrus=;
        b=SAGU+Qdp/c9YghxgQJXyhG//KP5u6o+FHxbRk8fxmRShWa0dOk7YHFMxi21BjQxhxA
         ZoGfR3zVbrjjhzDA4lzLxjTLBijOBlySCDs3qVFE1q+6q+R+iR+mYP9EGtGoWHUCmX4d
         mI4n96GM6N+hUEAvFRP9QX1PZ+L2S2/XCW1/Rilxcm7z3CWxmbUjewGd1xXe1vZdODzk
         hle1af4PbRQEH+gfKGflO5z3o/RXCcRVIUohNlnitZOqWkNJgJ236t57m0eZX1unejqI
         XkDrXR4HJkPNjq1Z0PsTZHJhCgRuYnOrntgp6W4mEC+5MK40BLfnYPdpKkV2NvtRPqud
         yeEA==
X-Gm-Message-State: AOJu0YxUlXcrrYenVjwy+N7+HdmzeTSw+EbTn/VJeV4H1jv1GZOAsz20
	n6dBeuiYf3OkyDANrT/WYhiliwCk2x1xTSmlZ5nMAyKOcohbsQ1viHkRkNL59A==
X-Gm-Gg: Acq92OGwvAvt02GNwwfA6EUzLezyXY9tTEnTpSqcOPbrtPbCUArfdmiJkMlCSpdaSCF
	xsJzbQSnStlxFXjgAbefugS2tCY9jXvZRbwji/LNXVmnmaqFEkif5JjG8sMI9pA3HR1epa6Ns6v
	2FzpvTyplXpDJXASh/RDqoYMVSwKAM+E8cBZsogqhbEpTw6abHJoU4+sJipaz6j0++xkTSiRUjT
	miFf6dX+Py6fA0uGccit29oyTwV21wzb9sIGwInK9pKcoJG39mdq9zOmqGegMsExWP/RKQNp+OS
	MNPWpJZdiBpAWcDznaAE7kpzNzkuee0o6Gsm5Fgcao8ZzYyntoEasakqqYwrEbGi9+js6h0nlh7
	wkhPxBv02XDIstREsXc+h0H73U5UIVRFSEkPi+wBkWMqwDJg4J4xU8mXb4atwQefEQ4xzvSJg5B
	uv9R6Nj4PnhoZOHUVhX2S3YwVZhvGf13dNMypzPXkAxgABMNhPGfc+dGPKavQOMq87jIcE6ReDr
	G7KG/MGyP4mTEE=
X-Received: by 2002:a05:600c:4fc6:b0:490:53b0:9e53 with SMTP id 5b1f17b1804b1-490b5e94e48mr4943035e9.1.1780431275963;
        Tue, 02 Jun 2026 13:14:35 -0700 (PDT)
Received: from fedora ([105.190.243.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76153sm92599075e9.11.2026.06.02.13.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:14:35 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: iio: impedance-analyzer: fix CamelCase in ad5933
Date: Tue,  2 Jun 2026 21:14:28 +0100
Message-ID: <20260602201428.213890-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch flagged mixed-case suffixes in #define names: _mVpp and _Hz.
Rename to _MV_PP and _HZ to follow kernel UPPER_SNAKE_CASE convention.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 85a422329..62ed5e40e 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -43,10 +43,10 @@
 #define AD5933_CTRL_POWER_DOWN		(0xA << 4)
 #define AD5933_CTRL_STANDBY		(0xB << 4)
 
-#define AD5933_CTRL_RANGE_2000mVpp	(0x0 << 1)
-#define AD5933_CTRL_RANGE_200mVpp	(0x1 << 1)
-#define AD5933_CTRL_RANGE_400mVpp	(0x2 << 1)
-#define AD5933_CTRL_RANGE_1000mVpp	(0x3 << 1)
+#define AD5933_CTRL_RANGE_2000_MV_PP	(0x0 << 1)
+#define AD5933_CTRL_RANGE_200_MV_PP	(0x1 << 1)
+#define AD5933_CTRL_RANGE_400_MV_PP	(0x2 << 1)
+#define AD5933_CTRL_RANGE_1000_MV_PP	(0x3 << 1)
 #define AD5933_CTRL_RANGE(x)		((x) << 1)
 
 #define AD5933_CTRL_PGA_GAIN_1		(0x1 << 0)
@@ -68,8 +68,8 @@
 #define AD5933_I2C_ADDR_POINTER		0xB0
 
 /* Device Specs */
-#define AD5933_INT_OSC_FREQ_Hz		16776000
-#define AD5933_MAX_OUTPUT_FREQ_Hz	100000
+#define AD5933_INT_OSC_FREQ_HZ		16776000
+#define AD5933_MAX_OUTPUT_FREQ_HZ	100000
 #define AD5933_MAX_RETRIES		100
 
 #define AD5933_OUT_RANGE		1
@@ -303,7 +303,7 @@ static ssize_t ad5933_store_frequency(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (val > AD5933_MAX_OUTPUT_FREQ_Hz)
+	if (val > AD5933_MAX_OUTPUT_FREQ_HZ)
 		return -EINVAL;
 
 	if (!iio_device_claim_direct(indio_dev))
@@ -699,7 +699,7 @@ static int ad5933_probe(struct i2c_client *client)
 		st->mclk_hz = ext_clk_hz;
 		st->ctrl_lb = AD5933_CTRL_EXT_SYSCLK;
 	} else {
-		st->mclk_hz = AD5933_INT_OSC_FREQ_Hz;
+		st->mclk_hz = AD5933_INT_OSC_FREQ_HZ;
 		st->ctrl_lb = AD5933_CTRL_INT_SYSCLK;
 	}
 
-- 
2.54.0


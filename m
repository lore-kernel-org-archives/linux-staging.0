Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5BB1F3D53
	for <linux-staging@lists.linux.dev>; Thu, 13 Mar 2025 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741895695; cv=none; b=n18Dtrc0L7FZX1w1dpQPvWa+GKTRuAs8ViJyQfbSrbvw5EDp9qDlabTK+I1Wi8x0WNNdk05sVyj+9LEDpUgqWHjwPgMtOS863mksiu2vNYLE5AJwrs+AQEf2q7VgSPWvfP6JNpdJq93KuloirRpsNPakJXx6l3wlLbh4p14Gc6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741895695; c=relaxed/simple;
	bh=OD+/u621mwUN73ktY519JVVMPBtMQmjjQicMrkJACVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MrKvPjAcgYNFuv7CDXc4BVebJ/ozZqvt8vkVQ4VcwuUw3Oow14LuQmO6VsoOLB7EyC49gRb7GeJfdrcdmdgvL5VDi4TV9sJdLx3tEYx8Zt8M2sEFahBm2DhDtLMiTWfZkJxwM8+pwHoRmYbscAQJJ9N5JvmlQw6OgQxwHnHgSCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VexpyCB3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VexpyCB3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2255003f4c6so26094355ad.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Mar 2025 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741895693; x=1742500493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHH4myFoiuxDS6apQJvZG9O0Yk3Qnm1cC4Wjl8gE+b0=;
        b=VexpyCB3WMBtJ9Jrz8gCSUl5B20zh7C7PCDwk0ohlWTTyKffOV+M+aU/1wHE3Z9Hj8
         8ZP54sGzSU2/IpFruB/2WxFblTwh0ZPe3x+bxjD7bRpWPXC1oHk3bftu+xk9bDNiBbkY
         s/QT8XeErdjUEFR5YW/OKgOEddgTK7/DOfGl2ujFeo0LRV4LpPVEBYgSMhmBYl858TRq
         a2x8QqyiMzh7HteRrIOJSUnNfEKvaPAvDAG4LkGgjg6PjhjvGZ4DhcNHrqXWkkQEYYPk
         kCnJQoM0IGg9SVh/QK/c9LvU7AvrMxTBFwZArpwpdOQhVzIEfMlUGjrMiZ+cJe6xvOt5
         VgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741895693; x=1742500493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHH4myFoiuxDS6apQJvZG9O0Yk3Qnm1cC4Wjl8gE+b0=;
        b=EgMPz6z8a4RcM2wuxfPJvjD5uqRHPfsSIdi8KYPU3CgdxaS5u6xmO4vjP0jmaSfCZQ
         K3tlCP4UAilhUyTE7IKA1PzwFpI/bU46TNDC3o3gmcRgg2YVEd33gu73albcw6USYWSD
         AVVLrOVeSJpcYtnbiM3D12LxuOFmZxHqFwT3LPgiusnLKldz92CMaeWCqefiOjVfQczx
         34rhhckplNvq/u2XM0Eg2Zu9Tc4QocGhOn5C3dODwkkwjxlIxqT1/MV2lwQaErkCtKsd
         UhJpRBituczQamab0AM4yqV1sx5DTp7RJzfNZeMRiD1LFOw3KudbzjdD49hpKZf1u4As
         xICA==
X-Forwarded-Encrypted: i=1; AJvYcCV71XpV71K8Mcq+SnhqelO8HSkMpx1NNwxMCPZa7Bt9ii3lnj6mFqBC/B3lgSbMY3Gjc2RHUmNPiZr//wYx@lists.linux.dev
X-Gm-Message-State: AOJu0YwF7ZPyv/2u0XZQJRoPeMbgmyJk8i0lF4zjqQx09ASjMMbUiAgb
	F/Uz0h/ur0vjSLnSSBHUMafYOeAcZImrfPT+ZK9otWuHHYBwsdho
X-Gm-Gg: ASbGncsTgLn+Va+1HcCkSzYmz3LiinfKQA3qyL/Ij6zc5euhTpaPz7VVK9AKUbea6g3
	UfE4BAAumA5mS4mCt44cN7nOabKdlCiWyg9v7keeSX8LXOSI8v4UelaX6g/61asMP81RqcvVYDJ
	ARffS6T3XmMYbLqXeXM/WJVnVZdjjlFbOtoyeqzmH82XQpZLKE/F496ogb4XSzyQ6ydawtduIus
	R/pgHPLRCmihJHSkJ9RF4h3A9HyaY6Arb9xKEhDCrf1OP5penvFgG5tw+nvLuV0m7kTtx+F1Zqy
	ZRi++z25h/64u8QJJSyFDH+2o7Bw2+pn+OstFi1FaQ==
X-Google-Smtp-Source: AGHT+IGYW/k2YlFAjqkFNaFWxXE5BZL1uTyV8DQEqt8Utpg9j1U75c1XYijGakd2K6eWuDEhHRwpRg==
X-Received: by 2002:a17:903:1b03:b0:215:4a4e:9262 with SMTP id d9443c01a7336-225df2d700emr3225495ad.8.1741895693013;
        Thu, 13 Mar 2025 12:54:53 -0700 (PDT)
Received: from fedora.. ([2409:40f2:357:8702:7d06:7e16:a88a:f1b5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6c76sm17397275ad.148.2025.03.13.12.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 12:54:52 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Siddharth Menon <simeddon@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Subject: [PATCH] iio: frequency: ad9832: Use FIELD_PREP macro to set bit fields
Date: Fri, 14 Mar 2025 01:24:17 +0530
Message-ID: <20250313195442.30264-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor code to use the FIELD_PREP macro for setting bit fields
instead of manual bit manipulation.

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 39 ++++++++++++++------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..bbde1f0e84ff 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -70,6 +70,9 @@
 #define AD9832_FREQ_BITS	32
 #define AD9832_PHASE_BITS	12
 #define RES_MASK(bits)		((1 << (bits)) - 1)
+#define DATA_MASK       0xFF
+#define CMD_MASK        (0xF << CMD_SHIFT)
+#define ADD_MASK        (0xF << ADD_SHIFT)
 
 /**
  * struct ad9832_state - driver instance specific data
@@ -139,18 +142,18 @@ static int ad9832_write_frequency(struct ad9832_state *st,
 
 	regval = ad9832_calc_freqreg(clk_freq, fout);
 
-	st->freq_data[0] = cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIFT) |
-					(addr << ADD_SHIFT) |
-					((regval >> 24) & 0xFF));
-	st->freq_data[1] = cpu_to_be16((AD9832_CMD_FRE16BITSW << CMD_SHIFT) |
-					((addr - 1) << ADD_SHIFT) |
-					((regval >> 16) & 0xFF));
-	st->freq_data[2] = cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIFT) |
-					((addr - 2) << ADD_SHIFT) |
-					((regval >> 8) & 0xFF));
-	st->freq_data[3] = cpu_to_be16((AD9832_CMD_FRE16BITSW << CMD_SHIFT) |
-					((addr - 3) << ADD_SHIFT) |
-					((regval >> 0) & 0xFF));
+	st->freq_data[0] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE8BITSW) |
+					FIELD_PREP(ADD_MASK, addr) |
+					FIELD_PREP(DATA_MASK, (regval >> 24) & 0xFF));
+	st->freq_data[1] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE16BITSW) |
+					FIELD_PREP(ADD_MASK, (addr - 1)) |
+					FIELD_PREP(DATA_MASK, (regval >> 16) & 0xFF));
+	st->freq_data[2] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE8BITSW) |
+					FIELD_PREP(ADD_MASK, (addr - 2)) |
+					FIELD_PREP(DATA_MASK, (regval >> 8) & 0xFF));
+	st->freq_data[3] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE16BITSW) |
+					FIELD_PREP(ADD_MASK, (addr - 3)) |
+					FIELD_PREP(DATA_MASK, (regval >> 0) & 0xFF));
 
 	return spi_sync(st->spi, &st->freq_msg);
 }
@@ -161,12 +164,12 @@ static int ad9832_write_phase(struct ad9832_state *st,
 	if (phase >= BIT(AD9832_PHASE_BITS))
 		return -EINVAL;
 
-	st->phase_data[0] = cpu_to_be16((AD9832_CMD_PHA8BITSW << CMD_SHIFT) |
-					(addr << ADD_SHIFT) |
-					((phase >> 8) & 0xFF));
-	st->phase_data[1] = cpu_to_be16((AD9832_CMD_PHA16BITSW << CMD_SHIFT) |
-					((addr - 1) << ADD_SHIFT) |
-					(phase & 0xFF));
+	st->phase_data[0] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_PHA8BITSW) |
+					FIELD_PREP(ADD_MASK, addr) |
+					FIELD_PREP(DATA_MASK, (phase >> 8) & 0xFF));
+	st->phase_data[1] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_PHA16BITSW) |
+					FIELD_PREP(ADD_MASK, (addr - 1)) |
+					FIELD_PREP(DATA_MASK, phase & 0xFF));
 
 	return spi_sync(st->spi, &st->phase_msg);
 }
-- 
2.48.1


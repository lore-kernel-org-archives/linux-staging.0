Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3647DA6C
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006382; cv=none; b=hGGomOhGJYeMQ+0UzHEz3vFUJLuSIYrGY+gNR1drP9y+qgKUUBQw6ysPL7Kg7yaRq3rlQV+ocnih/JLAM+HmyHp5FdEfnnZhxF3f/HGCz9T3GJLCl+0YFOzgYcL7N7ukWaaNmprn+jzFc1QHchSVAjh3YZbZFcME2cjTGkWos3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006382; c=relaxed/simple;
	bh=utD4m9KxZU2qXxJGpfZMJDAIaQB3fI8qf3jyLQewJIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sT1LlCBUTi2/EbA7Cdr7fTsA0f3PUWhstH03mcdJqgM6ANGzbBGshhQNuMfVa0AY1yPgSSSDgQ16tJsE5n2ni4sqVCSfCHmyFoa4h7oTGONZ2SEDgHnu7n1TOTt/zpSKlSUjqPSmjkcEScfJhbk7JBcz/EziI5WmMD6MiYr6YiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMBugims; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMBugims"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22349bb8605so82090205ad.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 04:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741006380; x=1741611180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7nF4G/QoMSbEjpBCaNBZjiOr+K5P7XYwcdTcf4W28Q=;
        b=bMBugimsHDndlp3c+46j4Q3AkA09lYxQb9rUfZoFaP3bWsy7Rlhdtj4Tc2LpKXLq1T
         O8ZV1mMuGBdxle8LFExrN0fhiPjMaqj75ghfUkw3Avuoo58X4fATKnJvtXumLSzhrPa4
         DkL09NsyS81XJ4FDEFRUY6HgDXKpWGeXXPks6JyGY3lPIHRY27Vz/9ncQicIwTI+y95V
         rmO/wk89IxBSK5P3COe3zp3fuzEPc6XURG33d/93FdkAJltLqc6L5DPOnFL3XWBKZPY3
         9kOkynZGDs/1Z1+Vd8ImlIQk5+lgz3+mZmCVvsrMv9g7X6RwwaT0H6QSG0tm5eZj+/WO
         OxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741006380; x=1741611180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7nF4G/QoMSbEjpBCaNBZjiOr+K5P7XYwcdTcf4W28Q=;
        b=Aj8eomkH9+TsS4AjO5HUFEeJr6JW5b31VL7B2USOd4fYJ3vGkm5AEXZT3PkumDkJ/M
         luJX+kVhMQu4M1zFOEoLMdjvJJ4aotH3pXuNSepteTiahYEAZWldWibDXrQE6eEpZdKR
         NlpbEI79brppGiPR1pOXLBKUVnSI+s+KIEAgoBDhw7tzxvUHrlgm7RgkzSy2+BdqjHhu
         Z05lPHf36IaFCIvsc9dQN6RI2VOcgKfZBV5Mah6d979Siw7OLayC3+AQlNnVhDFtECfO
         o3CvMdJB6aLA2DVlqc8Rtii5zrMiY5Nc9FecweurST+4ZuGF0EQBo/59QgaUOFZWlI3A
         e90Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiQQ6JbN5mkOxNDvYzs+PNiYgkSBPeJmo0t81oBepknxYUMJgcpRYQICpGbsb0nmpU5CWZCxHro3wlzMto@lists.linux.dev
X-Gm-Message-State: AOJu0YxOi5QCoqAf8GgmE6ULPVFgXDcLUYy4/guqu7Tn7wbb2kJc2N3B
	vAd3EwZSB47YPXBcS5hr+sona1LSoDhHed/c22tltTyZfmfjIj3Y
X-Gm-Gg: ASbGnctu6HLAZxffNtMaIaj4zV6ZYJyUy5yqd7IV68ojsHP6ix2TLdu83PkUgK1KZ1B
	2b1/VOciIZztmuywoFTLqTeASrw/0PMCTXhlmB0E41sKvDohv+7sgy7DtTLbDLKyJjqAraE981r
	MifUjMJiAV1JIcfysVPp9tULZ5flU0SlNru6vuFm/XTPdLiWPcXGOYRK7STA90ngk1dsFhD6MKd
	RhWKRrMUnNyd5xDhj7mociXPyUsikCzmf1isIHa7CC8MHUtatTiy3djLCfizrs4U4dMSQ/UZR5I
	fTHr1Kee6QSzEd3elHv8RrdL0iWlC+Tgsw6UeRNcCNBzaw/LU329i7vUkF7tq/IfpQ==
X-Google-Smtp-Source: AGHT+IF1rgR/bzCyH/MBlhqBNS9tlfKghtSxJphh7ZXwoa+zdyxUgqJSdsvP8GW9uDtbgiIC8Ss9sQ==
X-Received: by 2002:a17:902:e54a:b0:223:4b8d:32f1 with SMTP id d9443c01a7336-22368f6360dmr208146755ad.1.1741006379784;
        Mon, 03 Mar 2025 04:52:59 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:dd9a:b4a:c5e:4e48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa5a6sm77291805ad.72.2025.03.03.04.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 04:52:59 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH] staging: iio: ad5933: Fix CamelCase naming
Date: Mon,  3 Mar 2025 18:22:46 +0530
Message-Id: <20250303125246.342704-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

CHECK: Avoid CamelCase

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index d5544fc2fe98..a1a5eee4f736 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -43,10 +43,10 @@
 #define AD5933_CTRL_POWER_DOWN		(0xA << 4)
 #define AD5933_CTRL_STANDBY		(0xB << 4)
 
-#define AD5933_CTRL_RANGE_2000mVpp	(0x0 << 1)
-#define AD5933_CTRL_RANGE_200mVpp	(0x1 << 1)
-#define AD5933_CTRL_RANGE_400mVpp	(0x2 << 1)
-#define AD5933_CTRL_RANGE_1000mVpp	(0x3 << 1)
+#define AD5933_CTRL_RANGE_2000MVPP	(0x0 << 1)
+#define AD5933_CTRL_RANGE_200MVPP	(0x1 << 1)
+#define AD5933_CTRL_RANGE_400MVPP	(0x2 << 1)
+#define AD5933_CTRL_RANGE_1000MVPP	(0x3 << 1)
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
@@ -302,7 +302,7 @@ static ssize_t ad5933_store_frequency(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (val > AD5933_MAX_OUTPUT_FREQ_Hz)
+	if (val > AD5933_MAX_OUTPUT_FREQ_HZ)
 		return -EINVAL;
 
 	ret = iio_device_claim_direct_mode(indio_dev);
@@ -695,7 +695,7 @@ static int ad5933_probe(struct i2c_client *client)
 		st->mclk_hz = ext_clk_hz;
 		st->ctrl_lb = AD5933_CTRL_EXT_SYSCLK;
 	} else {
-		st->mclk_hz = AD5933_INT_OSC_FREQ_Hz;
+		st->mclk_hz = AD5933_INT_OSC_FREQ_HZ;
 		st->ctrl_lb = AD5933_CTRL_INT_SYSCLK;
 	}
 
-- 
2.34.1


Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97832F12C9
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768411080; cv=none; b=BnVbQfbgfauQcSFQoX2JiElCaPilfeMEiP8+WtcuJVf7BhoWFAtJrpflh5of7kLCYcyLTrQVjh1Byy50ZZxx27haUwMhAKrvk0tnWaZXjNE1hh1GRMwFFsrSxktEvtGoNbIcKZI/FKv599tSgeVg9pUjMvrF0JT23T335miyskA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768411080; c=relaxed/simple;
	bh=HjnoYpbCeDj1omo7DgKuMORs8cBtchJFKrZZqxLDVq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFga80xdgNj11RYGVllle+Hgse1xMaXCt5wJPvt9ffKF9/hrgqiuCE4f6sWXIhlGdUQZeX+TxV5H6Sfihuh2Rm9a3gK75uwBo6QZ1IoBC3i2i+gRmhoUkW0jVTwcwrgIL7WOWQXvWED67WKFgyR0dTTJNvhx07Kh/7qDyT8Xaj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0aYD+KJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0aYD+KJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c20ee83dso80068935ad.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 09:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768411079; x=1769015879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9nVIWgI/ofdqTvXhbFUpeYGkKVLTQt14mGlLNA55/Y=;
        b=f0aYD+KJhY6X40Vgf8VcwFZdd5M8gX4LGLzdjcm8CCPeC0mOph7y+BUjMrM1rwQsHH
         vap6DmUv/H11AgMV26iyLdv+mBavCHkvzULJBI+ZVDi4fmGKxSvsj5zxNSE7tPo4lHWm
         Fu9EjjMqjEJCr4ERxcHg0vY7mMAMLpx/cpUgymSfWuDeX3YZ3d5NLCymVg3li48IHMf3
         4tlSZQaCBhUosl1CemmUaSdBLWOYbPATPROkpBn8W0FAMRA+mjPnVBvxglicg/nFqqZc
         88AN1rGmXX8vfNtYFJgpRmHtowN3ypvTKNuVSYpLdNuREQkWBEzw2nnvM0H2sMq3fOkP
         Fygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411079; x=1769015879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9nVIWgI/ofdqTvXhbFUpeYGkKVLTQt14mGlLNA55/Y=;
        b=DTspg8yTvXJng3m59xVhemrHsYxDMjq9d0FKJcRcStfiK7Nsdp/iD9jY7l0GZ1q2NU
         0fZ93zwOHxHR8i41Qu8qxYcx3ksLazEt0ID042c/h4e+r99RhiC8nyZB0wTzfslWE24Q
         ORvWfrKJVk+8xNI06uzQyQam/MJg2Sasw2dajopMQDdlMNCvtpISoqRyGs1LDXbQAvfq
         fRtiQxc/fpueE8O4gMdHt3PvtflAtUyZn/YUfENGzVf9TuEUE/fjnESoxSiIj3Yw9EKQ
         ZSo+vS51yctLOV76gzUyQ7XPWGW8XARXehFX1CqyGYhn4MJS6E0LlyRI/8MmDBEb4yDR
         lwNA==
X-Forwarded-Encrypted: i=1; AJvYcCVNlcmTHvzgJlRQnJ7kijT9CgTSMlzNSgKHgK54bvk71tYgSX81NVz47n/BL31ki8kjwl4+fPqZTKFN5MOK@lists.linux.dev
X-Gm-Message-State: AOJu0YytV71Bx5fTFwi2uzT0YJIY5Ry+vyRIX4JUCax+9rp9uJgq8Yy6
	FRvV2poCwfQgkS5Qp4nqLkzHAMp2UWhwxzUgRMwfLhdDWMsSYtrYasKb
X-Gm-Gg: AY/fxX4gumoXIjGaAxwnDpbVxemFFLzhloLQs1s6flRBKWGPiQgGUxoCpvj1TIeF+Cl
	YY5SmH+BcJnz0yyG3HfGZXOLLvVK6JV/JT2QgQMhZAWORIc+0xYMn0tKAIdC8WcTLXKAPLQPw6i
	dCTDhqcG88akgZZQltw1CAAhbaIDJr+ogkjJ8KXCAbZK3MTKvmG20P7JjKBwOPokyXqN9izNHqA
	Mmvdxq92V3fwgwl8t0YHOM90TOwZLRCzyBLPwXuWLxJGstqD/ynqt3Tf/JwxE5PcN2m86coE/mt
	yWmoVhEz213Tv5Vs6g+ulnP3axiU6RlAq0w6CGj973LO2Mwv1CVHFm0ZFh/NL0YBP+45AdMcnqO
	T/QWEnXX3nQdcUUYNMaw4PlFWn3G90Rvw1lbdt22WvTpLwEpDUaNWCvQOywGRl26BogY19DR2Nu
	lq9woDQmaT7oLCp7CiKrwTElQ=
X-Received: by 2002:a17:903:22c9:b0:2a2:f0cb:df98 with SMTP id d9443c01a7336-2a59bb8d639mr30181465ad.25.1768411078776;
        Wed, 14 Jan 2026 09:17:58 -0800 (PST)
Received: from karthik.bbrouter ([103.215.237.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2954sm67314095ad.86.2026.01.14.09.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:17:58 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karthikey3608@gmail.com
Subject: [PATCH v3] staging: sm750fb: Convert sw_i2c_read_sda to return bool
Date: Wed, 14 Jan 2026 22:47:48 +0530
Message-ID: <20260114171748.34767-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sw_i2c_read_sda() function currently returns unsigned char (1 or 0).
Standardize it to return bool (true or false) to match kernel standards.

Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
v3:
  - Add version history (Reported by kernel test robot).
v2:
  - Fix invalid "Unix Antigravity" Signed-off-by.
  - Submit as standalone patch (detached from unrelated series).

 drivers/staging/sm750fb/ddk750_swi2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2..9d48673d3 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -180,7 +180,7 @@ static void sw_i2c_sda(unsigned char value)
  *  Return Value:
  *      The SDA data bit sent by the Slave
  */
-static unsigned char sw_i2c_read_sda(void)
+static bool sw_i2c_read_sda(void)
 {
 	unsigned long gpio_dir;
 	unsigned long gpio_data;
@@ -196,9 +196,9 @@ static unsigned char sw_i2c_read_sda(void)
 	/* Now read the SDA line */
 	gpio_data = peek32(sw_i2c_data_gpio_data_reg);
 	if (gpio_data & (1 << sw_i2c_data_gpio))
-		return 1;
+		return true;
 	else
-		return 0;
+		return false;
 }
 
 /*
-- 
2.43.0


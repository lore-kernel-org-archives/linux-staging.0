Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5CDEEB2;
	Sun, 20 Apr 2025 00:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745109006; cv=none; b=dS9LV2h9+b5DQpLt5pQ6G/vhEjJhglBPayXw5XLe+8HNllEfQAvmGtj+WVJ2cLAGmpgWwQ5Kl1pw3g8j0zcsu0RlCCcP6Qr1J1lRyggkenrrQw9xvLjVn+p4MyJaI5vYT+BB0d+8xSs7bMhcWMxtgLNFz7nj7bklMQChdwLSDBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745109006; c=relaxed/simple;
	bh=CCntJaSb9MDvFLR+jrrfjZXjcZnQs2OPtQYxHIZU6Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W03tkSqlvr2XdLgqfNzz/5YVvxae4tuDDsYUvsSSjDmWV6SiW1phXYd2Gf7Pi875RhJcjXhixz7yOD7M2pFPbHUkhiW3OBWJG2V9EpOpKJ8zMgPTpqhz/hb95FIRqrRgIcWX5N2L0ovpKy3OtJJBIq2y/9PXgcDneQZXywrJ+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUNL1cJ4; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUNL1cJ4"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f6970326so27174766d6.0;
        Sat, 19 Apr 2025 17:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745109003; x=1745713803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7oq4HIkBj4+ruAu2dWOyVk4qHejVBDW3R7KsUBqTQJg=;
        b=nUNL1cJ403OnpSgu5yZffs3CRb1dNKp3GkY1SyZatg5DWNa4XBQjYWnx8yIh9BFkzI
         BlETaqo7MDT1pL8FbK5GDgzhX5766EGYk+SONjgnlQfpfZEWEK5QAaVnUwcOxFv+ZY+k
         DEqpR6psfXn+LjbFd4jSyNNbh8cMfm627jOmOZQSBr4UK57QMDxpMivCLv4qQgjEgnzW
         2+MDPa02QbyCZr3qHDKf6tvSWd9Rbwj3VyeSiQc1skyFZxVG7eb4tZKLcyS+/UuWN2Gm
         C7ysrb57gThVzK7uMoLyCYCNXdGD6wtl4KV2gYTkhda+YOomopLszu35gFmV7h0zJ/Dg
         SY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745109003; x=1745713803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oq4HIkBj4+ruAu2dWOyVk4qHejVBDW3R7KsUBqTQJg=;
        b=KkNem9KsUhcFAwX6PI+S/F4u3BpZONKHbB0TVLOX5L8bznB83gbLKNFj2MyLzHJCkG
         No6hk+VJTg6wrsjpcYOKTnrwIYNk/48uO0p/yPd2yasBcXoLanq5Os7RVKqYWdIskHaE
         1JeXwUTcAH+dKcF7d+wvLmwjjNu16IjdF+CRM3D+vZcKXDueAfmo9XtI6IP0yEuLpqAZ
         4SFL1WXPfBiLRpx/NevUaaUT0jtVvJmritTLbqwJI3ciquXYJIrLB4nhtEfrBPY3RcCs
         sGxPTn1vWVVGk7xP0mxav2ker4TFApjKA71/NazI5Lyy0eA3DFwdZpSdsm5Knxi9nKJC
         XwAA==
X-Forwarded-Encrypted: i=1; AJvYcCU7mE5C0Dxhp0vL7790AgpgOW+cilOvVaB2zvaXnkW5Ffgdi57TbdBPCtVIQHeHzU+dSv0b3W0arTXsq1vDJQ==@lists.linux.dev, AJvYcCX4B4BOCd0qm6KPfQfdien4kxuB3TVaWDSHLaQsej/AGV6E6PheHRWBysWytf6pbjPqPo5dnBN6K83u98bOMNGqSqMd+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIwxRee0L9hGiIwq6J4ucfJKRTJwpucA7hDY+DFg/dX0XLIV9y
	ZEkW7vfCzU7CMNoCAmuoxvPKqQ4L7LcB/V9pXd5qZDpe+fARZkFu
X-Gm-Gg: ASbGnct0PFa0lZOG0Ju+xPYUmi1rTQReehzFctRH8iwMZg3fhRkk6I2A0vU7XYGU5S2
	iKNPycfcirCSXi62S2JYx9M73vFgQk3qBkDTTQig2yqF8e/WBV+fdkfZ9xkHoUSDsiRUpc489Re
	sWMJGdC7+Fz5xn1aMzRibCyxBRasC6kWkQZnhnTLzvKB6f02hDuJHT5VBTf46FsCVadO82vUMyJ
	o5qxoTeJh2WMHxIPyZc42ChPGvHXEC1rCNa7ipa6jM6iHdsTrMrf56d+deA6u2ExV31gx56CV3q
	/FeKJwnYQq8ML0W1kV1AMrAJ46Ade5IzLn9EI4aNA6gzMzpTVmL461e8BmMN2atZgmgOjN6K2lD
	fmA4goCtuWt7ywYJD8BQ=
X-Google-Smtp-Source: AGHT+IEWsjtSj7e7lQR+vf9lcpERLYW7vibDfoa1VjlCCiRIm8Imf+936M+AgBjV1zysxDZRst2viQ==
X-Received: by 2002:a05:6214:c29:b0:6e8:fcde:58d5 with SMTP id 6a1803df08f44-6f2c4687cd2mr126456826d6.42.1745109003355;
        Sat, 19 Apr 2025 17:30:03 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af48c3sm26480846d6.8.2025.04.19.17.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 17:30:03 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v3] staging: iio: ad5933: Correct settling cycles encoding per datasheet
Date: Sat, 19 Apr 2025 20:30:00 -0400
Message-ID: <20250420003000.842747-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the settling cycles encoding as specified in the AD5933
datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
previous logic did not correctly translate the user-requested effective
cycle count into the required 9-bit base + 2-bit multiplier format
(D10..D0) for values exceeding 511.

Clamp the user input for out_altvoltage0_settling_cycles to the
maximum effective value of 2044 cycles (511 * 4x multiplier).

Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v3:
	- Only include fix (remove refactoring which will be its own
	  separate patch).
Changes in v2:
        - Fix spacing in comment around '+'.
        - Define mask and values for settling cycle multipliers.
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index d5544fc2fe989..f8fcc10ea8150 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -411,7 +411,7 @@ static ssize_t ad5933_store(struct device *dev,
 		ret = ad5933_cmd(st, 0);
 		break;
 	case AD5933_OUT_SETTLING_CYCLES:
-		val = clamp(val, (u16)0, (u16)0x7FF);
+		val = clamp(val, (u16)0, (u16)0x7FC);
 		st->settling_cycles = val;
 
 		/* 2x, 4x handling, see datasheet */
-- 
2.43.0


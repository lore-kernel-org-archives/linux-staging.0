Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B7B259C;
	Sun, 20 Apr 2025 01:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745112615; cv=none; b=GsRCccqMTnxjBvGgtj5BOzwRPYVvK4r4dWKbF5kOnxtCLQhvcMW4oRRltvCw4LPpXkrsgYbeqKxgkPovQDppx5kRx6yNBMHBKdLFyV6as6gNO2OdZYddNhqZ2wAKyAk9lEnZIW1nlBg1V/OGMkit78/vW0VK1xDM3fUUxsxcsAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745112615; c=relaxed/simple;
	bh=CyuSRiVyKJEGI/x2kS5E1Rp/4iqAVY4WrRx/nkz9QqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jf+5ReW9fT3GQPh3QWQCrhCrl7JSgOR6Z6gkY/eEubKu78WeGD/JJw/6MAVIuwKLNUATulY1kYianV0jVkM+AQ9kCEfLS0dgVa006WxqsKmM2lAYt3kNpLdAcsTfYS4+eUCmEpuCp7TNU4A46HBuYM4xlSUR9B30ruPRM3WEZ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci4eBFTh; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci4eBFTh"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5b2472969so312943385a.1;
        Sat, 19 Apr 2025 18:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745112612; x=1745717412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTJrgwusKmBJGDT7w2SBMbCLd44w3bPlBa47XAgc/1Q=;
        b=ci4eBFThHui4AhCQlRU3THHKXdDpvh11xpE2W767NkuhO0Ckf5hkC20uuHrsNdpuyc
         yMyl6XLK3kfV1JpX1wCB3bW9iyFivEeFTQMFfkG+4BHQCr7HOn8nd4zmicbJY+foLECK
         BGkaObUazmc/LZOO9BawoQHKDj3P0386T+h7W5bIhk6i5ok34gNvjq6iGKIgim9oBfhN
         FFF+aq0Agu6MA4AfktHi3A4JTNi4WzwEuoYhP+BAOxMzbobOUpsh0/N7jxiwpuZ71sUv
         Kvw78fr1uxgpquXdBC01CWFm94JN/7KAC2rIXfS+nw2kdpC1i2/cT4EbWWc5BYs/ZhWs
         24TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745112612; x=1745717412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTJrgwusKmBJGDT7w2SBMbCLd44w3bPlBa47XAgc/1Q=;
        b=VQFWx4GoItMAuW6Mr1iJR55JEdWsRr7xXpA+XKF57i5Fiie88mPNIfoG2IkCs+ea3g
         +MPELX3WZr6NBapxm/os7Xc8jMLUyE56hipx0/zKPZA8DVy7KyWBN8hH3whGBile5UGx
         6vXXTFCyEhRhzRS76tpxDh3xZuZh56SMJLEgSw4oYl6pch6KSXrEeK1p2kdspmPUVhoz
         mYL4QzqUn0eTI0K6B2DDunpHJvIHXiU1zSRBBTq4Fzjz6eU6HdVvc46HiHXeaS4c5HeJ
         eq/poB0f7/YXAO78gsk4eKTe8cjESz7ezq5EoPk9hTlplPRGuEC7rFWVDeQgzf4RBxCp
         ho+A==
X-Forwarded-Encrypted: i=1; AJvYcCVcx9n+oFzPi6jOJIjOLIqhiz+0LX6A1RcrqEJYnzYcCy3BSpl3i+Fr81aUNumDe2cMffpzxEd57yW/+2jTtBZKmgzJ9A==@lists.linux.dev, AJvYcCWkbJVchHlqCSGTBmAKWfZH793ZN7kWy2r8gHZujZ77PqurNlxoX4IVLvmNiLE6SWt2XxvpIGiKIBzpfNUtQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEXZJjMLfJShUPYeo0JQBUKfKPHT3AFEZn2KD+KKM+1LS56P/s
	9n7jOMsOLLLJOiAgqaEtqGR6VYaxMR5TWjEE8F+/PgyQ6Gx3p+nj
X-Gm-Gg: ASbGncsi4fOiYx6VlLL1Z8s5zVIq34sD8RtqqfWPqH4sW/hH2IiTy3vJEYbwTwbFXgJ
	yn76C5Q/ly28oFiz0RxJ+jKnC4eYlWhLL4DztGZekW0/DrBhmT0YDYAZnVBYSaMna5M7BlHigoF
	R6/GFyDVW/PxvLwPl0qenqPrpDLDCGusBmapunv1EDHLnkwCrstubDZL9JI8wyfai3ir4EzeaJp
	PEpU3FyNNzeNYJESaEZZr2ebpjjOxtKmR4oQpKKeKMis3B0QbU/BO0o5e4lfDBf1T9dHil4iEYC
	NVePe4xoQ799cNunHkMTFznMI67tf7j7g+FEaZ/FW17dYns8+VrJo59trl3qjn9KV66KSBaa5uA
	P2+pt79FTSd5hoOh0KPg=
X-Google-Smtp-Source: AGHT+IHuRChHb64yjYSyNvCrPInTUCyNqDkr2FIU5+hyx3zlq5oe6v2nUcAjw9rPd5yYHVs51m7ZJQ==
X-Received: by 2002:a05:620a:1727:b0:7c5:5d9b:b626 with SMTP id af79cd13be357-7c92805d79cmr1629015385a.36.1745112612227;
        Sat, 19 Apr 2025 18:30:12 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8bf65sm266054685a.25.2025.04.19.18.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 18:30:11 -0700 (PDT)
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
Subject: [PATCH v4] staging: iio: ad5933: Correct settling cycles encoding per datasheet
Date: Sat, 19 Apr 2025 21:30:09 -0400
Message-ID: <20250420013009.847851-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD5933 datasheet (Table 13) lists the maximum cycles to be 0x7FC
(2044).

Clamp the user input to the maximum effective value of 0x7FC cycles.

Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v4:
	- Provide clear git body description.
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


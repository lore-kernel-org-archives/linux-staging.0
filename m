Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA96A10F2
	for <linux-staging@lists.linux.dev>; Tue, 14 Feb 2023 06:33:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id i18so7612878pli.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Feb 2023 22:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCGvXOUXhTk4TJX5okZQgwZJzPVMDC7JhiQGwdoouwk=;
        b=ITZn0ZFl5Q+su+hmWuJoIE4xlZAMa44PkeUh6KDU1/NQWakSQL15ZAWkWyqxIM4bGH
         vLvh+euhywOZ8xFb7SuvwwSrO3DAAft7Lq2cgXn9kO6ewq9UQr3U+FHKYECi68CX6ESV
         5ufe62mHJsvUPsKX5QOGUyJVoYoDTsq0vTRmUM8LYW9DPirxzG2j/Ibb5zBei/qQ2nSv
         maUcfktus26rlD5LgFHVq008uqKBmPVejjnHDTEPin4dKRMo+o5oUGxMxzkdDAgBiLGw
         gqzQMLqRjqft0uZfjjAQZlxt0V2YxBXbtEixW+CNP4mSCROKxua8yLPyie4n4tJYTEU/
         MSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCGvXOUXhTk4TJX5okZQgwZJzPVMDC7JhiQGwdoouwk=;
        b=mkRwgHr8XqwmIT9s5cq9miGBVjzTmUkY2uOH3baxvbYc3QtvsK/+07CL2NuCfJ4PTI
         z28mZZleA6ZqwaC93RqTtb3hLwEhvQ7aghD7z3LcWWnSIHleID5udovdr7RqPgf85NV1
         gQ5GSGrMroV4XJlsCkTIhADw0kxYQQA8Hh7BenOy/Zo+BFe/FlRVprKLhTK7oMj6jOMJ
         wggvwg1+wJbbMjbYREUQCOTg9Yc5NeGzLnKXTt3S38svq33NNcKYEX9QkJ8nRiwxhiLw
         L/z/6oJ4/Eab0mQdGZ8nBlKBR8RqcKbKSMWDy9iFunrCeYj9BnVP1qlT/k01l+GsPZAB
         Gq7Q==
X-Gm-Message-State: AO0yUKX7Av3AGssfQZKcraM2qFiNpPUp6KveEaxpVDN/SiY+b25eak9w
	PUb06FfBJxTYd5tk5I5+Bqg=
X-Google-Smtp-Source: AK7set+195CNjHz66V/yBSmSIksZQ3I+sDnUBDdZkybAI1Kql/Tm8zC/6Jhq+imb+q2sH6VcZmSbNA==
X-Received: by 2002:a05:6a20:7f87:b0:c1:1564:f661 with SMTP id d7-20020a056a207f8700b000c11564f661mr1689698pzj.37.1676356431263;
        Mon, 13 Feb 2023 22:33:51 -0800 (PST)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78e11000000b005813f365afcsm7431869pfr.189.2023.02.13.22.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 22:33:50 -0800 (PST)
Date: Tue, 14 Feb 2023 17:33:46 +1100
From: Jacob Bai <jacob.bai.au@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: change (struct pi433_tx_cfg)->bit_rate to be
 a u32
Message-ID: <Y+srSuTdGmzmXG1I@jacob-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Based on the TODO file and datasheet of pi433, the maximum bit rate for
transmitter is 300kbps when modulation been set to FSK. Hence, the size
should be u32 rather than u16.

Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
---
 drivers/staging/pi433/Documentation/pi433.txt | 3 ++-
 drivers/staging/pi433/pi433_if.h              | 2 +-
 drivers/staging/pi433/rf69.c                  | 4 ++--
 drivers/staging/pi433/rf69.h                  | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/pi433/Documentation/pi433.txt b/drivers/staging/pi433/Documentation/pi433.txt
index 4a0d34b4ad37..b34d8e9f6d53 100644
--- a/drivers/staging/pi433/Documentation/pi433.txt
+++ b/drivers/staging/pi433/Documentation/pi433.txt
@@ -78,7 +78,8 @@ rf params:
 		Allowed values: 433050000...434790000
 	bit_rate
 		bit rate used for transmission.
-		Allowed values: #####
+		Allowed values when FSK: 1200...300000
+		Allowed values when OOK: 1200...32768
 	dev_frequency
 		frequency deviation in case of FSK.
 		Allowed values: 600...500000
diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
index 25ee0b77a32c..1f8ffaf02d99 100644
--- a/drivers/staging/pi433/pi433_if.h
+++ b/drivers/staging/pi433/pi433_if.h
@@ -51,7 +51,7 @@ enum option_on_off {
 #define PI433_TX_CFG_IOCTL_NR	0
 struct pi433_tx_cfg {
 	__u32			frequency;
-	__u16			bit_rate;
+	__u32			bit_rate;
 	__u32			dev_frequency;
 	enum modulation		modulation;
 	enum mod_shaping	mod_shaping;
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 8c7fab6a46bb..0b90ca004dd6 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -185,7 +185,7 @@ int rf69_set_modulation_shaping(struct spi_device *spi,
 	}
 }
 
-int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
+int rf69_set_bit_rate(struct spi_device *spi, u32 bit_rate)
 {
 	int retval;
 	u32 bit_rate_reg;
@@ -201,7 +201,7 @@ int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
 	}
 
 	// check input value
-	if (bit_rate < 1200 || (mod == OOK && bit_rate > 32768)) {
+	if (bit_rate < 1200 || bit_rate > 300000 || (mod == OOK && bit_rate > 32768)) {
 		dev_dbg(&spi->dev, "setBitRate: illegal input param\n");
 		return -EINVAL;
 	}
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 78fa0b8bab8b..46a1fb2d5329 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -24,7 +24,7 @@ int rf69_set_data_mode(struct spi_device *spi, u8 data_mode);
 int rf69_set_modulation(struct spi_device *spi, enum modulation modulation);
 int rf69_set_modulation_shaping(struct spi_device *spi,
 				enum mod_shaping mod_shaping);
-int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate);
+int rf69_set_bit_rate(struct spi_device *spi, u32 bit_rate);
 int rf69_set_deviation(struct spi_device *spi, u32 deviation);
 int rf69_set_frequency(struct spi_device *spi, u32 frequency);
 int rf69_enable_amplifier(struct spi_device *spi, u8 amplifier_mask);
-- 
2.34.1


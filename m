Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB823CC
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 18:09:33 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id t1so25056072edc.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NwDzBogfEUHYF27N+2YDtv7JpUF1ighqidM7X8ZiWcM=;
        b=lQw7gXpn4KkEggWOCFv6/X0PbL9yVpEQwYH7DNqgryzB6HqHOmXKjE5d1txsIKdAKW
         TozzGSK+Jb1d5GtXmQNOYRDf7UGdYfpSpzF1wkcgjiItvDBk7mDPR3YQQgWUtbtvMKV9
         98s0XaZ8MVIlRnbnoa+6diJ2tOGcR14gGcJyGHm9oebq2DzoVn3LqKAN/qJmxTC0TjT9
         /B1vY0VoaXnZ11ZpM7aK61ZvCKjJno2+u5g9zklqW1SIYBs6TYmeegoMbFkbUEz7tRX6
         9SpSYTFblp7uZrxpkK22otbnbGIbfLH7MWpyvbpK9CMNkCbp2pKEK9gK9chH5r8CAYkg
         v9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NwDzBogfEUHYF27N+2YDtv7JpUF1ighqidM7X8ZiWcM=;
        b=jwGUvRaIHZZGxjHWI2jV1Wmc+WL71KCc3JyAE6Haizyd+yDWcBHUxJwjVZBCnLSliF
         uNofl85oPox4H0sbQKLBzN9Eo5Yqg3JVdJY4L/568E9boraHhHRIfayvNFfpFE7G+KDh
         IUVymmr1sF2vLLxOp+l0iQnDBhzOKFsu8pLdabqNxjDh5WOe1dvB4UTIEU1Zq6DNDNz0
         zK+mFHl/aEC6jupmmm2XhT9mJbOa7JIknERubNk2I2IElNUmSp0y29BaHa3XDotxGXBI
         mW3rlJHViDNe0QKJHqBOvRIcCTgwXleV2P33XZCvgCJLft+REyf9lcxjOANXXYFNIH1H
         FHPQ==
X-Gm-Message-State: AOAM533gpfUkDdO7KdSbT1M3L9ToLZkxSW/7TSJgoCTDE8GuSjP+xScH
	2YfdYspZNTrRlqTwYXK8htA=
X-Google-Smtp-Source: ABdhPJzC8XLOxaR1wWB1PhEE2h7j6fgvQGzTMXyuONNVHYJZYcWE4riTlKp7PyN82J5oo86mHCR8Ig==
X-Received: by 2002:a05:6402:51d2:b0:415:c171:346c with SMTP id r18-20020a05640251d200b00415c171346cmr25967325edd.19.1647367771744;
        Tue, 15 Mar 2022 11:09:31 -0700 (PDT)
Received: from nam-dell (dslb-002-203-132-165.002.203.pools.vodafone-ip.de. [2.203.132.165])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906145000b006bdaf981589sm8437882ejc.81.2022.03.15.11.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 11:09:31 -0700 (PDT)
From: Nam Cao <cvn249@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com,
	paulo.miguel.almeida.rodenas@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	realwakka@gmail.com
Cc: Nam Cao <cvn249@gmail.com>
Subject: [PATCH] staging: pi433: allow max bit rate of 300kps
Date: Tue, 15 Mar 2022 19:08:20 +0100
Message-Id: <20220315180820.7393-1-cvn249@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bit_rate data type is u16 which cannot support max bit rate of 300kps.
Change bit_rate data type to u32.

Signed-off-by: Nam Cao <cvn249@gmail.com>
---
 drivers/staging/pi433/TODO       | 2 --
 drivers/staging/pi433/pi433_if.h | 4 ++--
 drivers/staging/pi433/rf69.c     | 6 ++++--
 drivers/staging/pi433/rf69.h     | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/pi433/TODO b/drivers/staging/pi433/TODO
index 5cf3fd99d521..8530bbe61d70 100644
--- a/drivers/staging/pi433/TODO
+++ b/drivers/staging/pi433/TODO
@@ -1,5 +1,3 @@
 * currently the code introduces new IOCTLs. I'm afraid this is a bad idea.
   -> Replace this with another interface, hints are welcome!
 * Some missing data (marked with ###) needs to be added in the documentation
-* Change (struct pi433_tx_cfg)->bit_rate to be a u32 so that we can support
-    bit rates up to 300kbps per the spec.
diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
index 25ee0b77a32c..c958dcfa9f96 100644
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
@@ -99,7 +99,7 @@ struct pi433_tx_cfg {
 #define PI433_RX_CFG_IOCTL_NR	1
 struct pi433_rx_cfg {
 	__u32			frequency;
-	__u16			bit_rate;
+	__u32			bit_rate;
 	__u32			dev_frequency;
 
 	enum modulation		modulation;
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 659c8c1b38fd..0590db841dd8 100644
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
@@ -201,7 +201,9 @@ int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
 	}
 
 	// check input value
-	if (bit_rate < 1200 || (mod == OOK && bit_rate > 32768)) {
+	if (bit_rate < 1200 ||
+	    (mod == FSK && bit_rate > 300000) ||
+	    (mod == OOK && bit_rate > 32768)) {
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
2.25.1


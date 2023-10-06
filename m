Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E515B4
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Q3D/FnGM"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1dd1714b9b6so1032997fac.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553475; x=1697158275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=694cROjBX4OIAjPeqcWX3jQmtpcK+zvZ6QnLrkMQvzw=;
        b=Q3D/FnGM2v+hvzR90zbuGzQoXkznfB/Y8A0jl4iffhzRezYu5sKPoYRtXb/7hvX23+
         FuLaEah1N0jCMSfYDZCRtpYl3INRsAU2OyXYBUp64fPAW1ja+Cj2PQSGEf5LN/INBZXY
         o+lQaVKrD6VGxNC/nwacFLOwIlzfHNqYFHxxMv6kJ5BJMeSqUMV9bPrxUvHvzYbhiMfF
         JIDvgcgN8ZuKUQFInofNPTlrTlMR8I9ouRmSsC9z1du2pNClTWJWhoCpl88xSJI5QwIN
         reBhde8hgjZjQEHNUWuKwbGHzkRbPVKy8qYPGq64X/Zg5iyUVHm5shJmnW3Dq1ne0A8q
         HZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553475; x=1697158275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=694cROjBX4OIAjPeqcWX3jQmtpcK+zvZ6QnLrkMQvzw=;
        b=wQQwkERdPHFzGqRgvUmE2w5wlUT6qK8+2YhbYmfKvi+iaqEXr8h5aGWSF1Ft0MUDbV
         wFhsA2/U86+9i4EbHnYmSwSUfWzTq/xVJA8IqH0N3I4lqELuKoX02SCvbsjl8uN2d3Hv
         BatlYDQ7bu4qqBQCkZsjOeNb8esaKCVot4ur7aL6vA2tNh/XBmkOoGPwP53Qus7IWeHG
         msJGiGrNuvXMqtVmV0vmIX6QX4vK8dfFlro//JxeIIsFj/iJMdPvdtR+Z5oDtiiRe/Bs
         2Aru8hmeyOz+h/CI01cQhmBsmg3kftJrAtYu4WAc92163Xu6uK9niyBXxMm0Nuklp/bf
         1f0Q==
X-Gm-Message-State: AOJu0Yyvz3rp7xhJfAXzY+vnm0D8WVJJ+EJdsb1D7UEoH1sNnRVD2wAx
	hPE8V6HJbFACvAT73vVp7JS3RQ==
X-Google-Smtp-Source: AGHT+IFTWwdydsOLr5JLQZcSFArkRd3wlb2R0pk1X5gqz9FgWVbqkrdh9gTslILsB2FD6WKLARmMfA==
X-Received: by 2002:a05:6870:583:b0:1d0:d78b:982e with SMTP id m3-20020a056870058300b001d0d78b982emr8029343oap.35.1696553475710;
        Thu, 05 Oct 2023 17:51:15 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:15 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/17] staging: iio: resolver: ad2s1210: add register/fault support summary
Date: Thu,  5 Oct 2023 19:50:31 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-14-ec00746840fc@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

The ad2s1210 driver shoe-horns the register and fault support into IIO
events. The mapping between the registers/faults and the events is not
obvious. To save users from having to read the entire driver to figure
out how to use it, add a summary of the register/fault support to the
top of the file.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes: New patch in v4.

 drivers/staging/iio/resolver/ad2s1210.c | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index d9d51bbbade8..51490fea1647 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -4,7 +4,47 @@
  *
  * Copyright (c) 2010-2010 Analog Devices Inc.
  * Copyright (c) 2023 BayLibre, SAS
+ *
+ * Device register to IIO ABI mapping:
+ *
+ * Register                    | Addr | IIO ABI (sysfs)
+ * ----------------------------|------|-------------------------------------------
+ * DOS Overrange Threshold     | 0x89 | events/in_altvoltage0_thresh_rising_value
+ * DOS Mismatch Threshold      | 0x8A | events/in_altvoltage0_mag_rising_value
+ * DOS Reset Maximum Threshold | 0x8B | events/in_altvoltage0_mag_rising_reset_max
+ * DOS Reset Minimum Threshold | 0x8C | events/in_altvoltage0_mag_rising_reset_min
+ * LOT High Threshold          | 0x8D | events/in_angl1_thresh_rising_value
+ * LOT Low Threshold [1]       | 0x8E | events/in_angl1_thresh_rising_hysteresis
+ * Excitation Frequency        | 0x91 | out_altvoltage0_frequency
+ * Control                     | 0x92 | *as bit fields*
+ *   Phase lock range          | D5   | events/in_phase0_mag_rising_value
+ *   Hysteresis                | D4   | in_angl0_hysteresis
+ *   Encoder resolution        | D3:2 | *not implemented*
+ *   Resolution                | D1:0 | *device tree: assigned-resolution-bits*
+ * Soft Reset                  | 0xF0 | [2]
+ * Fault                       | 0xFF | *not implemented*
+ *
+ * [1]: The value written to the LOT low register is high value minus the
+ * hysteresis.
+ * [2]: Soft reset is performed when `out_altvoltage0_frequency` is written.
+ *
+ * Fault to event mapping:
+ *
+ * Fault                                   |    | Channel     | Type   | Direction
+ * ----------------------------------------|----|---------------------------------
+ * Sine/cosine inputs clipped [3]          | D7 | altvoltage1 | mag    | either
+ * Sine/cosine inputs below LOS            | D6 | altvoltage0 | thresh | falling
+ * Sine/cosine inputs exceed DOS overrange | D5 | altvoltage0 | thresh | rising
+ * Sine/cosine inputs exceed DOS mismatch  | D4 | altvoltage0 | mag    | rising
+ * Tracking error exceeds LOT              | D3 | angl1       | thresh | rising
+ * Velocity exceeds maximum tracking rate  | D2 | anglvel0    | mag    | rising
+ * Phase error exceeds phase lock range    | D1 | phase0      | mag    | rising
+ * Configuration parity error              | D0 | *writes to kernel log*
+ *
+ * [3]: The chip does not differentiate between fault on sine vs. cosine so
+ * there will also be an event on the altvoltage2 channel.
  */
+
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>

-- 
2.42.0


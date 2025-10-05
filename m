Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFCE21D3F3
	for <linux-staging@lists.linux.dev>; Sun,  5 Oct 2025 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759666723; cv=none; b=Lje353x/qFvtc8xJCOfUtvEDWbf/NXDolHFH1cfsqudOR7T6y6P2a6RfZfyNCPg+Tq2ATNIuGx1zP6eEGOpWmUZA+/mGPDzz4l3AQ1GsFcM4K1cl5hIaATgZLucyRh2XGxOk80efL5qJI9rwVDTKJq+DYkoRBYyYCM1zOch9TBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759666723; c=relaxed/simple;
	bh=4g1S8x3yOvkzQXSdP/T9FfbGgHJyz3a/FaA45XPm8HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fhvGHGpu0bOna4fqIwB5c+r/dMfnWbGYUs2uN+5hOzw9sGCjV+m4MoFmJddCUnTC1/sLs2j+XmPG3yRYi2P9AWAlhjKGAALBCEBOixzWZqiJdf0M78zkMj9Bv8JisjWiGRgHAAVE3ANMH/Z0n0tZcPBa46TGxbpp+y+n+G3dXkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8xHxKy2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8xHxKy2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so30531535e9.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Oct 2025 05:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759666720; x=1760271520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XlxENHq5KCP4IeCDtxo/0OOQpWC6mUCvw6ETPSr7Wcc=;
        b=Y8xHxKy2stiE/xj4ClfCLDxrY6iqZEKFnhOrBytloFXTp4c+HqzidqZoqzyvfip90X
         yi0FrMFKreXGFgjhF7p6m4vXeNUZyh0KgXphkO4tn7/s1Q+9vnYT0yRSZZw8LDM363KQ
         RF3b9snaa59G0nzA439pp/bzRZKwSiLlH/pLkgB7eADNO5pMEuehrM6CjvOIvYkj9Nwj
         axJMOmQdSE2Y1GRHtdXXvoRL+9awijSVVJkPdtDRvG0qgGzKdtl0nKfWA7YNIsR5RddQ
         g8V26qGhDaf5Rs9Jf9B1plO1RaB6ZVB06lbJiLoYoJC2uIrNxqaA2qZCyOR0YC/I+Kht
         oujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759666720; x=1760271520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlxENHq5KCP4IeCDtxo/0OOQpWC6mUCvw6ETPSr7Wcc=;
        b=iWj8IUvgVAxgATXDAjhIe0WA46RxN040Dr0ApiuJFWFqCbaOqF+zTW8Ae6jTnvJGGm
         +yKLSaLcI2xU7+e9M3tC+bSoa781PpJx9QWhBnwJEeJ5a2hH9T4GxGFD6Cs19Y99KZN3
         6FpNPg7y5hrl+8hHUqJup7QMrLrELzkoTpfDDcMBN3brfmnpxqZSW+lKwfLFaz5eJVp3
         15SImVIzcy/GHMktA9xmV6YKj9+8sV0MGRXwSagOch6htlkviPGWoA7OEG2rms7DMAhj
         4Y13YEUAcfbUCX7hl72YmZzlSFtyHRZyOZlNPwxXX/bESzYF5cGpEAFYUZyM8d9hGvpb
         6oMw==
X-Forwarded-Encrypted: i=1; AJvYcCWyXbHShkcKlF2FvBR/dFO+AMSRoanQ8iMZuDrpcqhWedzzrSz/saFJVsNzB75stt8Y8cKeZOGLRSkMDlHr@lists.linux.dev
X-Gm-Message-State: AOJu0YxmIP3AjaFXsseKYs7gxMNq5ljn20TxA7J4qlOAeZhfo4dcdFr/
	G84LqZQIA2CFXJ6EgGosnMK6ZxyrDrLGjzdRRao1yosjjS0+GNHFX0AU
X-Gm-Gg: ASbGncvKQsG2yLYuc5qmjZQIfP7I5dUUmRPrqsgX1TavOhevDEsR2peqWrJv9r1kxGZ
	2LztuPxtdKxJmKcOOr1YYxyJF9pwgEHxMC9YDdzjuCY4z45ETFVb0B1yQLmE6Hh+qnCpG+mQadO
	igtnWXrRsM8Nq2c7sQmGGOrwxZ4ZA3PlgnqnELVY9+L6zbPiUvws2v8KgEnQucttPPQ9JNeHSlS
	tH69YLp5HrQFF+1LyMo7ySeL3jp5PMsOOV4/lFHvRVUK39/snREHU+/zxJzZIA49UjNd2g/VZC2
	0qGuTpY7voNfF7gOUzGntZA36InSb810/SM34SEylNgpwqt8Otwpb98h04xFLcbDRDV1Fr6x3hI
	v0UH9zfGmMLbfQRWYDZ8QMdNMUemxpm9xKxSN5Sl8mWl7SQ==
X-Google-Smtp-Source: AGHT+IGd7HamBGfyn+haKF73tvPNK3v+CDl+3wiplixcaxjElsQMk6+N5NB41z/7I8JK5+UHRmwl+w==
X-Received: by 2002:a05:6000:186f:b0:405:3028:1be4 with SMTP id ffacd0b85a97d-42567137c45mr4878010f8f.8.1759666720468;
        Sun, 05 Oct 2025 05:18:40 -0700 (PDT)
Received: from ASUS ([182.185.168.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a18b76sm213709195e9.18.2025.10.05.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 05:18:39 -0700 (PDT)
From: Taimoor Zaeem <taimoorzaeem@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Taimoor Zaeem <taimoorzaeem@gmail.com>
Subject: [PATCH] staging: iio: ad9832: move ad9832_platform_data into include/linux/lib
Date: Sun,  5 Oct 2025 17:18:29 +0500
Message-ID: <20251005121829.175943-1-taimoorzaeem@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move struct ad9832_platform_data from
drivers/staging/iio/frequency/ad9832.h to
include/linux/iio/frequency/ad9832.h.

This clears a TODO item in the drivers.

Signed-off-by: Taimoor Zaeem <taimoorzaeem@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c                    | 3 +--
 {drivers/staging => include/linux}/iio/frequency/ad9832.h | 4 ----
 2 files changed, 1 insertion(+), 6 deletions(-)
 rename {drivers/staging => include/linux}/iio/frequency/ad9832.h (91%)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 49388da5a684..76bc384dfad1 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -22,8 +22,7 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-
-#include "ad9832.h"
+#include <linux/iio/frequency/ad9832.h>
 
 #include "dds.h"
 
diff --git a/drivers/staging/iio/frequency/ad9832.h b/include/linux/iio/frequency/ad9832.h
similarity index 91%
rename from drivers/staging/iio/frequency/ad9832.h
rename to include/linux/iio/frequency/ad9832.h
index d0d840edb8d2..81c97a521812 100644
--- a/drivers/staging/iio/frequency/ad9832.h
+++ b/include/linux/iio/frequency/ad9832.h
@@ -7,10 +7,6 @@
 #ifndef IIO_DDS_AD9832_H_
 #define IIO_DDS_AD9832_H_
 
-/*
- * TODO: struct ad9832_platform_data needs to go into include/linux/iio
- */
-
 /**
  * struct ad9832_platform_data - platform specific information
  * @freq0:		power up freq0 tuning word in Hz
-- 
2.51.0


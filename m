Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0C3271F1
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765825710; cv=none; b=DBHNZq7Nf1XCc/tWlvkuHcAlX58dABpWEPj4Y2FySomOpvRrkf+JxSCDa7fsLchFPZ0K6ARDmM4xV2NgsELx4KwSLPzf4tzkbSzjemAzrn8LvVL7O0BgD/+OTh/IJFv60yrKY2SsFwtaW6osXvoOp2PiFdT221i4X9e/544ffVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765825710; c=relaxed/simple;
	bh=8Ywqlv27SE1AVx+U7diS5Q+GgCHCjgIT5HGMYTgOf08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkT93Hs4A+EMNZ/r5OKKb25zj1hzzeMEDVEs0kY+QSnFNN/K9jVJLUk2iRMqSgo1FPpcEPUMA5fXvw2qgtJeTDfiKDcKRMQilIv3v4APtCcfsONitwsrRwwZEBoH+IyN4ssYeOS3adpd/GoG1XAfU41riU9+nPSFBQzTtnwYeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Run5SPvZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Run5SPvZ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c902f6845so1721433a91.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 11:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765825707; x=1766430507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/Vlev60lRDarHuqvumMkRznWDtRoDHrSo51IVlDT98=;
        b=Run5SPvZfTrd358Mz2SlA11x1NEBZ8uSs/uoMZ+/D65W0kjfrztNOIVYZQSg4o6OUk
         oO0aTxR1njO4SMSf6JmlgeiqcC8JkyZfrfe2hJnH35aTyfBrsPHUhj0qGyX1g23L2eJb
         9DPcz7EErUSB1odZPFJBaJWorH/dA4u9IaOPR3PV/fonu105+eYsmhUwWgIRz/wvwFJd
         jUkZPpfU5WFJqSBXla+shboBDv9DpZSsKl+c4ZlW7uQmz4pvmb73l/fybgHPsbHMBwD6
         RFH/vOhb+LL53xVIWfwN/43bD3XpYov7wPU+z9fUaJb4Bhu8lVqQPth6ABhLTcVoRDbF
         P59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765825707; x=1766430507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/Vlev60lRDarHuqvumMkRznWDtRoDHrSo51IVlDT98=;
        b=G2utiyNRKEZbXQHX5iDmiKxhGvN9DP4fGagqIL4VhoILM/wk6+BVePuR2C/HMzjN1K
         5eDwPkBJRg0p4rT1ztkul5KBLcO4PBnfIngwvpmELn2Btij79bcVqN/Rd7Ty49+XzZuD
         EcPyBPpug4UA/6pz2KMPcOFHmq9SGz3wPa3VNWQX/NArp2D95bKU708VNoVxQp2nJET+
         IwMHrH4TOfOI6fzvTp4Ki+IJcp0u8sJ7rpGNgf3z4N1AM9Acl9sCjRyKAHSbUCtJKpUt
         XLsaGeMrDqFvMFQ3TpxUlNLIFBR6cfyzbheEd99kxi7XZpXRXAf7cvDjzGGpPzAXuN5M
         q9jA==
X-Forwarded-Encrypted: i=1; AJvYcCUAe8dRLgndTh9X3RshpC0UzMvlu/KR9FAbqir7i0vHsY9ktdRtlZ18FS3vAn7AM0cdCCFf6Pc4db65PyCX@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh+kikjo+A4hTamCfb4ja6VYgYeUoLZI84uNtURnZ9rdiWlQn+
	P4H5v/tT4nnvEnJtWBlRUMGerQNI9MR9w39h7D6bLdCqvUWljuqL70Dy
X-Gm-Gg: AY/fxX5r4Sk3b7KPPDNUH3KvKiqk7qem4yM9ka6c0VtwGQjTf8DvbTGwIMTe6+GvcQb
	Y98Or5W/nhWMNIFmXo3JSr4TNG8pVWcbJ8/nDvhi7+k+Uz23gCS4G050eKnj9UfibYkc8/8275s
	dOCQzVhnm786J7wCGDXQyadJzlvASo8y7uLzXju/vtwDYiiftr+/IeUYOuCk5h0uU3fYY4M2Fa/
	wp2bjnI4/hu/1ATNZevkE0OdmUwqIJ+ejBU7j5HcHddZaf8FhR+eHpySzdk948HEfzXwIuw7mib
	cMWbsTHSVf3P7hFLHIFhsbCVWCqUXR8sEOEUs8qGk69RX1QXmyY2Jf0KoKkv6rEa9+u0gbQpYwH
	ENWHje6fm34+29Rqwh7f8igUd4t4dXAIAwND47fHT2GMPC529iqZ8MpZoiLt7ygbSEs+fLkQmHQ
	f0Xi0nJlaxE+LMc6D+awcKrgKJ/Qlu770TWzIFKo1++7OsAROjlybOhKfGAWMabY1bP5Gz0MWmH
	JNeWZn6fx0apLWtoJEt+tVbqcX4J+MqIIlBnpkXVh/1kG12jaNTYHiITAPMlZnmDOaJ2hT4
X-Google-Smtp-Source: AGHT+IHBF5A4JZB5+K4+/QTT0muHdjH1nsLZLkU3qoa/JQPWQRtUpiTd6RkM6KZvMTbmdqoKOdRXeg==
X-Received: by 2002:a17:90a:d884:b0:34c:9cf7:60a0 with SMTP id 98e67ed59e1d1-34c9cf7620bmr2870747a91.5.1765825704418;
        Mon, 15 Dec 2025 11:08:24 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe2948d1sm9958875a91.9.2025.12.15.11.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:08:24 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH 2/5] staging: iio: ad9832: convert to guard(mutex)
Date: Mon, 15 Dec 2025 16:08:03 -0300
Message-ID: <20251215190806.11003-3-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215190806.11003-1-tomasborquez13@gmail.com>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard(mutex) for cleaner lock handling and simpler error paths.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 28 +++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 00813dab7c..f9ef3aede4 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -180,9 +182,9 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 
 	ret = kstrtoul(buf, 10, &val);
 	if (ret)
-		goto error_ret;
+		return ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD9832_FREQ0HM:
 	case AD9832_FREQ1HM:
@@ -203,22 +205,18 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		ret = spi_sync(st->spi, &st->msg);
 		break;
 	case AD9832_FREQ_SYM:
-		if (val == 1 || val == 0) {
-			st->ctrl_fp &= ~AD9832_FREQ;
-			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
-		} else {
-			ret = -EINVAL;
-			break;
-		}
+		if (val != 1 && val != 0)
+			return -EINVAL;
+
+		st->ctrl_fp &= ~AD9832_FREQ;
+		st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 						  st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
 	case AD9832_PHASE_SYM:
-		if (val > 3) {
-			ret = -EINVAL;
-			break;
-		}
+		if (val > 3)
+			return -EINVAL;
 
 		st->ctrl_fp &= ~AD9832_PHASE_MASK;
 		st->ctrl_fp |= FIELD_PREP(AD9832_PHASE_MASK, val);
@@ -238,11 +236,9 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		ret = spi_sync(st->spi, &st->msg);
 		break;
 	default:
-		ret = -ENODEV;
+		return -ENODEV;
 	}
-	mutex_unlock(&st->lock);
 
-error_ret:
 	return ret ? ret : len;
 }
 
-- 
2.43.0


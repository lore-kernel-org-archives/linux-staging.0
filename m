Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF75389462
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772094351; cv=none; b=aHQSdqBAHmySCZC/6Sd4XheL+Rc371maxmTlsxZp4wcfMPZnfh97sNzMUWZyJyQe3+F46guk+12EErvlXMp/ar8OmN1GdNNq6REOj0r7RASGzgO4cHn7NNaJDPGkc8iLPmuGgqGhllTsP7V3P0Jdyt8UgA+wecpaZGpn4jxwW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772094351; c=relaxed/simple;
	bh=TxG0f9exKqQbKSk0xa8lU/Cx6XtKZupuLU8VGhgW4v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qubMpv2wzJCMV5rYl5PUNn01ChNTT1f6lrEfbzuyvC9UcxfJKtwheiNWJ4AUXuytjpPbo6PhCLeyncXrFG6bjWmXk3DhOqf+Y6brpKReXAW2ckGky+BgHEXf8vR2RuVyKh6UcIwzBDVL7OVq4gV2EyXmsYCJZpsLOo/sUyEyHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMXAUJTn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMXAUJTn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4398ebdf520so1073491f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 00:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772094348; x=1772699148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2DXQgUmURVJwaYW2hiIMRPzTKSONvVLRn6L1AJLhT4=;
        b=SMXAUJTnzeRNbuIjRs7kqOqcDfV79BJoVyuigUWRbq5pCK3GXWWDzxWvXYMee8eQkl
         yShnf7F6II+/9M/rzVGBDDtha0ZeOsKrY4U4OGninIMaJmOCqQLGl3UpuSyDeEWHK1XS
         7b0WPc8SKR+BBVOEPbRh8h0jRLSbFKNByrC3bDdZQP1KNoWHGhamoFGyKZnbtM3/lOJ7
         4vaMZU2dxNWDEa/n4qVrJ9A7yq8vcDGKO96XGlMkPOX4f136MV+zgL8mcq5D/zGZtdtg
         DpdrIfK02J/GvFZws0S8hwynwskmcjqaJ0fdNzYKukQ2ZRH+n/M1FesBSnyz4mdInF+1
         Y2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772094348; x=1772699148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t2DXQgUmURVJwaYW2hiIMRPzTKSONvVLRn6L1AJLhT4=;
        b=q8poSDUS336lvwWkHQOFLL+Lt4SBHPMV/OKU0hnGaP1CjAhZORksfi+P+9MID3V7PD
         OuO+jSjJvIbfS0nmrdkN0lFaDFq4R+xh+Zc2/HXrAykw4QLd6ud1C7GkfJmw0byRcK+K
         aJ8gP+sWRHAZqsbyEAQNIJAWgGbsaPr9TlAWCoDtBvOFkgI0NCqRCbJhyfCCE0s5GJ1k
         FqcCHJsoBT1tBDcmDZGK9u9+scYJRcdP2t8EZgnCGuLAQyBMnOg7ZDyYwJWhKhlj6fDh
         VvLpYIy64EKxK6kndMYp6SciPKDC9U2tCo2GH9aB/YP3rAgfiJ4x7Wsr1deGDfbq3rG8
         A7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVOWoYzKDugN4T9/WUCrM/6ov81S8vcy+bj4m80AfyCPI7jLBDw7lwIJJ76KdKgg3hY8bpsorKE//5cPKCg@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpck83RvBvLxKCqixjZUHPj/EwucH9EPMQrwKDIFDJ38sOvpl5
	hHDOveRYxhdZsYM60DYJJolmxMp4MNEsVjMMjBOcvZyhYENib/kIQF4W
X-Gm-Gg: ATEYQzxuHUKR+JdJMuf0j22R1VJkNfnew+LOqZsNJ2USVbefaVCxpzJw0XZJGkn2qkX
	7WvtZ8nm9OCmJtzozCV+kxd3N11k2F1cA9E4OT2MEXTK/nKBE7oI4MJCI5sNuliWK4J/EOIk2VT
	RNWWsAZ/3rIyk9wtvjFNSxjGU0cPXNRX70jmDdACVF6SXOG3Cy32TxCVmAkRAGfyGl5LX5IEK7C
	zS37R/W61XAOD65h7bBYScVV8YGizs2qX0eYANr8fEXZu/yetJ/nrg/ZLSK82MLG2416Kyxt6g9
	kqaAxlYpizUkZOu8GQNkAvk9DIkA3Llq2W6UQjPqGCy1eThY4iPHP5CHDNfnSXv9fwjif3lbF47
	YFSD/6T9bxU42yCqdA4JPySZt8e3VGzsagcU02+O6mB7HD7qeP1B8Rv6hbSDdJw0VWDgz92Ibpw
	==
X-Received: by 2002:a05:6000:609:b0:439:8c7f:712c with SMTP id ffacd0b85a97d-439971aead8mr3568173f8f.8.1772094348355;
        Thu, 26 Feb 2026 00:25:48 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm40683939f8f.17.2026.02.26.00.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:25:48 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: [PATCH v2] staging: iio: adc: ad7816: add timeout to busy-wait loop
Date: Thu, 26 Feb 2026 08:25:47 +0000
Message-ID: <20260226082547.69616-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aZ_9x4q5BZRJi3ue@smile.fi.intel.com>
References: <aZ_9x4q5BZRJi3ue@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ad7816_spi_read() function polls the busy GPIO pin in a tight
loop without any timeout. If the hardware fails to deassert the
busy signal, the kernel hangs indefinitely in an unbounded
busy-wait.

Replace the open-coded while/cpu_relax() loop with
read_poll_timeout_atomic() which polls every 5 us and returns
-ETIMEDOUT after 1 ms. Per the AD7816 datasheet the maximum
conversion time is 27 us (temperature channel), so 1 ms provides
generous margin.

Use the atomic variant to preserve the existing busy-wait semantics
of the original loop.

Also handle the case where gpiod_get_value() returns a negative
error code, which the original loop would treat as busy and keep
spinning on indefinitely.

Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135..9b4ae3ee2 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/gpio/consumer.h>
 #include <linux/device.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -85,8 +86,14 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	}
 
 	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
-		while (gpiod_get_value(chip->busy_pin))
-			cpu_relax();
+		int val;
+
+		ret = read_poll_timeout_atomic(gpiod_get_value, val, val <= 0,
+					5, 1000, false, chip->busy_pin);
+		if (val < 0)
+			return val;
+		if (ret)
+			return ret;
 	}
 
 	gpiod_set_value(chip->rdwr_pin, 0);
-- 
2.43.0


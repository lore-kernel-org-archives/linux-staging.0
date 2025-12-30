Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E162773DE
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 20:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767126940; cv=none; b=EE7atE42qpbAtc3xvYBPND+OGLPtkUAxKEtPWv2hNumuIEL/rFwabWtJul/7F2jF/DRR2Vyl7QhXhUeJSUP4SLkAjFIVGqgmMb6mNE4a4yqKPCndbVU2DhHag08dcpbtkcS4TBF7E4QtsdIOZut7zerUN/ee13f9kjDaMlNvCQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767126940; c=relaxed/simple;
	bh=KhOG4N7N+3XuIAad+gpMd5RqaKSj5wsS75InoOIZgYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJBM+lY4cNd2qUiJdDUGs2LkxVx7VYBozmojYwYvqc8ETe3tgWRfUFlN2TTi+tn0UjHJcmYaQhT9Pe3uEf1+Of82rxkrhlDB88bnSlBLsn7g39Mjpw39Vq4CxMpsL8F102zfxA4NEoiY3fK+wwmogKXEnY7ZPvudUunnP7ucZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBqAKVFI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBqAKVFI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f2676bb21so139145835ad.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 12:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767126938; x=1767731738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2JkxCT9+3YP4D28HHgDiKativOskj6ucx01bNwJC+c=;
        b=UBqAKVFI2WgPFA58VXD0R5mB/uRfFnD0M5UGQvdRP8fAhLOe4ulRxBTR37qm2Wh5R5
         0jQ/1x8AZaiGqjj+WtJ4j2TSW+SLt4y4taRy4vcybsa/yfahk7uNRj17kSP4ONJYpWSX
         IFJJsWiVjOO3TOmYtmqaMPjj6MklDtNnRTSHECRQdAukHCdv9Bk7+GAGhrPlRXyzQoAb
         2qXVK4q25wt8ikU51dK9bmjjhnT0gRLBuMwaImRXnLuk5AO4wcywlHoVF6qN6gxd/1eh
         ft4yp5RJOgI4vN8jXXtXlx7MLdoBTzJKUEVjtGrlMlw3oOkoSI4Hj2IYVwqHiAOYp0pO
         IiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767126938; x=1767731738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2JkxCT9+3YP4D28HHgDiKativOskj6ucx01bNwJC+c=;
        b=nM3oxogYs7a4dpeWq62uxEwmAn1rDIen7A5AYhDWlT9WWwIBKyPwalxW3JKwQIOZ9z
         1OOFvlhbULG4leKJSqGy7BluOiy+bKPbL130t7y2efpWmHHgrieNOCs3Z8LYdquB8XLE
         jR3uiXf65EiExGo5QMRZZmooTnDbrL1tqjiXXGjV/rTxWc1/s6mATPvVHLPK4a7PMbGt
         Bes7bvNeGFVmUEbLa9iOTK+3pkHT/ikuMn2VP88+2rfuzHUUZPi9CssF8sWzKpDO5Cbz
         FE95fmaeBsSQeD2nRlk/FcOSwhXz/J49upfMGuzZqGU9Rdzp2n8LYoGIKvPvGD6INMUH
         zCQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHrPWL6XE0qRpCf2OWCC7fFsjcoN8T34llSzwChKkMjHJFaX/82GR1DW5ZEiYvI/YsEMjfiCmC/fYJJDVQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwMj/2AypA/r0qOazEQZboi39igMcIqpkLx6JXAG40Z8U2pZ89f
	n4MxIQyHt4LXQ2PBQp5Ef98rfm4BPY+1jLKCrzGu7J/3k/Kaqzi4UTq0
X-Gm-Gg: AY/fxX4+o+oclqT2Ir40Q5C3ioDZE6zxt6bS1yw7aslEOVNAIkn1RW2InnF5t2dcYst
	Vw7Yl/gJLR3AOcI+3eU91NfqQhlKBLKctmho4gmN/OZu8ORhWGu2iIZ/EA7LrkP3duGEAoBQ6I9
	qoVkGOU4S/1gM5dYJFVNZwgo1Bo8oLv6BPFHLBK2q/VmDp8BOJLru1ucmS62mHEUQMzFoRlMnBO
	g92QdYQGWRk8hm7dkdwyxYx7OKVH1VSpkgkmI/ZrRXkguwZAMUi+gNWcRpAlQ4d4odvpw0TAsNQ
	Yrg5yfiWwFDHIsiPUufgqSKl2FC4nIW1GwEix7jdUduYMA3bIkqYMncg896y3OuXvKUNRnxKg8+
	VCVZpqWEkSbOB25ArMovGmetvH1uoYfdhaCtAMF6VfFgK1AqxNJETO8q+440E/PuqJs7edYKBKz
	sKkloT8MquxBgijgtGq+b7UvDX7aAjkgFUdpib9wcDayK5ut4eO6TuKLl/LUElYQp0196sHwl5G
	ZJPuEcmFJZVVebUmCcDAsLklAVmwU+BCWyJQVe1GDWL82AhIxjGnTaB0zvxGMm1by+iJXRYhxhH
	XoohhsA=
X-Google-Smtp-Source: AGHT+IEr7/wv3OVwsFVrG2Eawia8meD5YSTnGD52R8yUpWj3DwfbpL64WGbA/Oz9enaVheaZVHOF+g==
X-Received: by 2002:a05:7022:6291:b0:119:e569:f61e with SMTP id a92af1059eb24-121722e12e7mr27372018c88.23.1767126937719;
        Tue, 30 Dec 2025 12:35:37 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm128074981c88.9.2025.12.30.12.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:35:36 -0800 (PST)
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
Subject: [PATCH v2 4/6] staging: iio: ad9832: remove dds.h dependency
Date: Tue, 30 Dec 2025 17:34:57 -0300
Message-ID: <20251230203459.28935-5-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230203459.28935-1-tomasborquez13@gmail.com>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dependency on dds.h by converting custom macros to standard IIO
attribute declarations.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 37 +++++++++++---------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 4bb203a67046..aa78973c3a3c 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -24,8 +24,6 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
-#include "dds.h"
-
 /* Registers */
 #define AD9832_FREQ0LL		0x0
 #define AD9832_FREQ0HL		0x1
@@ -238,27 +236,22 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 	}
 }
 
-/*
- * see dds.h for further information
- */
+static IIO_DEVICE_ATTR(out_altvoltage0_frequency0, 0200, NULL, ad9832_write, AD9832_FREQ0HM);
+static IIO_DEVICE_ATTR(out_altvoltage0_frequency1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);
+
+static IIO_DEVICE_ATTR(out_altvoltage0_frequencysymbol, 0200, NULL, ad9832_write, AD9832_FREQ_SYM);
+static IIO_CONST_ATTR(out_altvoltage0_frequency_scale, "1"); /* 1Hz */
+
+static IIO_DEVICE_ATTR(out_altvoltage0_phase0, 0200, NULL, ad9832_write, AD9832_PHASE0H);
+static IIO_DEVICE_ATTR(out_altvoltage0_phase1, 0200, NULL, ad9832_write, AD9832_PHASE1H);
+static IIO_DEVICE_ATTR(out_altvoltage0_phase2, 0200, NULL, ad9832_write, AD9832_PHASE2H);
+static IIO_DEVICE_ATTR(out_altvoltage0_phase3, 0200, NULL, ad9832_write, AD9832_PHASE3H);
+
+static IIO_DEVICE_ATTR(out_altvoltage0_phasesymbol, 0200, NULL, ad9832_write, AD9832_PHASE_SYM);
+static IIO_CONST_ATTR(out_altvoltage0_phase_scale, "0.0015339808"); /* 2PI/2^12 rad */
 
-static IIO_DEV_ATTR_FREQ(0, 0, 0200, NULL, ad9832_write, AD9832_FREQ0HM);
-static IIO_DEV_ATTR_FREQ(0, 1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);
-static IIO_DEV_ATTR_FREQSYMBOL(0, 0200, NULL, ad9832_write, AD9832_FREQ_SYM);
-static IIO_CONST_ATTR_FREQ_SCALE(0, "1"); /* 1Hz */
-
-static IIO_DEV_ATTR_PHASE(0, 0, 0200, NULL, ad9832_write, AD9832_PHASE0H);
-static IIO_DEV_ATTR_PHASE(0, 1, 0200, NULL, ad9832_write, AD9832_PHASE1H);
-static IIO_DEV_ATTR_PHASE(0, 2, 0200, NULL, ad9832_write, AD9832_PHASE2H);
-static IIO_DEV_ATTR_PHASE(0, 3, 0200, NULL, ad9832_write, AD9832_PHASE3H);
-static IIO_DEV_ATTR_PHASESYMBOL(0, 0200, NULL,
-				ad9832_write, AD9832_PHASE_SYM);
-static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
-
-static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
-				ad9832_write, AD9832_PINCTRL_EN);
-static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
-				ad9832_write, AD9832_OUTPUT_EN);
+static IIO_DEVICE_ATTR(out_altvoltage0_pincontrol_en, 0200, NULL, ad9832_write, AD9832_PINCTRL_EN);
+static IIO_DEVICE_ATTR(out_altvoltage0_out_enable, 0200, NULL, ad9832_write, AD9832_OUTPUT_EN);
 
 static struct attribute *ad9832_attributes[] = {
 	&iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
-- 
2.43.0


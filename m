Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A7361943
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459214; cv=none; b=u6r5UPjPgK2ePO1wkoS83cQGt1RRyB4XyKgn7sbNIdD+jZkfjrEadHWCK227Ey+InN1dMI+SbZYYp90WWgBxH3pUDM24dJmFEH1XcM1fjq+n8HIgzgRmsWpaqG9q15ILjpoVyWIBSKmUZPFXMGzdAxGN/ax/mFh4deo2yzgec8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459214; c=relaxed/simple;
	bh=wFxXi8Z9WcIxFPd9fUaEH26jlrgztUaT4NJh8D572Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uK8g27Kvv4wZUPYSogpDlBi/kwZZYMiDAZ1DCNR7GCs4kc0vmN9UUOSikW0IEv2JmDXoltddlnN2kV6HQ9teaUDPLfbxZ/hyMmQX1qeTJ2FpZWN4eAGBCPM2czSknKyzWQiQmRwEwujzW1KI9ZLI3vfZAHI/05XLlvRVn5WEI48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vm7FqXvI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vm7FqXvI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so81665e9.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 01:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459210; x=1790064010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW1ixTgxWimSTTjdthxgReSlmPLPKmDhq2QrwAvzdaI=;
        b=Vm7FqXvIKb/QyuB0zqXtkMYGyfqLcT7MP7UTB58fz3gzy0OuE0CpMBvJDNxOvL6xVW
         xV3r1odz2vSobcXqNEuUrGlQjM0Hxv/EtzHuIR6A/krkJmv+zY90Aw4VmW2ZOv7zEWXi
         5FjY5cyyperRDWA5xehYNsaAqlSInfCFkyS8f/vLpAi8uEqWU15n89dhrG/kU0QntKUG
         WACfoNCHFd4uLfc8yA8Hih6yxNgj4gxUoh8i9xbhKxwCMd4RaLyZGN3gOJHIerdHK6Ig
         44NxdrCKPIC0I3lol9hqmwpBiplVNVRwx9MF7MJ9C3KoCuh0gbMiLh6ykr8uVKc9ZH4b
         0lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459210; x=1790064010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW1ixTgxWimSTTjdthxgReSlmPLPKmDhq2QrwAvzdaI=;
        b=DifBzyD0cwEfJRB06IvYbAn+FIPx8viEQ+iG1z2L8UKshPSSh+0t47eMJZznIAVm3n
         JqWjvOryoRgHOymcO/Ro1b4TjHr757QQSfFMnjfoXi/54RNsJy6QgIAKDh+/CjtB12Gk
         jCNej/a2WPq8ba6uezM8FyFUgA+Ss8f1XSvtirBcbea2F14xjVGElGrRU/fbHLb2YVrW
         03GHO/GEJH6DcXWJ+kJM5LJAWtLUnhYSWq7FAdv/9OY1GUfFl9e/CdvFKlcyuzCm0q4S
         sG4GiICCPqr86MT5d5g4xxAIAAHI4vW32lhxW2kT2gcxxLQy+bAyGP83iUEYFjl5U035
         Ajrw==
X-Forwarded-Encrypted: i=1; AKwUvBwMfKtcnTXBdiJuGT91FRPwTQgkwKa60NNcw2RuVruVrl4Ht4XJ1pvCLVJW1KJ7Spbo7W9WH/pr5ZinUP0M@lists.linux.dev
X-Gm-Message-State: AFuF++lWVhZ+70zo93gXHRwbprXU025JQPAS894HbP0T0RwVcdsUPiCV
	QlX+E6Sam0ugVyOoDLQsskrRX4t0zSI0P9pSdT1uzpkFwj3l+4F/9t8y+9X0aA==
X-Gm-Gg: AYBFou0X/yUT72zVlVqrl6YUTsc7hXsNAscNQEobhXybKO/rJRsgkIkCFzznCosj60p
	x/NwfoPjg4SBGp6SYXRbc2GHmja0xfQion8bXAUIkXNvt6iTQSHw5dKWeRgV6faEfN/LPyv7Tdo
	/dOIU1/BY2bg6vBBFwEmCU/eoOZgmiQLglDfb1he7uYflh7K/SFmWADgpdGmVl4AWzH+f4sN/QK
	2d/579iFs5qjb0XWvGDE8ir5VxtGCa20B9NxNG6xoDYRVm3fjAQnPtQkASMqY7XiEc2tJf8jjhl
	T4n8omYM2gPGCYR8MdL4uunpY64ykGVMCvrV6lJC7WgkIrCknjR7weLYi9rY327DqoORCgwVSPf
	yidG2LSV3HWSp47smaR+xH6wt4eu3F6ctanTC3xjedBILjhR4vePHS3ti+WqaMcvvjjuDkr+sJE
	956oLyIvcujbCKDEbwB1D8XZYtY5PI0ftKwF+eREymgvNo6aWYlo/il9LZybqFvg3yZ80QJaqdZ
	oXYjtbGNvKS/b+4+Bc=
X-Received: by 2002:a05:600c:3548:b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49e822a6d43mr585075e9.30.1789459210180;
        Tue, 15 Sep 2026 01:00:10 -0700 (PDT)
Received: from fedora ([154.182.99.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm64112155e9.15.2026.09.15.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:00:09 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v7 1/3] staging: iio: adc: ad7816: Sort headers alphabetically
Date: Tue, 15 Sep 2026 10:59:37 +0300
Message-ID: <20260915075939.18180-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the include directives alphabetically to improve readability and
maintainability. This is a precursor cleanup patch to prepare for the
addition of new headers in subsequent changes.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 30644d2d7c54..9e43ce83e071 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -5,19 +5,19 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
-#include <linux/gpio/consumer.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/sysfs.h>
 
+#include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/events.h>
 
 /*
  * AD7816 config masks
-- 
2.54.0


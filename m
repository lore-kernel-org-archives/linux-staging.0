Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357318;
	b=pk/Ni/EhJidXPqtdaTp/jS5nbmJBG1uwNn5lb1LUlmOg3II70nAIeN6j07/iFejIqclq
	 CBlYzDqas4eAk9QXIbO2bqu5S/Xwaa7tT5+QY+ehW9JHom9JatYjDtbaXsCKhyuI7zzOn
	 tnBVveUZLZK4J/n4NAM1AAaO1d0cAoEThgzpzSkgdnxHLwrfToVEEvG6Tozy8lLLznDET
	 LJemReQFo2YADPWYiMeV5U2OyVdgFhx+M7mL83h61d8kEuGmxHgDdCPYk/JwlR5HPWI7Q
	 JIJvsj35BcyzzOTAz+Q6J0uXPHCRNJHLsUyb+7aDIWEV48C3kOMD5IUgg69gM2COJbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M1z9/DW1dCHbs+qEJtXcl5om+PqlKumxC7fOSdG5ZB4=;
	b=qgBhPV5AM5pkH0JWPQb31vv6nQQYAWKunTeekhuBiuffm1/uMQyvCke49aI6kB2gY8Yo
	 lNaZdiV0nAc7kap+NWNj08M/28gFIpeZRpifEk7XFvG90jmLIfahBwuRFXqCFQ4cSP/2O
	 7BLwVRFJmXaoIvmFSNYXAtoK4nfgblb53A1x9snebIMQKneFViXbH4pssvgbqaddAOTva
	 UD6xyyTs7bV4PsU3K4jO70beoLb4sv4x6e9M9wSia7mT6Iab5wA7ECVmqaNfil/cbSOvN
	 Zipmtxr3BuWn5ypjQ2AHq6d3PQSPs92it98o1N5sOYrqScGgmE94xNZVw26pGnnL4Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKSCXunz;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4B7606A31C
	for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKSCXunz
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso372889f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793357317; x=1793962117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1z9/DW1dCHbs+qEJtXcl5om+PqlKumxC7fOSdG5ZB4=;
        b=HKSCXunz+NBVqf+8mC8r2MUOFJPkRC+AsaXBhZJhynQqqO+O3S7vRsIcwqAjNsgITb
         gCEGfX40l1HII/hkywgmlTY1JNnroE/rzZMFJT6icjHJ5qxSmNWHlpSshc7YAVdFaTv4
         P6QdmOV/GGWZmox521g7gtrsS4+x1rRjtQu4eql2TG0AkTfkgsRDlwcTGYATiLeieyJ+
         r1XFl35dNrcQ2dzTmclhO2Ns2relVUwY6AJdLlIEhXvQDfM+LHFQywg7fWT1tR4weFBp
         Ak2AEo8xDjAjqSUaHl/R1YQb9quTYd/10lL5kfvP78G06wwFKPU0A1lvYZY9uq77hq2T
         j6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357317; x=1793962117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1z9/DW1dCHbs+qEJtXcl5om+PqlKumxC7fOSdG5ZB4=;
        b=VlsLfG0lUaa0BsZaw+owGDhqNhBqQwkWxzwnEv62d3ww5tMktl8S8TnP6OYUjV+Wpv
         RYJK9MPKF9Z0HuIn2gXCS0XV6qwFHHBE/mxMpRiMS53F9DlPum6oK3n55CT/oPajWfdw
         /9uLLZwLOC/p0t4j6wbgd9p6weGhAVIC9qmnQsFTs6Noic/EK6xYvnkyn7rkLP+8ROjN
         dkJJDOvfgMRwEK5Xevd3SAkEkdWrGm5+vIKb4K0KxAEuzZmMBy/MGqz3u8zeE0ajFhxN
         4pLyv+9XHxVqwTf+6vVc65liWEtXPabUArLlNwVdMVPCLawdZPwwZ9P9Et0KEZHn+/CW
         nytg==
X-Forwarded-Encrypted: i=1; AKwUvBypHRtHFvMQJ0LQ05N5N6+YDNmrsacFirsM/f9W/TebuIL2V6QM72p+zgKSxyNczE2CO9E4krTr9BwbGA6x@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3bIpMWdL2CNXGoOuh6vtxcALJv8QnXDa/FJjAxZH1QSZX+Fay
	XGN1EPtGGDc/Q94dRZsEMZBDicGFV4IvaFxU7Yzya5M8K4LZUcf/v+Jy
X-Gm-Gg: AYBFou0DrJT6JmbCA+sNwk7zFbfarnjmvPwYem8AdKmFajr3o37AxHJpnrzymTEfznK
	knWgJ76IAtFHhHN9uDUZCw6XQ1eUGCch+FLHd9Eloq/WpVfRFi2PnQ+aD0DXNLjz/NoNQBPNR7A
	p/HfEGlIhBZxd4j4CbaAgrA4ipdw5AIQ5PF1kag0ZTXJGLk9QCQXnFCPik+O6VYN4CW3C35fAEz
	TigWmYl6EACiygs325l2mrZ7myrYhiajxnu2x+gKoF9uYZLNzqnnVPkVkx3qtmY92qwGqckSzIC
	1HalnGl5n6luLMAND7EXVokjfsQkxDyQu6K9ZJyETyMx+maVmQ/cvaoJM14+C8601f14kEcsqCT
	pYj8VCO1+jkSQTSQ7AI9eCnd/ZJILvBDtVzh1MKkOkIf6mSXi2DuXDFJM/iaTtR9jz0yzPeqR8K
	v9XaprcifTM5hRWWtJCpz5M4rSus7xBynllKQh2JuJYH7WpOl4sbFH0Ql93Sf4zi2AknSZuzCEj
	XEcO+PRFnqrLxjmYCEBILRYP5666zmvSTVBSAR9I2BtKdL38aGrWYJOP3RNyb3PWu7qBE+2hunQ
	9hIH8QS2SPqolGFf7wQ8h28UNg4ZuD4GR5nBEhq9xyHaIta1+ABXJAZ+qJYO
X-Received: by 2002:a05:6000:4020:b0:48e:791:1cb with SMTP id ffacd0b85a97d-48e6e4f502dmr4669993f8f.35.1793357316844;
        Fri, 30 Oct 2026 03:48:36 -0700 (PDT)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm2240473f8f.59.2026.10.30.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:48:36 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2 2/2] staging: iio: addac: adt7316: explicitly include missing headers and sort
Date: Fri, 30 Oct 2026 12:47:45 +0200
Message-ID: <20261030104745.16693-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
References: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly include <linux/err.h>, <linux/errno.h>, <linux/pm.h>,
<linux/string.h>, and <linux/types.h> for error handling, error codes,
EXPORT_GPL_SIMPLE_DEV_PM_OPS(), memcmp(), and fixed-width types. Drop
unused headers and sort the remaining headers alphabetically.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index d4b759ef637c..54d942cae586 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,23 +5,24 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
-#include <linux/bits.h>
 #include <linux/kstrtox.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/list.h>
-#include <linux/i2c.h>
-#include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
 
-#include <linux/iio/iio.h>
 #include <linux/iio/events.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+
 #include "adt7316.h"
 
 /*
-- 
2.56.0


Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD87E1514D8
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711566616; cv=none; b=oXR+Gg3rJUBHAolayZHwaT3LkZ9nY2ftn/7YZe6n70YLHUL08iIunln65lf/QPe8pYMyDTJN/kJbiGdEW2jpl4Jl5xD31laGHEdA0N1yrQG9nuSCdWwbRjmlrzXojgRHlW3IPLGFTcfIGdhyJn2ce+Ha8/9N1dhWNYts/l9rjt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711566616; c=relaxed/simple;
	bh=2ZKwNze6O6FHYLv0ZmDp5vBMzHN4+fjn61h42zC6U0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gCdcZTneqMFCji23ZCD60gL8vssVJfpA4VDOp3Oy7dT7D9Fv2dvT1IrDXM0HS3NUi9QpehZfN0nj4KJjVxwHL6s6lfCXbWegVnaqAgYW5oD42JHbEQBE8Ym2B9Rn8rrVdV/iXJCOjWxgA2Swt5DSt8IvsvQog8EnAG9ucAfeK74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNPw3prZ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNPw3prZ"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-696925248deso1213926d6.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711566614; x=1712171414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2mei3j/lcrSSTisR+Uqzrn/InZyJ99Sff97ygb+XVk=;
        b=PNPw3prZk9f1PuDrzslBULGCW4l7UJxEsckIJXLH9y9fjKx/7c1iUTl9n6RfPOQvaE
         CnF3UdhGeIySikh8usCLnz3pmdMGr+v4cxSwDbRSo+DyhcKpooDv0QNg1oaDv0yWsfHY
         hDqojHqtmDx4BNgCVdSNKt4VqtYM6JHXGfiXytKzldRHNlhYRtCqxtYQSEw3mziNjCzi
         8ooqwys8tlE74eW5iMYUXZ71pfC2HiwpKTtWkRi3eAFakyu9N7oMdBDacG48si3KGfWa
         GIruTHPDMKTBFYLxgq5NRB68f8grCcdM3trRKDQhgOwUcte+aSvy0lwBs9rvxkgh44eh
         xH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711566614; x=1712171414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2mei3j/lcrSSTisR+Uqzrn/InZyJ99Sff97ygb+XVk=;
        b=JHp2DULmZvCuIL3QmOtFKEdtYAGilJz3FrQT1PCoZgUeolzsQ59moEbVJBjjrqeHZj
         /MAVOkBdb4yiL7L9VYT6Taw+Q2ZD80KmUeO9c23m80GJZGwnSJ5u+haWqR9+4cQEF1VH
         AXQ1KN5d3+8Uu858xYGNLbVIrtoO39lPYDPmFkX7+UGT9R5x0Hz7q0Uju7RvO6P/Fm+1
         dxZEy7MkG94kUhRFAlfPW2/FOtjWMdcl0pb8uCB0FeQyQ3b8JNVVaOnCLoHtKXGoWXam
         lzWhVCb/Olh/vrZ/y7m6XJN7dTO+/MAw68bkituEcpueKuDrTVPPANzRSDpCCPsjUpRe
         AJbw==
X-Gm-Message-State: AOJu0Yw6kBUYMeaBT1GEMAm/02azrnbw7ekLCrPxaa68vZSrQY+ORF1V
	/11wCJS/EO5ZvDGmj3ZSsMJ+jX1PRToTSHhV12EOp2jyEAuYBBsj
X-Google-Smtp-Source: AGHT+IE7DncV9RK/Fz3ApyzCE9YenBkZ2tRm5kS5LFTI0MF4BpFfqfBtyqdxgHF+2EsItosROiEsuA==
X-Received: by 2002:a05:6214:5287:b0:696:77a8:9135 with SMTP id kj7-20020a056214528700b0069677a89135mr515196qvb.32.1711566613832;
        Wed, 27 Mar 2024 12:10:13 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id 10-20020a05621420ea00b00696a1f5dd18sm1784789qvk.116.2024.03.27.12.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:10:13 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] staging: pi433: Use headers in appropriate files.
Date: Wed, 27 Mar 2024 21:10:02 +0200
Message-Id: <20240327191004.619748-2-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327191004.619748-1-ikobh7@gmail.com>
References: <20240327191004.619748-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure rf69.c directly includes rf69_enum.h.
Move rf69_registers.h from header to the relevant source file.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
v2->v3:
        Restore Reviewed-by tag.

 drivers/staging/pi433/pi433_if.c | 1 +
 drivers/staging/pi433/rf69.c     | 1 +
 drivers/staging/pi433/rf69.h     | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 81de98c0245a..0c12b31c4642 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -45,6 +45,7 @@
 
 #include "pi433_if.h"
 #include "rf69.h"
+#include "rf69_registers.h"
 
 #define N_PI433_MINORS		BIT(MINORBITS) /*32*/	/* ... up to 256 */
 #define MAX_MSG_SIZE		900	/* min: FIFO_SIZE! */
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 5a1c362badb6..bf802f097310 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -11,6 +11,7 @@
 #include <linux/units.h>
 
 #include "rf69.h"
+#include "rf69_enum.h"
 #include "rf69_registers.h"
 
 #define F_OSC (32 * HZ_PER_MHZ)
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 76f0f9896a52..dd6fa8af9b9c 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -9,7 +9,6 @@
 #define RF69_H
 
 #include "rf69_enum.h"
-#include "rf69_registers.h"
 
 #define FIFO_SIZE	66		/* bytes */
 
-- 
2.34.1


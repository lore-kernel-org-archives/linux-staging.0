Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3F28DC1
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 06:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521125; cv=none; b=I2Rzb+mSVJCXp5as+hxDpGkWJzwmObnuhO3RlkjZD7/IHSYi7KQJ8mwQPGPnuD28mA2uuFTOGpnXRMnoRTlJBqYGlqGFOR6C6ZAIQwDpINHX9umsRZ5vEExST7DvpQsPCH0I7eAIvtkLXYrtWS0EwcET5lZqRaTvIcnQttRLJeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521125; c=relaxed/simple;
	bh=g0sSGIMqyKUaiS52PdHmmBKpieJXgizPR34GFcX8YuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KMAlQdH6PXlCELypUp8PEQT4rhN1yr6XgKB3p5UBpd3IBO9+bAcDMpZ+FUVUcPrdwXnrQySMpx2GMojcnS1+FeFzPhsbPAMxTHvxBU8ncWo+bj7hry2YJJjYB8dG/2qJN40JQUhmGheKVtrVAH8DEC0+gY+H9nn/yw+YznHgNQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLBKJFiO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLBKJFiO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4148d1b4a26so10864795e9.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711521122; x=1712125922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whnwm9LIuo5d0uvegSBW2q/SblIdBsUkDXDYlxzepdo=;
        b=cLBKJFiOzYIJrH53CC0plOIRSawFppEruWH87LwPN4fuse2nVRGY4t8zdYRI19yhgG
         Lrt1zXnGi7W3iQE68qs1/4NA0SxNdZ50IJrJFrnwRX3Z7uRGCQGtoz5ZbTATE8FngvEK
         pysRVl6pEaK/V4FU4jgTWRaSt/Pih/FTw61RJtwaacntygeqyR6iFmrFOyF3scIdiSy3
         uB2Vk9gK3OYvDC//OnCclnnvKtL2101jFHAd+ZvaKLDFAHw+r149thxeRWI9Us3BW2Ua
         iqooBMQoo1VqJ+6UYjBpokOXTf0vDqnfO3flgqKBnGkmOtqMmzkzTN7V3Qnw62sSziAL
         zKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521122; x=1712125922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whnwm9LIuo5d0uvegSBW2q/SblIdBsUkDXDYlxzepdo=;
        b=nLCzJNd43xVBfJfFJRxOo+jqA7PPwo6dkUv/uO+rOdUy3y9xoReXRGDgCK4GYfvdju
         GXJ1Ci8WiC1MItPsNQPfEN8nY8Z3vunoz4kDuYFdLqKYhEUcj4FgYRj0T0SmG/5ocKQg
         8U+YzxU7puTPSPddJuHMCE50LxoQ3LQRI3VcrGemNQe6wkHoiLO94/oUeP6CWgio/+Qs
         w58JtW2o2cKTAkgpBj+OUFUEfYCXCMVg2fHVSt3dJvdYfubR+EU0do26TU/2ra7uSSCh
         YQguhaaBn9Z01scpWhlicH8ocQJbiSwzTlLnaDlzRKvJfWIMOVT5ediPj6Hwlv84gM51
         l9eA==
X-Gm-Message-State: AOJu0Ywl69DjZruBS89Y0Gfubb4oK5wmVymkX8OqAEKYKpObdwcJiXCF
	JFwo4jOcHeyAZ++6/r+CHrWwmJZGhfzGD0DJ+SvDARvFJ/nAzTG1
X-Google-Smtp-Source: AGHT+IGes5ccq4PCuu2spSfU5275eZvzHgzi4yKRnYKokfZdh61J8I6mlla6YrnebB3xll9qjGnxhw==
X-Received: by 2002:a05:600c:3555:b0:414:a8d:ca39 with SMTP id i21-20020a05600c355500b004140a8dca39mr2222097wmq.6.1711521122370;
        Tue, 26 Mar 2024 23:32:02 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c139600b004148d7b889asm1121360wmf.8.2024.03.26.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:32:01 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: pi433: Remove an inaccurate comment.
Date: Wed, 27 Mar 2024 08:31:55 +0200
Message-Id: <20240327063156.96307-3-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327063156.96307-1-ikobh7@gmail.com>
References: <20240327063156.96307-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment specified the wrong number represented by the macro.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
v2: Undo macro change. Remove comment instead.

 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 0c12b31c4642..ec9f07a4f769 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -47,7 +47,7 @@
 #include "rf69.h"
 #include "rf69_registers.h"
 
-#define N_PI433_MINORS		BIT(MINORBITS) /*32*/	/* ... up to 256 */
+#define N_PI433_MINORS		BIT(MINORBITS)
 #define MAX_MSG_SIZE		900	/* min: FIFO_SIZE! */
 #define MSG_FIFO_SIZE		65536   /* 65536 = 2^16  */
 #define FIFO_THRESHOLD	15		/* bytes */
-- 
2.34.1


Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0761C69A
	for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708882433; cv=none; b=DAiK7C9ih1Q66QCrq7Xgv5xJWHYTjo28G1TF7Mh/hCmit5X0QQNRnehulkBTzl9pPq3z4aMfyG5SvahYhl+AdkemgTvYM34EEprB7BVv4pR90wTazEp3eDQ8+JCXqXk3ClcDX9fA57wuB6EUMWW8Am2kFzI7ynvc1IgjFts7ln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708882433; c=relaxed/simple;
	bh=TDp9wJFgJFP1/5qnvZLn+D5nq97yBt9qKvB9FbuNoGU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ApFmZ7tfZRmSgqOORn/DPdeDxjS/HVNrRwuPckDAizat6XYd4PtCaEbVnLrbeqIKN43qrBfBuGtOGDK/HH1attxhQIWUPR/aq2n1LOVVZEKlIRctIRUYdkIvzuOC5m21equX+6os6bMCJiIWu8u+w26JiZQAktpj5+kJSompZto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiV2jn3v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiV2jn3v"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412a57823b3so95255e9.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708882430; x=1709487230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxPiVCr0B1dvFMvQofRHKAWb8GEUA/MUQ1QDdLDBjQY=;
        b=XiV2jn3vwMk/kyd0JZjlWtm2MF/a+Kfxq/QbTK3alvTuuiMR5KaA116v+61xbNYJGZ
         x7zxuNtdBroPYp5dvdxVLaVFNuUy+41QbqSZ0rm/+tMui22SEOlzZi2UfbL7dF+qlzTR
         Rk7dxX6lKXoKLC7U3vebsH5/KuPAJ1DFkuvFihAhDNVqRkTFX8dufWh0NfjVFkmiusGt
         NE1NHpdSSF8+ov05cj2J1ZkUwEgz3f15iQpW8dwgKT5GWtQiZtrKfWfBS2bJPluAViCb
         a3wNjICCWX4YBgJlVBCXs8MfrO1Sa6/aCTfit6CwP+azG1w/IJOW17OuSjPfgpFfQAbe
         C+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708882430; x=1709487230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxPiVCr0B1dvFMvQofRHKAWb8GEUA/MUQ1QDdLDBjQY=;
        b=DVS6AJyL+g++VQK8scXf3L77j25Z7NjMmACvyeBHvPGsHI5/b+Yv596urcUDczENdh
         0Vcf45G7K/RN35d9VY1LROoMpUJV0R/FDityn1NeVjZErsU3TwuTnuBILraYUtKxS4Z6
         8HQXmYWjaDMzbX9uiIigHNr0cho62eGDmdt5gywdvU+56VSgFn2NUk9Y5F7S99BwPVum
         kh5hEilFwZ8F9pKvOg1LyyI5xJ3VNVEaki3OPW2+G5AHYiIWdJphMAhieNMwedYDzISC
         mtUGrFcIITSzT6OaAXFAT4L3L0AahXqaaXSbKqTZTqBpc2hkvBkhE3FLMuwLwaYsF1+J
         tPOA==
X-Gm-Message-State: AOJu0YzGuWzFfuemy8N9EEHn8sJYVkr+vjtc9vxb03RCi4rTaEAraS8r
	qrHL/4TRiqmSJ4nGv03J/a6uyD67vnDQ0HkdDoP/gFB+EbEG8XtC
X-Google-Smtp-Source: AGHT+IHanCuwRE7xw5G8B5NKLZXGJUPdG0ikeirrDEkNe42/zl1H3JHvTpS51Qh4TDMqfcM77dd7EQ==
X-Received: by 2002:a05:600c:3595:b0:412:a22a:c12a with SMTP id p21-20020a05600c359500b00412a22ac12amr1431655wmq.0.1708882430192;
        Sun, 25 Feb 2024 09:33:50 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:79c9:6db8:8198:3c60])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b00410bca333b7sm9400108wmc.27.2024.02.25.09.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 09:33:49 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: pi433: Move FIFO_THRESHOLD define to source file
Date: Sun, 25 Feb 2024 19:33:41 +0200
Message-Id: <20240225173341.1278918-5-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240225173341.1278918-1-ikobh7@gmail.com>
References: <20240225173341.1278918-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIFO_THRESHOLD is only being used by pi433_if.c source file

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 drivers/staging/pi433/rf69.h     | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 0ec3130225db..b6c4917d515e 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -49,6 +49,7 @@
 #define N_PI433_MINORS		BIT(MINORBITS) /*32*/	/* ... up to 256 */
 #define MAX_MSG_SIZE		900	/* min: FIFO_SIZE! */
 #define MSG_FIFO_SIZE		65536   /* 65536 = 2^16  */
+#define FIFO_THRESHOLD	15		/* bytes */
 #define NUM_DIO			2
 
 static dev_t pi433_dev;
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index e63e87fd6cce..76f0f9896a52 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -12,7 +12,6 @@
 #include "rf69_registers.h"
 
 #define FIFO_SIZE	66		/* bytes */
-#define FIFO_THRESHOLD	15		/* bytes */
 
 u8 rf69_read_reg(struct spi_device *spi, u8 addr);
 int rf69_get_version(struct spi_device *spi);
-- 
2.34.1


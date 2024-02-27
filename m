Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6597153BEF
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071856; cv=none; b=tFUwb1rBvAUGWfSFoGrnBdZ1isDrpRz4cQ9aZi3hDlnF/zn9q90aWBofKViThFZgipnn3YF9H/LFDAnxsz9G6XF8tZ2QWDJlmygoDXA4wDeEf/Qd7osA4OWIV2/kBZNi168ijNCPDMePY6N5r3YpuZw4R0+gybNpxzvEv0bY9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071856; c=relaxed/simple;
	bh=6ysg+o0Q0vjgeb3Ub2WmvlFjV3vQ+V2XEH/LWmQtAJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F0jfaKtm4+5JjrtlY93v5vF4hw6p1+U4LxgkOY6UHaJ6DkyV8jEf+DS5g5MLGVMDDzF58uYzqzh698piZU0tead10dt5bYhJrzpLK9GK0QuiHJHRe6PmJTnTdTjY7KZmvru5kgZ0gAkGd5j/grArERIfrRYyKAYi6UOoxiNmGXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzJw2c6F; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzJw2c6F"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33dc3fe739aso141007f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071853; x=1709676653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j82VF811BuKi5ly+pi6Q+j5FxiMcza1ds+iHobKFqbw=;
        b=PzJw2c6F494tjRlwcuUX1cjCGRufzwEbJvcTpkeN9iD8JFhZnVL3NQcEjnStojcfe9
         qlPY63VcYtUvhRExq57T8Yi4gWl/6rIqpV7F4JyVuQMyBRr01ud8rIDL4ZNDxj8UaGgX
         cbDktQnyVpbdpK+7ttkpUO2WFcuFzApxJS/k8+ViPWtBxpu89+BsZhQEAENz7Inluoi0
         YD55RwxWbt913h0TEUKN8nnLcic+DW8ldB4CufxNHUkIRc7JS+xe2o4ENEtHkLbT2Zi2
         zbWfFULllsj40TNG3MMnVmhxZh3ch7ShorXrIi/OD4X2yppV15uDAP4UyX7qmesi/6qj
         Zgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071853; x=1709676653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j82VF811BuKi5ly+pi6Q+j5FxiMcza1ds+iHobKFqbw=;
        b=QPjR1AZwMjw5yz3Vla5p78QngFaJxO0hfOHWur6XaY3ganUQ7NBYBGkfEUNrQXYa0x
         q2okEQxeo803ExaXBdDLVTKECFkZY0znmFxyzpyqkrTMIj2u8hInjEj/XnBKdWmr8kc2
         Kep8CtH4j1btqKLsdl8Mil3HvQRVzbMNkNc/xPNpuq3bFkntwlTo+7J1d1jyislKtD6L
         f8s2yBu7EfVX+jyXkAncpVLEcyz7aBadeZ2Mk4c2w8Jkac85zIXB3fwqryDjhXBSX59e
         HPxcD/PiexCj+XAblnIq1QzpPFyD6f83lSa09WkUquJd1lJ0TBwIkdOy/mDXu18RBOqY
         PDug==
X-Gm-Message-State: AOJu0YzjX5CZWOLRGkKEpmMnUqaQJehuXVggKvlewq/jhETdcBC/pMew
	vyYuFJWuRAdK+U2lRrbHA9q6ETy+P76qw5fhlmFyHPKk9TnlffAW
X-Google-Smtp-Source: AGHT+IFnm5CgoXpjkoOGc+8NXxBEfljeWrLa1V6gUofvLnYG1AdqxRTRaIhPDPhqxbYMDfZu+me7OA==
X-Received: by 2002:a5d:50c5:0:b0:33d:545b:a33e with SMTP id f5-20020a5d50c5000000b0033d545ba33emr521008wrt.13.1709071853541;
        Tue, 27 Feb 2024 14:10:53 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b0033cf5094fcesm12562384wrc.36.2024.02.27.14.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:10:52 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] staging: pi433: Move FIFO_THRESHOLD define to source file
Date: Wed, 28 Feb 2024 00:10:43 +0200
Message-Id: <20240227221043.532938-6-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221043.532938-1-ikobh7@gmail.com>
References: <20240227221043.532938-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIFO_THRESHOLD is only being used in pi433_if.c source files.

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


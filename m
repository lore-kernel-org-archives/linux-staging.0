Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103D3264A61
	for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 11:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739533668; cv=none; b=S7xI3UpPRT17uEMKBQJmd9IwCIoXqXsqq7mqUSBnP6ekRfo3+6amvNbYwXPbvm2QqMmqqGQrSy0zMoc0TFUkhVly9ZANyjXNZkF6VVjjwmEL3bs3N4jzff3uxMHc5Z3ZgTRQPFpJA4dVAqQW+l8z9nIK1xJ7sCx/2mz5RF6m3Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739533668; c=relaxed/simple;
	bh=otW1RJyE4F3ikNxsbuQW9V3/snb/w7z5xN/QWk8BC4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEBRAQiobroWr2qkPBOI62SXHQlDZqEOTUemMI953EoOUQ37lB47gPeyUCr20zfiy9nRzSryeGqy5gxxeSLdzrc8+VmJIWGDOMBJUomSCiQ1vF9FlL5NVNa61B7JiCkncup0QxIISKlzyYX9ZfGlZ4AfnFF5DGfl/rCCbOxprNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7s5vm4p; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7s5vm4p"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4396a82daf5so3328225e9.1
        for <linux-staging@lists.linux.dev>; Fri, 14 Feb 2025 03:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739533664; x=1740138464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVmtBhEiVyNl8QZ1O6tERZVz1PTbfN4nkq7rh5ldJZo=;
        b=g7s5vm4pXIutV/oOQr63TcvzNvJDIf1+JQaYpEnzX1MHFWx1j5dzMQsNQhS/wGHTJn
         A4O7mMpLIn/0XkPra9Y+dOX6XHiraFqLVlGaXZSqX8zL606ROdXZb2A/JZDQVEpJg2NN
         cVG2ci8+LHBuvqDZ3AJWzT3MQgX6oDaBWP9W9uhUn4naxdsf2T3xCsLesUlFqX0G9XI4
         aBpZjqv3t2KBUG7rWN7M3I6CaEGpoYjkYJbQ9E/DYJWOIVrbF0MO7jLzOh7RqQbqMO6I
         INV9dEjWTxtCTkKEusZcgtmXWxMoliaCj1GSb3p8+obgJT0lT8GDultE9ko4EJtlzqbd
         /9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533664; x=1740138464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVmtBhEiVyNl8QZ1O6tERZVz1PTbfN4nkq7rh5ldJZo=;
        b=v18sQFrENwsxwn+uLuB/EmBFaMeWuswoQERhe4WGbpaYSJrz0g4fLnKLuEF1MYCtNo
         vjBuTa1dpc+iemR5qmIU6KLEQYlsW9P9cs90Xv0csCe/r1E/aUUkC6/dYvinaJpPiU44
         f1TZMiGIaaHtp3DGIFQQ4SmjJPAXVArU9Ua/zS7tcawsb/04TFBQNKe7fUtBf5Kakb1L
         1FZnr3Adxorcw1zNt9P0D+RiMQy6Q96w289cV8WG2Z+akJVgvzSv/vtrzAv0ymh7v1Bw
         5FbAtNgt3pTrpIznU+zIi/5Wc8WXLNSzEb0sd4kL1n3nRtx1IXx1PIOEqSZOVBajg5ZN
         Ka4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvLmTtTWrrWtNUZ3y+zuWC/CdwSs4H8Kaq+pnTqskLb2Q7EmsnnKVdFG50BmgolQXOW96RlxxXk/U4DbFw@lists.linux.dev
X-Gm-Message-State: AOJu0YzTvmT+y/BlnTH4tO1qqZ2zUZV5mPKlQeiotdgHVWLUCABKHZXA
	9Chf7h9RufBeqH2M/6xoHskviuQMr7KwGBw96qA+mCbirY2hfAMTdY8pCg==
X-Gm-Gg: ASbGncv6p6yJxgorNgSQBYtTUpdGf7ViZaLuIfhW8TUcqoEq9ZIOXxZLZFHA7u3O1ja
	biFp0jMLUPF4PrSR8nA7QhVyy37oPvbyjXBPYcOxBF30N904/pYQIPBjvBH4u5M4jR76HybTlW3
	tPBDVj4hBcVZkheAzsHhDZNgHS1GI313guiyE1gks+yvc43olFcvxj7rbEiNe+BtdOCkdNEU9Am
	zZrw1pnxitQiwfJbr1zrOx+OTQkLQMHd21Fy5TDfFF9JoLenx41gu8Is1YOjMae37lPbavkzNWT
	VfkLOvyX3RQzmS1w2n8Yq8WugCRsecx1Kz0++OlsdwFqtUzFElc=
X-Google-Smtp-Source: AGHT+IHJe9C5L7fJm3g1s0tX91oj/gwWsIwn+t9Y/6w2fpyFGBvil/NIo8HpbEWwojtJCTK1tz+sJQ==
X-Received: by 2002:a05:600c:c14:b0:439:63cb:ff7e with SMTP id 5b1f17b1804b1-43963cc00d4mr82079965e9.10.1739533664177;
        Fri, 14 Feb 2025 03:47:44 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fccfesm41945245e9.11.2025.02.14.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:47:43 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 09/17] staging: gpib: hp82335 console messaging cleanup
Date: Fri, 14 Feb 2025 12:47:00 +0100
Message-ID: <20250214114708.28947-10-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214114708.28947-1-dpenkler@gmail.com>
References: <20250214114708.28947-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable module name to be printed in pr_xxx and dev_xxx
Use DRV_NAME defined as KBUILD_MODNAME instead of hard coded
string "hp82335" in request_irq

Change pr_err to dev_err wherever possible

Remove pr_info's

Remove "hp83335:" prefix in messages since this is
printed with the module name.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 451d5dc6d340..982544d1b382 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -8,6 +8,10 @@
  *	implement recovery from bus errors (if necessary)
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define dev_fmt pr_fmt
+#define DRV_NAME KBUILD_MODNAME
+
 #include "hp82335.h"
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -274,26 +278,23 @@ static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config
 	case 0xfc000:
 		break;
 	default:
-		pr_err("hp82335: invalid base io address 0x%u\n", config->ibbase);
+		dev_err(board->gpib_dev, "invalid base io address 0x%x\n", config->ibbase);
 		return -EINVAL;
 	}
 	if (!request_mem_region(upper_iomem_base, hp82335_upper_iomem_size, "hp82335")) {
-		pr_err("hp82335: failed to allocate io memory region 0x%lx-0x%lx\n",
-		       upper_iomem_base, upper_iomem_base + hp82335_upper_iomem_size - 1);
+		dev_err(board->gpib_dev, "failed to allocate io memory region 0x%lx-0x%lx\n",
+			upper_iomem_base, upper_iomem_base + hp82335_upper_iomem_size - 1);
 		return -EBUSY;
 	}
 	hp_priv->raw_iobase = upper_iomem_base;
 	tms_priv->mmiobase = ioremap(upper_iomem_base, hp82335_upper_iomem_size);
-	pr_info("hp82335: upper half of 82335 iomem region 0x%lx remapped to 0x%p\n",
-		hp_priv->raw_iobase, tms_priv->mmiobase);
 
-	retval = request_irq(config->ibirq, hp82335_interrupt, 0, "hp82335", board);
+	retval = request_irq(config->ibirq, hp82335_interrupt, 0, DRV_NAME, board);
 	if (retval) {
-		pr_err("hp82335: can't request IRQ %d\n", config->ibirq);
+		dev_err(board->gpib_dev, "can't request IRQ %d\n", config->ibirq);
 		return retval;
 	}
 	hp_priv->irq = config->ibirq;
-	pr_info("hp82335: IRQ %d\n", config->ibirq);
 
 	tms9914_board_reset(tms_priv);
 
@@ -331,7 +332,7 @@ static int __init hp82335_init_module(void)
 	int result = gpib_register_driver(&hp82335_interface, THIS_MODULE);
 
 	if (result) {
-		pr_err("hp82335: gpib_register_driver failed: error = %d\n", result);
+		pr_err("gpib_register_driver failed: error = %d\n", result);
 		return result;
 	}
 
-- 
2.48.1

